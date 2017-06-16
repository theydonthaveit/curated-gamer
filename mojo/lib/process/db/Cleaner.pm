package Cleaner;
use strict;
use warnings;
use HTML::TokeParser::Simple;
use HTML::Lint;
use Web::Scraper;
use Data::Dumper;
use List::MoreUtils qw(uniq);
use Moo;
use namespace::clean;

# TODO sent HAS properties

sub run
{
    my $self = shift;
    my $html = shift;

    unless ( $html =~ m/<\w+>/g )
    {
        return $html;
    }

    my $cleansed_data =
        _class_html(
            _loop_through_tags(
                _understand_html_content( $html )));

    unless ( $cleansed_data->{status} eq 'success' )
    {
        return 'FAILED_INPUT';
    }

    return $cleansed_data->{result};
}

sub _understand_html_content
{
    my $html = shift;

    my $tags_retrieved;

    my $p = HTML::TokeParser::Simple->new( string => $html );

    while ( my $token = $p->get_tag )
    {
        next unless $token->is_start_tag;
        push @{ $tags_retrieved }, $token->get_tag;
    }

    return {
        status => 'success',
        completed => 1,
        declined => 0,
        result =>  $tags_retrieved,
        html_content => $html
    };
}

sub _loop_through_tags
{
    my $args = shift;

    unless ( $args->{status} eq 'success' )
    {
        return {
            status => 'fail',
            completed => 0,
            declined => 1,
            result =>  undef
        }
    }
    my $res;

    @{$res} =
        map {
            _class_html_content(
                $_,
                $args->{html_content} )
        } uniq @{$args->{result}};

    return {
        status => 'success',
        completed => 1,
        declined => 0,
        result =>  $res
    };
}

sub _class_html_content
{
    my $tag = shift;
    my $html_content = shift;

    my $scrapped;

    if ( $tag )
    {
        my $scraper =
            scraper {
                process $tag,
                    'text[]' => 'TEXT',
                    'class[]' => '@class',
                    'links[]' => '@href',
                    'sources[]' => '@src';
            };

        $scrapped =
            $scraper->scrape($html_content);
    }
    else
    {
        $scrapped = $html_content;
    }

    return $scrapped;
}

sub _class_html
{
    my $args = shift;

    unless ( $args->{status} eq 'success' )
    {
        return {
            status => 'fail',
            completed => 0,
            declined => 1,
            result =>  undef
        }
    }

    my $data;

    foreach my $arr_elem ( @{$args->{result}} )
    {
        while ( my ( $k, $v ) = each %$arr_elem )
        {
            push @{ $data->{$k} },
                grep { _cleanse($_) } @$v;
        }
    }

    delete $data->{class};

    return {
        status => 'success',
        completed => 1,
        declined => 0,
        result =>  $data
    };
}

sub _cleanse
{
    my $val = shift;

    if ( defined $val )
    {
        $val =~ s/^\s+|\s+$//g;
        $val =~ s/^GIF$|^GIF\s+$//g;
        $val =~ s/^Advertisement$//g;
    }

    return $val if defined;
}

1;

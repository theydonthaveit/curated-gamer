package MineArticles;
use strict;
use warnings;
use experimental;

use Data::Dumper;
use Mojo::Base 'Mojo';
use JSON qw( from_json to_json );
use Web::Scraper;

use ScrapeStructure::Gamespot;
use ScrapeStructure::Ign;
use ScrapeStructure::Gamefaq;
use ScrapeStructure::Kotaku;
use ScrapeStructure::Nfourq;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my $content = shift;
    my $type = shift;
    my $site = shift;

    my $manipulated_html =
        understand_content(
            scrape(
                follow_link(
                    $content, $type ),
                    $site ));

    return {
        html => $manipulated_html
    }
}

sub follow_link
{
    my $url = shift;

    my $ua =
        Mojo::UserAgent->new();

    my $tx = $ua->get($url);
    my $res = $tx->success;

    if ( $res->is_success )
    {
        return {
            body => $res->body
        };
    }
    else
    {
        my ( $err, $code ) = $tx->error;

        return {
            error => "ATTENTION!! FAILURE TO RETRIEVE $err",
            code => $code
        }
    }
}

sub scrape
{
    my $content = shift;
    my $package = shift;

    return $package->new->article_scrape($content)
}

sub understand_content
{
    my $content = shift;

    my $struct;

    foreach (@{$content->{content}})
    {
        push @$struct, search_amazon_db($_);
    }

    return $struct;
}

sub search_amazon_db
{
    my $content = shift;

    # search for product via amazon product API
    if ( $content =~ m/(Ubisoft)/ )
    {
        my $amazon_url =
        'https://www.amazon.com/Video-Games-Ubisoft/s?ie=UTF8&page=1&rh=n%3A468642%2Cp_4%3AUbisoft';

        my $link =
            add_anchor_tags(
                $1,
                $amazon_url,
                $content );

        return $link;
    }

    return '<p>'.$content.'</p>';
}

sub add_anchor_tags
{
    my $content = shift;
    my $url = shift;
    my $line = shift;

    my $link =
        '<a href="'
        . $url
        . '">'
        . $content
        . '</a>';

    $line =~ s/$1/$link/g;

    return '<p>'.$line.'</p>';
}

1;

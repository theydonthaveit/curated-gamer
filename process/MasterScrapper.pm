package MasterScrapper;
use strict;
use warnings;
use experimental;

use Data::Dumper;
use Mojo::Base 'Mojo';

use JSON qw( from_json to_json );

use Web::Scraper;

use Moo;
use namespace::clean;

no if ($] >= 5), 'warnings' => 'experimental';

sub run
{
    my $self = shift;
    my %args = @_;

    my $content_article =
        $self->request_content(
            $args{articles}
        );
    my $content_review =
        $self->request_content(
            $args{reviews}
        );

    my $info_article =
        $self->retrieve_info(
            content => $content_article,
            site => $args{site}
        );
    my $info_review =
        $self->retrieve_info(
            content => $content_review,
            site => $args{site}
        );

    return {
        articles => from_json($info_article),
        reviews => from_json($info_review)
    };
}

sub request_content
{
    my $self = shift;
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

sub retrieve_info
{
    my $self = shift;
    my %args = @_;

    my $res;

    if ( $args{content}->{body} =~ m/<\w+>/ )
    {
        $res =
            $self->site_scrapper(
                content => $args{content}->{body},
                site => $args{site}
            );
    }
    else
    {
        $res = $args{content}->{body};
    }

    return $res;
}

sub site_scrapper
{
    my $self = shift;
    my %args = @_;
    my $scraper;

    given ( my $site = $args{site} )
    {
        when ( $site eq 'ign' )
        {
            $scraper =
                scraper
                {
                    process 'div[class="topgames-module"]', $args{site} =>
                    scraper
                    {
                        process 'div[class="games"] div[class="column-game"]', "articles[]" =>
                        scraper
                        {
                            process 'div div[class="game-details-content"] a[class="game-title"]', url => '@href';
                            process 'div div[class="game-details-content"] a[class="game-title"]', title => 'TEXT';
                            process 'a[class="rating"]', rating => 'TEXT';
                        };
                    }
                };
        }
        default
        {
            die 'fuck this shit';
        }
    }

    my $res =
        $scraper->scrape($args{content});

    return to_json($res);
}

1;

package MasterScrapper;
use strict;
use warnings;
use experimental;

use Data::Dumper;
use Mojo::Base 'Mojo';
use JSON qw( from_json to_json );
use Web::Scraper;

use process::ScrapeStructure::Gamespot;
# use process::ScrapeStructure::Ign;
# use process::ScrapeStructure::Gamefaq;
# use process::ScrapeStructure::Kotaku;
# use process::ScrapeStructure::Nfourq;

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
            type => 'article',
            content => $content_article,
            site => $args{site}
        );
    my $info_review =
        $self->retrieve_info(
            type => 'review',
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

    my $tx =
        $ua->get(
            $url =>
                { 'User-Agent' => 'googlebot.com' } );

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
                type => $args{type},
                content => $args{content}->{body},
                site => $args{site}
            );
    }
    else
    {
        $res = 'error';
    }

    return $res;
}

sub site_scrapper
{
    my $self = shift;
    my %args = @_;

    my $site = $args{site};

    my $scraper =
        $site->new->feed_scrape(
            $site,
            $args{type}
        );

    my $res =
        $scraper->scrape($args{content});

    return to_json($res);
}

1;

package Scrape;
use strict;
use warnings;

use XML::Feed;
# use Data::Dumper;
use File::Find::Rule;
use Mojo::Base 'Mojo';
# use Mojo::JSON qw( from_json );

use Project::Libs lib_dirs => [qw(mojo)];

use Moo;
use namespace::clean;

my @LOG;

# TODO set HAS properties

my $urls =
{
    IgnArticles => 'http://feeds.ign.com/ign/articles?format=xml',
    # IgnReviewsVideo => 'http://feeds.ign.com/ign/video-reviews?format=xml',
    # IgnReviewsWritten => 'http://feeds.ign.com/ign/reviews?format=xml',
    # GamespotArticles => 'https://www.gamespot.com/feeds/news/',
    # GamespotReviews => 'https://www.gamespot.com/feeds/reviews/',
    # GamespotVideos => 'https://www.gamespot.com/feeds/video/',
    # Kotaku => 'http://kotaku.com/vip.xml',
    # N4gAll => 'http://n4g.com/rss/news?channel=&sort=latest',
    # N4gTech => 'http://n4g.com/rss/news?channel=tech&sort=latest',
    # N4gNextGen => 'http://n4g.com/rss/news?channel=next-gen&sort=latest',
    # N4gDev => 'http://n4g.com/rss/news?channel=dev&sort=latest',
    # EscapeArticles => 'http://rss.escapistmagazine.com/articles/0.xml',
    # EscapeNews => 'http://rss.escapistmagazine.com/news/0.xml',
    # PcGamer => 'https://disqus.com/home/forum/pcgamerfte/'
};

retrieve_content(retrieve_feed(is_it_available($urls)));

sub is_it_available
{
    my $urls = shift;
    my $available_sites;

    while ( my ($k, $v) = each %$urls )
    {
        if (Mojo::UserAgent->new()->get($v)->success->is_success)
        {
            $available_sites->{$k} = $v;
        }
    }

    return $available_sites;
}

sub retrieve_feed
{
    my $available_sites = shift;
    my $site_content;

    %$site_content = map {
        $_ =>
            XML::Feed->parse(
                URI->new( $available_sites->{$_} ))
    } keys %$available_sites;

    return $site_content;
}

sub retrieve_content
{
    my $feed_hash = shift;
    my $retrieve_hash;

    %$retrieve_hash = map {
        $_ =>
            run_scrape(
                find_file($_),
                $_,
                $feed_hash->{$_} )
    } keys %$feed_hash;

    return $retrieve_hash;
}

sub find_file
{
    my $partial_name = shift;

    my $file_obj = File::Find::Rule->file();
    $file_obj->name("$partial_name")->in('/Users/alanwilliams/Documents/personal/curated_gamer/lib/process/scrappers/');

    return $file_obj;
}

sub run_scrape
{
    my $file = shift;
    my $site_name = shift;
    my $site_content = shift;

    my $scraper =
        $file->{'rules'}->[1]->{'args'}->[0];

    eval "require process::scrappers::$scraper";

    my $content =
        $scraper->new(
            site_name => $site_name,
            site_content => $site_content
        )->run;

    return $content;
}

1;

package Scrape;
use strict;
use warnings;

use XML::Feed;
use Data::Dumper;
use File::Find::Rule;
use Mojo::Base 'Mojo';
use Mojo::JSON qw( from_json );

use Moo;
use namespace::clean;

my $urls =
{
    # IgnArticles => 'http://feeds.ign.com/ign/articles?format=xml',
    # IgnReviewsVideo => 'http://feeds.ign.com/ign/video-reviews?format=xml',
    # IgnReviewsWritten => 'http://feeds.ign.com/ign/reviews?format=xml',
    # GamespotArticles => 'https://www.gamespot.com/feeds/news/',
    # GamespotReviews => 'https://www.gamespot.com/feeds/reviews/',
    GamespotVideos => 'https://www.gamespot.com/feeds/video/',
    # KOTAKU => 'http://feeds.kinja.com/kotaku/vip',
    # N4G => 'http://n4g.com/rss/news?channel=&sort=latest',
    # ESCAPE_ARTICLES => 'http://rss.escapistmagazine.com/articles/0.xml',
    # ESCAPE_NEWS => 'http://rss.escapistmagazine.com/news/0.xml',
    # PC_GAMER => 'https://disqus.com/home/forum/pcgamerfte/'
};

sub retrieve_feed
{
    my $url_hash = shift;
    my $site_content;

    %$site_content = map {
        $_ =>
            XML::Feed->parse(
                URI->new( $url_hash->{$_} ))
    } keys %$url_hash;

    return $site_content;
}

sub retrieve_content
{
    my $feed_hash = shift;
    my $retrieve_hash;

    %$retrieve_hash =
        map {
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
        $scraper->run(
            $site_name,
            $site_content );

    return $content;
}

my $things = retrieve_content(
    retrieve_feed($urls) );

print $things;
1;

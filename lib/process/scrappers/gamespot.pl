#!/usr/bin/env perl
use strict;
use warnings;

use process::MasterScrapper;
use db::Insert;
use Data::Dumper;

my $url_reviews =
    'https://www.gamespot.com/';
my $url_articles =
    'https://www.gamespot.com/#recent';

my $db_ready_content =
    MasterScrapper->new->run(
        articles => $url_articles,
        reviews => $url_reviews,
        site => 'Gamespot'
    );

Insert->new->run_articles(
    site => 'Gamespot',
    type => 'articles',
    data => $db_ready_content->{articles},
    site_url => $url_reviews
);

Insert->new->run_reviews(
    site => 'Gamespot',
    type => 'reviews',
    data => $db_ready_content->{reviews},
    site_url => $url_reviews
);

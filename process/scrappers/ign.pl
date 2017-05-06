#!/usr/bin/env perl
use strict;
use warnings;

use lib 'process', '../db';
use MasterScrapper;
use Insert;
use Data::Dumper;

my $url_articles =
    'https://newsapi.org/v1/articles?source=ign&sortBy=top&apiKey='
    .'134d407b37e244a197b52d4470919081';

my $url_reviews = 'http://uk.ign.com/';

my $db_ready_content =
    MasterScrapper->new->run(
        articles => $url_articles,
        reviews => $url_reviews,
        site => 'ign'
    );

Insert->new->run_articles(
    site => 'ign',
    type => 'articles',
    data => $db_ready_content->{articles}
);

Insert->new->run_reviews(
    site => 'ign',
    type => 'reviews',
    data => $db_ready_content->{reviews}
);

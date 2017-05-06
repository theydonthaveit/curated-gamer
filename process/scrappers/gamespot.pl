#!/usr/bin/env perl
use strict;
use warnings;

use lib 'process';
use MasterScrapper;
use Insert;

my $url =
    'https://www.gamespot.com/';

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

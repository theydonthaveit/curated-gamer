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
        reviews => $url_reviews
    );
print Dumper($db_ready_content);

# Insert->new->run(
#     site => 'ign',
#     type => 'articles',
#     data => $db_ready_content
# )

#!/usr/bin/env perl
use strict;
use warnings;

use lib 'process';
use MasterScrapper;

my $url =
    'https://www.gamespot.com/';

my $db_ready_content =
    MasterScrapper->new->run($url);

Insert->new->run(
    site => 'gamespot',
    type => 'articles',
    data => $db_ready_content
)

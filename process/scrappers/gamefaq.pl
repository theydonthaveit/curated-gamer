#!/usr/bin/env perl
use strict;
use warnings;

use lib 'process';
use MasterScrapper;

my $url =
    'https://www.gamefaqs.com/';

MasterScrapper->new->run($url);

#!/usr/bin/env perl
use strict;
use warnings;

use lib 'process';
use MasterScrapper;

my $url =
    'http://www.kotaku.co.uk/';

MasterScrapper->new->run($url);

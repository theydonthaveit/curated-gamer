#!/usr/bin/env perl
use strict;
use warnings;

use lib 'process';
use MasterScrapper;

my $url =
    'http://n4g.com/';

MasterScrapper->new->run($url);

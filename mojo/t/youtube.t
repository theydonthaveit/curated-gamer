use strict;
use warnings;

use Project::Libs lib_dirs => [qw(mojo)];
use Data::Dumper;
use Test::More;
use process::utils::relevenatcontent::Youtube;

my $yt =
    Youtube->new(
        channel_id => 'UCTlVz6WP_SsLRt663JqP6lw',
        order => 'date'
    );
my $thing = $yt->retrieve;
# print $yt->result_related;
# print $yt->result_article;

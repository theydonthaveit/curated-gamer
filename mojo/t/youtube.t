use strict;
use warnings;

use Project::Libs lib_dirs => [qw(mojo)];
use Data::Dumper;
use Test::More;
use process::utils::relevenatcontent::Youtube;
use process::utils::relevenatcontent::YoutubeBuild;

my $yt =
    Youtube->new(
        channel_id => 'UCTlVz6WP_SsLRt663JqP6lw',
        order => 'date'
    );

# my $video_id = $yt->retrieve->retrieve_video_id;
# my $channel_id = $yt->retrieve->retrieve_channel_id;

# print $yt->result_related;
# print $yt->result_article;

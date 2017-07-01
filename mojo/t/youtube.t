use strict;
use warnings;

use Project::Libs lib_dirs => [qw(mojo)];
use Data::Dumper;
use Test::More;
use process::utils::relevenatcontent::Youtube;
use process::utils::relevenatcontent::YoutubeBuild;

my $yt =
    Youtube->new(
        search_param => "Zelda: Find All the DLC Chests With Our Interactive Map"
    );

my $video_id = $yt->retrieve->result_article("Zelda: Find All the DLC Chests With Our Interactive Map");
print Dumper $video_id;
# my $channel_id = $yt->retrieve->retrieve_channel_id;

# print $yt->result_related;
# print $yt->result_article;

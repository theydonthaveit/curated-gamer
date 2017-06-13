package Concurrent;
use strict;
use warnings;

use process::utils::GameInfo;
use process::utils::Reddit;
use process::utils::Twitter;
use process::utils::Instagram;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my $game_title = shift;

    my $gameinfo = GameInfo->run($game_title);

    my $twitter = Twitter->run($game_title);
    my $instagram = Instagram->run($game_title);
    my $reddit = Reddit->run($game_title);

    return ( $gameinfo , $twitter, $instagram, $reddit );
}

1;

package GameInfo;

use Mojo;
use Data::Dumper;
use JSON;
use Project::Libs lib_dirs => [qw(mojo)];

use process::db::Select;

use Moo;
use namespace::clean;

has game_title => ( is => 'ro' );

sub run
{
    my $self = shift;

    my ( $publisher, $developer, $rating );

    my $db_content =
        Select->run(
            db => 'INFO',
            collection => 'GAME',
            game_title => $self->game_title,
            filter => 'name' );

    return {
        publisher => $db_content->{publisher},
        developer => $db_content->{developer},
        rating => $db_content->{rating}
    };

    # search game title in mongodb
    #
    # if not present
    #     reach out to steam app list
    #     find
    #     if found
    #         update mongodb
    #         and use info
    #     else
    #         use review_aggregator package
    #
    # use appid found
    #     retrieve game data from steam_db_info

    # my $url = 'https://steamdb.info/search/';
    # my $param =
    # {
    #     a => 'app',
    #     q => $game_title,
    #     type => 1,
    #     category => 0
    # };
}

1;

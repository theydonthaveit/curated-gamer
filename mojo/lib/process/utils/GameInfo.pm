package GameInfo;

use Mojo;
use Data::Dumper;

use process::db::Select;
use process::db::Insert;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my $game_title = shift;

    search game title in mongodb

    if not present
        reach out to steam app list
        find
        if found
            update mongodb
            and use info
        else
            use review_aggregator package

    use appid found
        retrieve game data from steam_db_info

    # my $url = 'https://steamdb.info/search/';
    # my $param =
    # {
    #     a => 'app',
    #     q => $game_title,
    #     type => 1,
    #     category => 0
    # };
    my $url = '';
    my $ua =
        Mojo::UserAgent->new();

    my $tx = $ua->get( $url );

    my ( $publisher, $developer, $rating );
    return $tx->res->json;
    # return {
    #     publisher => $publisher,
    #     developer => $developer,
    #     rating => $rating
    # };
}

sub add_to_db
{
    my $game_info = shift;

    Insert->steam_game_list($game_info);
}

sub steam_app_list
{https://api.steampowered.com/ISteamApps/GetAppList/v2/?key=D6A86A7084297049001524BF99C0B86B&format=json}

sub steam_db_info
{https://steamdb.info/app/389730/}

1;

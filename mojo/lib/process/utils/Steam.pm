package Steam;

use Project::Libs lib_dirs => [qw(mojo)];

use process::db::Insert;
use process::db::Drop;

use Mojo;
use Moo;
use namespace::clean;

sub steam_app_list
{
    my $api_key = 'D6A86A7084297049001524BF99C0B86B';

    my $url =
        "https://api.steampowered.com/ISteamApps/GetAppList/v0001/";

    my $params =
    {
        key => $api_key,
        format => 'json'
    };

    my $ua = Mojo::UserAgent->new();
    my $tx =
        $ua->get(
            $url => form => $params );

    my $json = $tx->res->json;

    Drop->drop_collection(
        db => 'STEAM',
        collection => 'APPS'
    );

    foreach ( @{$json->{'applist'}->{'apps'}->{'app'}} )
    {
        $_->{'name'} = lc($_->{'name'});

        Insert->new(
            db => 'STEAM',
            collection => 'APPS',
            json => $_
        )->steam_game_list;
    }
}

1;

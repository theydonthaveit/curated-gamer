package Insert;
use strict;
use warnings;

use process::db::Cleaner;
use MongoDB;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my %args = @_;

    my $client =
        MongoDB->connect();

    my $content =
        $args{db}
        .'.'
        .$args{collection};

    my $collection = $client->ns($content);

    $collection->insert_one({
        id => $args{id},
        title => $args{title},
        description =>
            Cleaner->run(
                $args{description} ),
        link => $args{link},
        (
            defined $args{content}
            ? ( content =>
                    Cleaner->run(
                        $args{content}) )
            : ( content => undef )
        ),
        youtube => $args{youtube} // '',
        instagram => $args{instagram} // '',
        twitter => $args{twitter} // '',
        reddit => $args{reddit} // ''
    });
    
    # ADD SOME LOGGING
}

sub steam_game_list
{
    my $self = shift;
    my $json_content = shift;

    my $client =
        MongoDB->connect();

    my $content =
        $args{db}
        .'.'
        .$args{collection};

    my $collection = $client->ns($content);

    $collection->insert_one({$json_content});

    # ADD SOME LOGGING
}

1;

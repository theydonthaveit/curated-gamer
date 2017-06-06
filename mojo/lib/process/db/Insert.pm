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
        )
    });
}

1;

package Drop;
use strict;
use warnings;

use MongoDB;

use Moo;
use namespace::clean;

sub drop_collection
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
    $collection->drop;
}

1;

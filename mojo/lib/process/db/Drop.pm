package Drop;
use strict;
use warnings;

use MongoDB;

use Moo;
use namespace::clean;

has db => ( is => 'ro' );
has collection => ( is => 'ro' );

sub drop_collection
{
    my $self = shift;

    my $client =
        MongoDB->connect();

    my $content =
        $self->db
        .'.'
        .$self->collection;

    my $collection = $client->ns($content);
    $collection->drop;
}

1;

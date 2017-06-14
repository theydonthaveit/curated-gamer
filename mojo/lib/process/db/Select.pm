package Select;

use strict;
use warnings;

use MongoDB;

use Moo;
use namespace::clean;

has db =>
    ( is => 'ro' );
has collection =>
    ( is => 'ro' );
has game_title =>
    ( is => 'ro' );
has filter =>
    ( is => 'ro' );

sub run
{
    my $self = shift;

    my $client =
        MongoDB->connect();

    my $content =
        $self->db
        . '.'
        . $self->collection;

    my $collection = $client->ns($content);

    return $collection->find_one(
        $self->filter,
        $self->game_title );
}

1;

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

sub create
{
    my $self = shift;

    my $client =
        MongoDB->connect();

    my $content =
        $self->db
        . '.'
        . $self->collection;

    return $client->ns( $content );
}

sub retrieve_articles
{
    my $self = shift;
    my $collection = shift;

    return $collection->find( $self->filter );
}

# sub retrieve_games
# {
#     # return $collection->find_one(
#     #     $self->filter,
#     #     $self->game_title );
# }

1;

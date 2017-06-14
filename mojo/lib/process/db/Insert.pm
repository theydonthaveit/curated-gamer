package Insert;
use strict;
use warnings;

use process::db::Cleaner;
use MongoDB;

use Moo;
use namespace::clean;

has db => ( is => 'rw' );
has collection => ( is => 'rw' );
# has id => ( is => 'rw' );
# has title => ( is => 'rw' );
# has description => ( is => 'rw' );
# has link => ( is => 'rw' );
# has content => ( is => 'lazy' );
# has instagram => ( is => 'rw' );
# has twitter => ( is => 'rw' );
# has reddit => ( is => 'rw' );
has json => ( is => 'ro' );

# sub run
# {
#     my $self = shift;
#     my %args = @_;
#
#     my $client =
#         MongoDB->connect();
#
#     my $content =
#         $args{db}
#         .'.'
#         .$args{collection};
#
#     my $collection = $client->ns($content);
#
#     $collection->insert_one({
#         id => $args{id},
#         title => $args{title},
#         description =>
#             Cleaner->run(
#                 $args{description} ),
#         link => $args{link},
#         (
#             defined $args{content}
#             ? ( content =>
#                     Cleaner->run(
#                         $args{content}) )
#             : ( content => undef )
#         ),
#         instagram => $args{instagram} // '',
#         twitter => $args{twitter} // '',
#         reddit => $args{reddit} // ''
#     });
#
#     # ADD SOME LOGGING
# }

sub steam_game_list
{
    my $self = shift;

    my $client =
        MongoDB->connect();

    my $content =
        $self->db
        . '.'
        . $self->collection;

    my $collection = $client->ns($content);

    $collection->insert_one({
        appid => $self->json->{appid},
        name => $self->json->{name}
    });
}

1;

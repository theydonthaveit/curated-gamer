package Insert;
use strict;
use warnings;

use Project::Libs lib_dirs => [qw(mojo)];

use process::utils::relevenatcontent::Youtube;
use process::db::Cleaner;
use MongoDB;

use Moo;
use namespace::clean;

has db => ( is => 'rw' );
has collection => ( is => 'rw' );
has id => ( is => 'rw' );
has title => ( is => 'rw' );
has description => ( is => 'rw' );
has link => ( is => 'rw' );
has content => ( is => 'lazy' );
has instagram => ( is => 'rw' );
has twitter => ( is => 'rw' );
has reddit => ( is => 'rw' );
has youtube => ( is => 'rw' );
has json => ( is => 'ro' );

sub run
{
    my $self = shift;
    my %args = @_;

    my $client =
        MongoDB->connect();

    my $content =
        $self->db
        .'.'
        .$self->collection;

    my $collection = $client->ns($content);

    $collection->insert_one({
        id => $self->id,
        title => $self->title,
        description =>
            Cleaner->run(
                $self->description ),
        link => $self->link,
        (
            defined $self->content
            ? ( content =>
                    Cleaner->run(
                        $self->content) )
            : ( content => undef )
        ),
        youtube => get_video($self->title, $self->db) // '',
        instagram => $self->instagram // '',
        twitter => $self->twitter // '',
        reddit => $self->reddit // ''
    });

    # ADD SOME LOGGING
}

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

sub get_video
{
    my $title = shift;
    my $brand = shift;

    my $yt = Youtube->new( search => $title, brand => $brand );

    return $yt->result;
}

1;

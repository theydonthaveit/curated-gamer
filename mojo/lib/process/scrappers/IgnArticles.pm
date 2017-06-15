package IgnArticles;

use strict;
use warnings;

use Project::Libs lib_dirs => [qw(mojo)];

use process::db::Insert;
use process::db::Drop;
# use Data::Dumper;
use XML::Simple;
use Data::Structure::Util qw( unbless );

use Moo;
use namespace::clean;

has site_name => ( is => 'ro' );
has site_content => ( is => 'ro' );

sub run
{
    my $self = shift;

    my $db = 'IGN';
    my $type = 'ARTICLES';

    Drop->new(
        db => $db,
        collection => $type
    )->drop_collection;

    my $id;
    foreach ( $self->site_content->entries )
    {
        unbless $_;
        my $base = $_->{'entry'};

        Insert->new(
            id => $id++,
            db => $db,
            collection => $type,
            title => $base->{'title'},
            description => $base->{'description'},
            link => $base->{'link'},
            (
                defined $base->{'content'}->{'encoded'}
                ? ( content => $base->{'content'}->{'encoded'} )
                : ( content => $base->{'description'} )
            )
        )->run;
    }
}

1;

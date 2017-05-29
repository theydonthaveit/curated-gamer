package IgnReviewsWritten;
use strict;
use warnings;

use process::db::Insert;
use process::db::Drop;
use XML::Simple;
use Data::Structure::Util qw( unbless );

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my $site_name = shift;
    my $site_content = shift;

    my $db = 'IGN';
    my $type = 'NEWS';

    Drop->drop_collection(
        db => $db,
        collection => $type );

    foreach ( $site_content->entries )
    {
        unbless $_;
        my $base = $_->{'entry'};

        Insert->run(
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
        )
    }
}

1;

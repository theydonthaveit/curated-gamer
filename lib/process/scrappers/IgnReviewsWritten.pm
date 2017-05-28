package IgnReviewsWritten;
use strict;
use warnings;

use process::Insert;
use XML::Simple;
use Data::Dumper;
use Data::Structure::Util qw( unbless );

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my $site_name = shift;
    my $site_content = shift;

    my $db = 'IGN';

    foreach ( $site_content->entries )
    {
        unbless $_;
        my $base = $_->{'entry'};

        Insert->run(
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

    exit;
}

1;

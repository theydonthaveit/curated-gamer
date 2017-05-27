package GamespotVideos;
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

    foreach ( $site_content->entries )
    {
        unbless $_;
        my $base = $_->{'entry'};

        Insert->run(
            title => $base->{'title'},
            content => $base->{'description'},
            link => $base->{'link'},
            (
                defined $base->{'content'}->{'encoded'}
                ? ( description => $base->{'content'}->{'encoded'} )
                : ( description => $base->{'title'} )
            )
        )
    }

    exit;
}

sub get_video
{
    my $link = shift;

    my $ua = LWP::UserAgent();
    

    return $video_link;
}

1;

package GamespotVideos;
use strict;
use warnings;

use process::Insert;
use XML::Simple;
use LWP::UserAgent;
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
            image =>
                get_image(
                    $base->{'description'} ),
            link => $base->{'link'},
            (
                defined $base->{'content'}->{'encoded'}
                ? ( description => $base->{'content'}->{'encoded'} )
                : ( description =>
                        get_description(
                            $base->{'description'} ))
            )
        )
    }

    exit;
}

sub get_image
{
    my $image_tag = shift;

    $image_tag =~ m/(<img src=")(.*?)(" width=\"\d+?\" height=\"\d+?\" \/>)/;

    return $2;
}

sub get_description
{
    my $image_tag = shift;

    $image_tag =~ s/<img.*?>\s//g;

    return $image_tag;
}

1;

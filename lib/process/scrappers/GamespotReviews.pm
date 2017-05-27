package GamespotReviews;
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
        print Dumper remove_bad_content($base->{'description'});
        Insert->run(
            title => $base->{'title'},
            content =>
                remove_bad_content(
                    $base->{'description'} ),
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

sub remove_bad_content
{
    my $content = shift;

    $content =~ s/(<figure.*?>.*?<\/figure>)(<figure data-embed-type.*?>.*?<\/figure>)//g;

    return $content;
}

1;

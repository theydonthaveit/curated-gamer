package GamespotReviews;
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

    my $db = 'GAMESPOT';
    my $type = 'REVIEWS';

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
}

sub remove_bad_content
{
    my $content = shift;

    $content =~ s/(<figure.*?>.*?<\/figure>)(<figure data-embed-type.*?>.*?<\/figure>)//g;

    return $content;
}

1;

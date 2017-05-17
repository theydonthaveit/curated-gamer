package Insert;
use strict;
use warnings;

use Data::Dumper;
use process:MineArticles;
use MongoDB;
use Time::Local;
use WWW::Shorten 'TinyURL', ':short';

use Moo;
use namespace::clean;

sub run_articles
{
    my $self = shift;
    my %args = @_;

    my $client =
        MongoDB->connect();

    my $db =
        $client->get_database( $args{site} );
    my $data =
        $db->get_collection( $args{type} );

    foreach my $content ( @{$args{data}->{articles}} )
    {
        my $link_to_mine = append_site($content->{url}, $args{site_url});

        my $published_at_epoch;
        if ( $content->{publishedAt} )
        {
            my ($y,$mo,$d,$h,$m,$s) =
                split(/-|T|:/, $content->{publishedAt});
            $published_at_epoch =
                timelocal($s,$m,$h,$d,$mo,$y);
        }

        $data->insert_one({
            site =>
                $args{site},
            type =>
                $args{type},
            title =>
                $content->{title},
            summary =>
                $content->{description},
            link =>
                $link_to_mine,
            image =>
                $content->{urlToImage},
            date =>
                $published_at_epoch,
            author =>
                $content->{author},
            html_content =>
                MineArticles->new->run(
                    $link_to_mine,
                    args{type},
                    $args{site} )
        });
    }
}

sub run_reviews
{
    my $self = shift;
    my %args = @_;

    my $client =
        MongoDB->connect();

    my $db =
        $client->get_database( $args{site} );
    my $data =
        $db->get_collection( $args{type} );

    foreach my $content (@{$args{data}->{$args{site}}->{reviews}})
    {
        my $link_to_mine = append_site($content->{url}, $args{site_url});

        $data->insert_one({
            site =>
                $args{site},
            type =>
                $args{type},
            title =>
                $content->{title},
            link =>
                $link_to_mine,
            rating =>
                $content->{rating},
            html_content =>
                MineArticles->new->run(
                    $link_to_mine,
                    args{type},
                    $args{site} )
        });
    }
}

sub append_site
{
    my $link = shift;
    my $site = shift;

    unless ( $link =~ m/wwww|http|https/ )
    {
        $link =
            $site
            . $link;
    }

    if ( $link =~ m/([^:])\/\// )
    {
        $link =~ s/([^:])\/\//$1\//g;
    }

    return short_link($link);
}

1;

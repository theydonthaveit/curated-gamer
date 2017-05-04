package Insert;
use strict;
use warnings;

use Data::Dumper;
use MongoDB;
use Time::Local;

use Moo;
use namespace::clean;

sub run
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
        my ($y,$mo,$d,$h,$m,$s) =
            split(/-|T|:/, $content->{publishedAt});
        my $published_at_epoch =
            timelocal($s,$m,$h,$d,$mo,$y);

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
                $content->{url},
            image =>
                $content->{urlToImage},
            date =>
                $published_at_epoch,
            author =>
                $content->{publishedAt}
        });
    }

    return 1;
}

1;

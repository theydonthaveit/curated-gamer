package Select;
use strict;
use warnings;

use Data::Dumper;
use MongoDB;

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

    return 1;
}

1;

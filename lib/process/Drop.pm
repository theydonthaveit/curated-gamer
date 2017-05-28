package Drop;
use strict;
use warnings;

use MongoDB;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my %args = @_;

    my $client =
        MongoDB->connect();
        $client->get_database( $args{db} )->drop;
}

1;

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

    my $content =
        $args{site}
        .'.'
        .$args{type};

    my $collection = $client->ns($content);

    return $collection;
}

1;

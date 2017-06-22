package YoutubeBuild;

use Moo;
use namespace::clean;

# EXPERIMENTAL

has input => (is => 'rw');

sub BUILDARGS
{
    my ($class, %params) = @_;

    foreach my $k ( keys %{$params{input}} )
    {
        $params{$k} = $params{input}->{$k};
    }

    return \%params;
}

1;

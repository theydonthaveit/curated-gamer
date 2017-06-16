package CuratedGamer;
use Mojo::Base 'Mojolicious';
use Data::Dumper;
# This method will run once at server start
sub startup {
    my $self = shift;

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/api/V1/sites/ign/articles')->to('ign#articles');
}

1;

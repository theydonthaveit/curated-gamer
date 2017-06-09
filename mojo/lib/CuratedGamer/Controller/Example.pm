package CuratedGamer::Controller::Example;

use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome
{
    my $self = shift;

    $self->render(
        template => 'example/welcome',
        format => 'html',
        handler => 'ep'
    );
}

1;

package CuratedGamer::Controller::Ign;

use lib 'db';
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use Select;

# This action will render a template
sub home
{
    my $self = shift;

    my $content =
        Select->new->run(
            site => 'ign',
            type => 'reviews'
        );

    my $result = $content->find({
        site => 'ign'
    })->result;

    $self->render(
        template => 'ign/home',
        review => $result
    );
}

1;

package CuratedGamer::Controller::Gamespot;

use lib 'db';
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use Select;

# This action will render a template
sub home
{
    my $self = shift;

    my $content_rew =
        Select->new->run(
            site => 'gamespot',
            type => 'reviews'
        );
    my $content_art =
        Select->new->run(
            site => 'gamespot',
            type => 'articles'
        );

    my $result_rew = $content_rew->find({
        site => 'gamespot'
    })->result;

    my $result_art = $content_art->find({
        site => 'gamespot'
    })->result;

    my $result = {
        review => $result_rew,
        article => $result_art
    };

    $self->render(
        template => 'gamespot/home',
        review => $result
    );
}

1;

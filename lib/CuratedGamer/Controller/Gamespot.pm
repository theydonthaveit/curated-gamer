package CuratedGamer::Controller::Gamespot;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::Util 'encode';
use Data::Dumper;
use db::Select;

# This action will render a template
sub home
{
    my $self = shift;

    my $content_rew =
        Select->new->run(
            site => 'Gamespot',
            type => 'reviews'
        );
    my $content_art =
        Select->new->run(
            site => 'Gamespot',
            type => 'articles'
        );

    my $result_rew = $content_rew->find({
        site => 'Gamespot'
    })->result;

    my $result_art = $content_art->find({
        site => 'Gamespot'
    })->result;

    my $result = {
        review => $result_rew,
        article => $result_art
    };

    $self->render(
        template => 'gamespot/home',
        format => 'html',
        auto_escape => 1,
        review => $result
    );
}

1;

package CuratedGamer::Controller::Ign;

use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use db::Select;

# This action will render a template
sub home
{
    my $self = shift;

    my $content_rew =
        Select->new->run(
            site => 'ign',
            type => 'reviews'
        );
    my $content_art =
        Select->new->run(
            site => 'ign',
            type => 'articles'
        );

    my $result_rew = $content_rew->find({
        site => 'ign'
    })->result;

    my $result_art = $content_art->find({
        site => 'ign'
    })->result;

    my $result = {
        review => $result_rew,
        article => $result_art
    };

    $self->render(
        template => 'ign/home',
        review => $result
    );
}

1;

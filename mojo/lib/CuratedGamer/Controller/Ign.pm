package CuratedGamer::Controller::Ign;

use Project::Libs lib_dirs => [qw(mojo)];
use Data::Dumper;
use Mojo::Base qw(Mojolicious::Controller Mojolicious::Controller::REST);
use JSON;
use process::db::Select;

# This action will render a template
sub articles
{
    my $self = shift;
    $self->res->headers->cache_control('no-cache');
    $self->res->headers->access_control_allow_origin('*');

    my $select = Select->new(
        db => 'IGN',
        collection => 'ARTICLES'
    );

    my $result =
        $select->retrieve_articles(
            $select->create );

    my $articles;

    @{$articles} =
        map {
            +{
                id => $_->{id},
                title => $_->{title},
                description => $_->{description},
                content => $_->{content},
                link => $_->{link}
            }
        } $result->result->all;

    $self->render(
        json => {
            articles => $articles }
    );
}

1;

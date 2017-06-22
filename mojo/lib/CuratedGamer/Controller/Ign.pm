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

sub article
{
    my $self = shift;
    $self->res->headers->cache_control('no-cache');
    $self->res->headers->access_control_allow_origin('*');

    my $select = Select->new(
        db => 'IGN',
        collection => 'ARTICLES',
        filter => {
            id => int($self->stash('id'))
        }
    );

    my $result =
        $select->retrieve_article(
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

# { "content" : { "sources" : [ ],
# "links" : [ "https://twitter.com/insomniacgames/status/875370488251301888",
# "http://www.ign.com/articles/2017/06/13/spider-man-ps4-coming-in-2018-features-miles-morales-and-peter-parker",
# "http://www.ign.com/articles/2017/06/17/e3-2017-marvels-spider-man-for-ps4-will-feature-alternate-spidey-suit-options" ],
# "text" : [
#     "Marvel's Spider-Man, the upcoming PS4 title from developer Insomniac Games, will feature alternate outfits. ",
#     "The official Insomniac Twitter account replied fan who asked if the game will feature multiple Spidey suits, providing a simple but affirmative \"Yes.\" ",
#     "There were no hints as to what variations we may see in the game or how they may be unlocked or applied.
#     We do, however, know that Ultimate Spider-Man, Miles Morales and Peter Parker will all be featured in the game. ",
#     "Continue reading…", "Twitter", "Ultimate Spider-Man, Miles Morales and Peter Parker will all be featured", "Continue reading…" ] }

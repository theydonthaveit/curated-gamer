package MasterScrapper;
use strict;
use warnings;

use Data::Dumper;
use Mojo::Base 'Mojo';

use JSON qw( from_json );

use Web::Scraper;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my %urls = @_;

    # my $content_article = $self->request_content($urls{articles});
    my $content_review = $self->request_content($urls{reviews});

    # my $info_article = $self->retrieve_info($content_article);
    my $info_review = $self->retrieve_info($content_review);

    return {
        # articles => $info_article,
        reviews => $info_review
    };
}

sub request_content
{
    my $self = shift;
    my $url = shift;

    my $ua =
        Mojo::UserAgent->new();

    my $tx = $ua->get($url);
    my $res = $tx->success;

    if ( $res->is_success )
    {
        return {
            body => $res->body
        };
    }
    else
    {
        my ( $err, $code ) = $tx->error;

        return {
            error => "ATTENTION!! FAILURE TO RETRIEVE $err",
            code => $code
        }
    }
}

sub retrieve_info
{
    my $self = shift;
    my $content = shift;

#     if (from_json($content->{body})){
#     return from_json($content->{body})
# }
    my $res = ign_scrapper($content->{body});
}

sub ign_scrapper
{
    my $content = shift;

    my $scraper =
        scraper
        {
            process 'div[class="topgames-module"]', main =>
            scraper
            {
                process 'div[class="games"] div[class="column-game"]', "games[]" =>
                scraper
                {
                    process 'div div[class="game-details-content"] a[class="game-title"]', link => '@href';
                    process 'div div[class="game-details-content"] a[class="game-title"]', title => 'TEXT';
                    process 'a[class="rating"]', rating => 'TEXT';
                };
            }
        };

    my $res =
        $scraper->scrape($content);

    my $reviews;

    foreach my $link ( @{$res->{main}->{games}} )
    {
        $reviews =
        {
            link => $link->{link},
            title => $link->{title},
            rating => $link->{rating}
        }
    }

    print Dumper($reviews);
}

1;

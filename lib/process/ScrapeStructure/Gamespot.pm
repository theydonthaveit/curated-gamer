package Gamespot;
use strict;
use warnings;
use experimental;

use Data::Dumper;
use Mojo::Base 'Mojo';

use JSON qw( from_json to_json );

use Web::Scraper;

use Moo;
use namespace::clean;

sub article_scrape
{
    my $self = shift;
    my $content = shift;
    my $scraper;

    unless ( defined $content->{body} )
    {
        return $content;
    }

    if ( $type eq 'articles')
    {
        $scraper =
            scraper
            {
                process 'article section div[class="js-content-entity-body"] p', "content[]" => 'TEXT';
            };
    }
    else
    {
        $scraper =
            scraper
            {
                process 'article section div[class="js-content-entity-body"] p', "content[]" => 'TEXT';
            };
    }

    my $res =
        $scraper->scrape($content->{body});

    return $res;
}

sub feed_scrape
{
    my $self = shift;
    my $site = shift;
    my $type = shift;

    my $scraper;

    if ( $type eq 'article' )
    {
        $scraper =
            scraper
            {
                process 'section[class="editorial river js-load-forever-container"]', $site =>
                scraper
                {
                    process 'article', "articles[]" =>
                    scraper
                    {
                        process 'a', url => '@href';
                        process 'a div h3', title => 'TEXT';
                        process 'a div p', title => 'TEXT';
                        process 'a figure div img', image => '@src';
                    };
                }
            };
    }
    else
    {
        $scraper =
            scraper
            {
                process 'ol[class="reviews-list"]', $site =>
                scraper
                {
                    process 'li[class="reviews-list__item"]', "reviews[]" =>
                    scraper
                    {
                        process 'a', url => '@href';
                        process 'a div h4', title => 'TEXT';
                        process 'a div dl dt', rating => 'TEXT';
                    };
                }
            };
    }

    return $scraper;
}

1;

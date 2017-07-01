use strict;
use warnings;

use Mojo::Base 'Mojo';
use Mojo::Util 'url_escape';
use Mojo::JSON qw( from_json );
use Mojo::DOM::HTML;
use Web::Scraper;
use URI;
use Encode;

use Data::Dumper;

use MongoDB;

sub request
{
    my $url = 'https://socialblade.com/youtube/top/category/games';
    my $ua =
        Mojo::UserAgent->new();

    my $tx = $ua->get($url);
    my $res = $tx->success;

    if ( $res->is_success )
    {
        my $resp =
            $res->dom->at('div[id="BodyContainer"]');
        my $html = Mojo::DOM::HTML->new;
        $html->parse($resp);

        my $tree = $html->tree;
        foreach (@{$tree})
        {
            print $_;
        }
    }
    #     my $exchange_rate =
    #         $tree->[1]->[5]->[6]->[4]->[1];
    #
    #     if ( $exchange_rate =~ /\d/ )
    #     {
    #         return {
    #             xml => $exchange_rate
    #         };
    #     }
    #
    #     return {
    #         error => 'ATTENTION!! NO EXCHANGE RATE, BROKEN SCRAPE'
    #     };
    # }
    # else
    # {
    #     my ( $err, $code ) = $tx->error;
    #
    #     return {
    #         error => "ATTENTION!! FAILURE TO RETRIEVE $err",
    #         code => $code
    #     }
    # }
}

request();

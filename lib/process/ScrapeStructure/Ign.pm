# package Ign;
# use strict;
# use warnings;
# use experimental;
#
# use Data::Dumper;
# use Mojo::Base 'Mojo';
#
# use JSON qw( from_json to_json );
#
# use Web::Scraper;
#
# use Moo;
# use namespace::clean;
#
# sub article_scrape
# {
#     my $self = shift;
#     my $content = shift;
#     my $scraper;
#
#     unless ( defined $content->{body} )
#     {
#         return $content;
#     }
#
#     if ( $type eq 'articles')
#     {
#         $scraper =
#             scraper
#             {
#                 process 'article section div[class="js-content-entity-body"] p', "content[]" => 'TEXT';
#             };
#     }
#     else
#     {
#         $scraper =
#             scraper
#             {
#                 process 'article section div[class="js-content-entity-body"] p', "content[]" => 'TEXT';
#             };
#     }
#
#     my $res =
#         $scraper->scrape($content->{body});
#
#     return $res;
# }
#
# sub feed_scrape
# {
#     my $self = shift;
#     my $site = shift;
#     my $type = shift;
#
#     my $scraper;
#
#     $scraper =
#         scraper
#         {
#             process 'div[class="topgames-module"]', $site =>
#             scraper
#             {
#                 process 'div[class="games"] div[class="column-game"]', "reviews[]" =>
#                 scraper
#                 {
#                     process 'div div[class="game-details-content"] a[class="game-title"]', url => '@href';
#                     process 'div div[class="game-details-content"] a[class="game-title"]', title => 'TEXT';
#                     process 'a[class="rating"]', rating => 'TEXT';
#                 };
#             }
#         };
#
#     return $scraper;
# }
#
# 1;

package CuratedGamer::Controller::Ign;

use Project::Libs lib_dirs => [qw(mojo)];

use Mojo::Base qw(Mojolicious::Controller Mojolicious::Controller::REST);
use JSON;
use process::db::Select;

# This action will render a template
sub articles
{
    my $self = shift;

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
                content => $_->{content}->{text},
                link => $_->{link}
            }
        } $result->result->all;

    $self->render(
        json => {
            articles => $articles }
    );
}

1;
#
# { "_id" : ObjectId("59426e171858f04cb0190441"),
# "description" : "Quantum Break for under £10, Horizon: Zero Dawn for under £25, plus an incredible pre-order deal on Nintendo Switch Splatoon 2.",
# "link" : "http://feeds.ign.com/~r/ign/articles/~3/Ct_9d-Jpo-0/daily-deals-ps-plus-1-year-membership-for-28", "reddit" : "",
# "title" : "Daily Deals: PS Plus 1 Year Membership for £28", "twitter" : "", "id" : 0, "instagram" : "",
# "content" : { "sources" : [ ], "links" : [ "https://www.facebook.com/ignukdeals/", "https://twitter.com/IGNUKDeals", "https://r.zdbb.net/u/2n9y", "https://r.zdbb.net/u/2n9y", "http://www.ign.com/articles/2017/06/15/daily-deals-ps-plus-1-year-membership-for-28" ],
# "text" : [ "Help us get to 5000 likes! Like our pages on Facebook and Twitter to get the latest deals straight to your news feed and also to find exclusive codes that we provide for our readers. ", "12 Month PlayStation Memberships Have Never Been Cheaper", "Shopto.net have dropped the asking price for a 12 Month Membership to just £27.85 which is currently the cheapest place to purchase 12 Months of PSN. Even if you currently have PSN, it is definitely worth picking it up for this price for when you do run out. ", "Continue reading…", "Facebook", "Twitter", "12 Month PlayStation Memberships Have Never Been Cheaper", "12 Month Membership to just £27.85", "Continue reading…", "12 Month PlayStation Memberships Have Never Been Cheaper" ]
# } }

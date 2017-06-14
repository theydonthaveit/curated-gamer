package Steam;

use Project::Libs lib_dirs => [qw(mojo)];

use process::db::Select;
use Web::Scraper;
use Data::Dumper;
use URI;
use Mojo;
use Moo;
use namespace::clean;

has appid => ( is => 'ro' );

sub new
{
    my $self = shift;

    my $url = 'http://store.steampowered.com/api/appdetails?appids=';

    my $ua = Mojo::UserAgent->new();
    my $tx =
        $ua->get(
            $url
            . $self->appid );

    my $json = $tx->res->json;
    my $base = $json->{$self->appid}->{data};

    # TODO - STRIP HTML CONTENT IN ANY FIELD

    return {
        description => $base->{detailed_description},
        header_image => $base->{header_image},
        pc_requirements => $base->{pc_requirements}->{minimum},
        developers => $base->{developers},
        publishers => $base->{publishers},
        # IF TRUE RETURN 1
        windows => $base->{platforms}->{windows} =~ s/1/1/g,
        mac => $base->{platforms}->{mac} =~ s/1/1/g,
        linux => $base->{platforms}->{linux} =~ s/1/1/g,
        # END COMMENT
        score => $base->{metacritic}->{score},
        url => $base->{metacritic}->{url},
        categories => $base->{categories},
        genres => $base->{genres},
        recommendations => $base->{recommendations}->{total},
        release_date => $base->{release_date}->{date},
        support_info => $base->{support_info}->{url},
        background_image => $base->{background}
    }
}

1;

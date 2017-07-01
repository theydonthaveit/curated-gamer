package Youtube;

use Mojo;
use Mojo::JSON qw(from_json to_json);
use Mojo::UserAgent;

use Mojo::Util qw(b64_encode);
use Tie::RegexpHash;
use Web::Scraper;

use Moo;
use namespace::clean;

has search_param => (is => 'ro');
has max_results => (is => 'ro');
has order => (is => 'ro');
has related_videos => (is => 'ro');
has type => (is => 'ro' );
has embeded => (is => 'ro' );

has channel_id => (is => 'rw');
has video_id => (is => 'rw');
has video_url => (is => 'rw');
# channel_id => 'UCTlVz6WP_SsLRt663JqP6lw' || 'UC2lJPgRa6PeDNLUqlCCmDAQ',

sub retrieve
{
    my ($self, %args) = @_;

    my $url = 'https://www.googleapis.com/youtube/v3/search';
    my $params =
    {
        key => 'AIzaSyBF1eKRdW7X26cOM4WulU-oSdAcC3vR4g8',
        part => 'snippet',
        q => $self->search_param,
        order => $self->order,
        type => $self->type,
        maxResults => $self->max_results,
        channelId => $self->channel_id,
        videoEmbeddable => $self->embeded
    };

    my $ua = Mojo::UserAgent->new();
    my $tx =
        $ua->get(
            $url =>
                form => $params );

    my $json =
        $tx
            ->res
            ->json;

    return bless $json;
}

sub retrieve_video_id
{
    my $self = shift;

    my $video_id =
        $self
            ->{items}
            ->[0]
            ->{id}
            ->{videoId};

    return $video_id;
}

sub retrieve_channel_id
{
    my $self = shift;

    my $channel_id =
        $self
            ->{items}
            ->[0]
            ->{snippet}
            ->{channelId};

    return $channel_id;
}

sub result_preview_and_upcoming
{
    my $self = shift;

    my $preview_hash;
    my $upcoming_list_hash;

    foreach ( @{$self->{items}} )
    {
        my $base = $_->{snippet};
        if ( $base->{title} =~ m/upcoming|game releases|best/gi )
        {
            push @{$upcoming_list_hash},
            {
                tilte => $base->{title},
                description => $base->{description},
                image => $base->{thumbnails}->{high}->{url},
                id => $_->{id}->{videoId},
                url =>
                    'https://www.youtube.com/embed/aU0cAeNBTNE'
                    . $_->{id}->{videoId}
            }
        }
        else
        {
            push @{$preview_hash},
            {
                tilte => $base->{title},
                description => $base->{description},
                image => $base->{thumbnails}->{high}->{url},
                id => $_->{id}->{videoId},
                url =>
                    'https://www.youtube.com/embed/'
                    . $_->{id}->{videoId}
            }
        }
    }

    return {
        previews => $preview_hash,
        upcoming => $upcoming_list_hash
    }
}

sub result_related
{
    # TODO implement when YouTube fixes the "relatedToVideoId" params
    # OR design your own way to find related videos
    ...
}

sub result_article
{
    my $self = shift;
    my $potential_search_param = shift;

    my $use_video;

    unless ( defined $self->{items}->[0]->{snippet}->{title} )
    {
        my $url = 'https://www.googleapis.com/youtube/v3/search';
        my $params =
        {
            key => 'AIzaSyBF1eKRdW7X26cOM4WulU-oSdAcC3vR4g8',
            part => 'snippet',
            q => $potential_search_param,
            # channelId => 'UCKy1dAqELo0zrOtPkf0eTMw',
        };

        my $ua = Mojo::UserAgent->new();
        my $tx =
            $ua->get(
                $url =>
                    form => $params );

        my $json =
            $tx
                ->res
                ->json;

        $use_video =
            is_video_relevant(
                $json->{items}->[0]->{snippet}->{channelTitle}
            );

        return {
            comment => 'Not 100% Related. Why? Bitches dont share',
            title => $json->{items}->[0]->{snippet}->{title},
            description => $json->{items}->[0]->{snippet}->{title},
            image => $json->{items}->[0]->{snippet}->{thumbnails}->{high}->{url},
            url =>
                'https://www.youtube.com/embed/'
                . $json->{items}->[0]->{id}->{videoId} // ''
        }
    }

    $use_video =
        is_video_relevant(
            $self->{items}->[0]->{snippet}->{channelTitle}
        );

    unless ( $use_video ) {
        my $alter_result = alternative_search($potential_search_param);

        my ($garbage, $end_point) = split('=', $alter_result->{link});

        return {
            comment => 'Not 100% Related. Why? Bitches dont share',
            title => $alter_result->{title},
            description => $alter_result->{description},
            url =>
                'https://www.youtube.com/embed/'
                . $end_point
        }
    }

    return {
        comment => 'Near Enough to Accurate',
        title => $self->{items}->[0]->{snippet}->{title},
        description => $self->{items}->[0]->{snippet}->{title},
        image => $self->{items}->[0]->{snippet}->{thumbnails}->{high}->{url},
        url =>
            'https://www.youtube.com/embed/'
            . $self->{items}->[0]->{id}->{videoId} // ''
    } if $use_video;
}

sub alternative_search
{
    my $param_to_search = shift;
    
    my $ua = Mojo::UserAgent->new();
    my $url = 'https://www.youtube.com/results?search_query=' . $param_to_search;
    my $tx = $ua->get($url);

    my $scraper =
        scraper
        {
            process 'ol[class="item-section"]', main =>
            scraper
            {
                process 'h3[class="yt-lockup-title "] a', link => '@href', title => '@title';
                process 'div[class="yt-lockup-description yt-ui-ellipsis yt-ui-ellipsis-2"]', description => 'TEXT';
            };
        };

    my $res =
        $scraper->scrape($tx->res->body);

    my $base = $res->{main};

    return $base;
}

sub is_video_relevant
{
    my $compare_item = shift;

    my %potential_sites;
    tie %potential_sites, 'Tie::RegexpHash';
    %potential_sites =
    (
        qr/game/i => 1,
        qr/kotaku/i => 1,
        qr/ign/i => 1,
        qr/gametrailers/i => 1,
        qr/gametrailers/i => 1,
        qr/techcrunch/i => 1,
        qr/machinima/i => 1,
        qr/looper/i => 1
    );

    return exists $potential_sites{$compare_item};
}

1;

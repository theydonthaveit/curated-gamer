package Youtube;

use Mojo;
use Mojo::JSON qw(from_json);
use Mojo::UserAgent;
use Data::Dumper;
use Tie::IxHash;
use Moo;
use namespace::clean;

has search_param => (is => 'ro');
has type => (is => 'ro');
has max_results => (is => 'ro');
has order => (is => 'ro');

has channel_id => (is => 'rw');
has video_id => (is => 'rw');
has video_url => (is => 'rw');
has video_json => (is => 'rw');

sub result_preview
{
    my ($class, %params) = @_;


}

sub result_related
{ ... }

sub result_article
{ ... }


# sub result
# {
#     my $self = shift;
#
#     my $video_url = retrieve_video($self->search, $self->brand);
#
#     return $video_url;
# }
#
# sub retrieve_video
# {
#     my $search = shift;
#     my $brand = shift;
#
#     my $res = request($search, $brand);
#
#     unless ( $res->{pageInfo}->{totalResults} eq '1' )
#     {
#         $res = request($search);
#
#         my $video_url =
#             'https://www.youtube.com/embed/'
#             . $res->{items}->[0]->{id}->{videoId};
#
#         return $video_url;
#     }
#
#     my $video_url =
#         'https://www.youtube.com/embed/'
#         . $res->{items}->[0]->{id}->{videoId};
#
#     return $video_url;
# }

sub retrieve
{
    my $self = shift;

    my $url = 'https://www.googleapis.com/youtube/v3/search';
    my $params =
    {
        key => 'AIzaSyBF1eKRdW7X26cOM4WulU-oSdAcC3vR4g8',
        part => 'snippet',
        q => $self->search_param // '',
        order => $self->order,
        type => $self->type,
        maxResults => $self->max_results // '',
        channelId => $self->channel_id // ''
    };

    tie %{$params}, 'Tie::IxHash';

    my $ua = Mojo::UserAgent->new();
    my $tx =
        $ua->get(
            $url => form => $params );

    my $json = $tx->res->json;

    bless $self->video_json( $json ), "Youtube";
}

# sub previews
# {
#     # https://www.youtube.com/channel/UCTlVz6WP_SsLRt663JqP6lw/videos
#     # https://developers.google.com/youtube/v3/docs/search/list
# }

1;

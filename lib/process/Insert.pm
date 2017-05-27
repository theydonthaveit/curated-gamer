package Insert;
use strict;
use warnings;

use Data::Dumper;
use MongoDB;
use Firebase;

use Moo;
use namespace::clean;

sub run
{
    my $self = shift;
    my %args = @_;
    print Dumper %args;
    # my $fb =
    #     Firebase->new(
    #         firebase => 'https://spock-31889.firebaseio.com/',
    #         # auth => {
    #         #     secret => 'AIzaSyDWCalLAhfcrWCFk1cDJEd2MmnDVdHMxoY',
    #         #     data => {
    #         #         uid => 'n0STVhNZSkPEMtTENnHqgfnFWMu2',
    #         #         username => 'theydonthaveit@gmail.com'
    #         #     },
    #         #     admin => \1
    #         # }
    #     );
    #
    # my $result = $fb->put('foo', { this => 'that' });
    # print Dumper $result;

    # my $client =
    #     MongoDB->connect();
    #
    # my $db =
    #     $client->get_database( $args{site} );
    # my $data =
    #     $db->get_collection( $args{type} );
    #
    # $data->insert_one({
    # });

    return %args;
}

1;

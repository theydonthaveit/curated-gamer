package CuratedGamer;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('ign#home');
  $r->get('/ign')->to('ign#home');
  $r->get('/gamespot')->to('gamespot#home');
  $r->get('/kotaku')->to('kotaku#home');
  $r->get('/gamefaqs')->to('gamefaqs#home');
  $r->get('/nfourg')->to('nfourg#home');
}

1;

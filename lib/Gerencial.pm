package Gerencial;
use Mojo::Base 'Mojolicious';

use Gerencial::Schema;

# This method will run once at server start
sub startup {
    my $self = shift;

    # conexão com o banco
    $self->helper(
        schema => sub {
            return Gerencial::Schema->connect('dbi:mysql:dbname=Gerencial;host=192.168.5.205', 'chaves', 'ildenice');
        }
    );

    # Router
    my $r = $self->routes;

    $r->namespaces( ["Gerencial::Controller"] );

    # Normal route to controller
    $r->get('/')->to('home#index');
  
    # rota para tela principal
    $r->get('/inicio')->to( controller => 'Inicio', action => 'index' );

    # rota para tela de cadastro
    $r->any('/cadastro/:action')->to( controller => 'Cadastro' );
}

1;

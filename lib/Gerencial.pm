package Gerencial;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Router
    my $r = $self->routes;

    $r->namespaces( ["Gerencial::Controller"], ["Gerencial::Controller::Menu"] );

    # Normal route to controller
    #$r->get('/')->to('home#index');
  
    # rota para tela principal
    $r->get('/inicio')->to( controller => 'Inicio', action => 'index' );

    # rota para tela de cadastro
    $r->get('/cadastro')->to( controller => 'Cadastro', action => 'inserir' );
    $r->get('/banco')->to( controller => 'Cadastro', action => 'banco' );
}

1;

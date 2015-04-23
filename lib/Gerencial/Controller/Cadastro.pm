package Gerencial::Controller::Cadastro;
use Mojo::Base 'Mojolicious::Controller';

sub banco {
    my $self = shift;
   
    my $banco = $self->param("nome-banco") || '';

    $self->render( stash => "$banco");
}

sub cliente {
    my $self = shift;
}

sub fornecedor {
    my $self = shift;
}

1;

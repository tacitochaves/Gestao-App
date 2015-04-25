package Gerencial::Controller::Cadastro;
use Mojo::Base 'Gerencial::Controller::Base';

sub banco {
    my $self = shift;
   
    if ( $self->is_post ) {         
        my $banco      = $self->param("nome-banco") || undef;
        my $agencia    = $self->param("num-agencia") || undef;
        my $c_corrente = $self->param("conta-corrente") || undef;
        
        return $self->render( text => "$banco $agencia $c_corrente" );
    }
}

sub cliente {
    my $self = shift;
}

sub fornecedor {
    my $self = shift;
}

1;

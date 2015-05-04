package Gerencial::Controller::Cadastro;
use Mojo::Base 'Gerencial::Controller::Base';

sub banco {
    my $self = shift;

    if ( $self->is_post ) {

        # obtendo parâmetros do form
        my $nome          = $self->param("nome-banco")     || undef;
        my $agencia        = $self->param("num-agencia")    || undef;
        my $conta_corrente = $self->param("conta-corrente") || undef;

        # valida dados do form
        if ( $nome && $agencia && $conta_corrente ) {

            # adiciona dados ao banco de dados
            my $banco_rs = $self->schema->resultset('Banco');
            my $banco = $banco_rs->find( { nome => $nome } );
            
            # cria o banco se não existir no banco de dados
            unless($banco) {
                $banco = $banco_rs->create( {
                    nome           => $nome,
                    agencia        => $agencia,
                    conta_corrente => $conta_corrente,
                } );
            }
            else {
                return $self->render( 
                    mensagem => {
                        type => 'informacao',
                        text => "O Banco $nome já está cadastrado no sistema!"
                    }
                );
            }

            # sucesso 
            if ( $banco && $banco->in_storage ) {
                return $self->render(
                    mensagem => {
                        type => 'sucesso',
                        text => 'Cadastro realizado com sucesso!'
                    }
                );
            }

            # erro
            return $self->render(
                mensagem => {
                    type => 'perigo',
                    text => 'Erro ao tentar salvar os dados do banco!'
                }
            );

        }
    }
    # padrão
    return $self->render( mensagem => undef );
}

sub cliente {
    my $self = shift;
}

sub fornecedor {
    my $self = shift;
}

1;

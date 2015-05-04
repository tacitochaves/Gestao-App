package Gerencial::Controller::Cadastro;
use Mojo::Base 'Gerencial::Controller::Base';

sub banco {
    my $self = shift;

        #$self->respond_to( 
        #    json => { json => { mensagem => 'Dados enviado com sucesso', id => '1' } },
        #    html => { template => 'cadastro/banco' },
        #);

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
                return $self->respond_to( 
                        json => { json => { mensagem => "O Banco $nome já está cadastrado no sistema!", type => 'informacao' } },
                        html => { template => 'cadastro/banco' },
                );
            }

            # sucesso 
            if ( $banco && $banco->in_storage ) {
                return $self->respond_to(
                        json => { json => { mensagem => "Cadastro realizado com sucesso!", type => 'sucesso' } },
                        html => { template => 'cadastro/banco' },
                );
            }

            # erro
            return $self->respond_to(
                json => { json => { mensagem => "Erro ao tentar salvar os dados do banco!", type => 'perigo' } },
                html => { template => 'cadastro/banco' },
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

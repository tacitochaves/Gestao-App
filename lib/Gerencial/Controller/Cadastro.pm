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

    if ( $self->is_post ) {

        # obtendo parâmetros do form
        my $tipo_empresa = $self->param("empresa")       || undef;
        my $nome         = $self->param("nome-cli")      || undef;
        my $data_nasc    = $self->param("data-nasc-cli") || undef;
        my $sexo         = $self->param("sexo")          || undef;
        my $telefone     = $self->param("tel-cli")       || undef;
        my $celular      = $self->param("cel-cli")       || undef;
        my $rg           = $self->param("rg-cli")        || undef;
        my $cpf          = $self->param("cpf-cli")       || undef;
        my $ie           = $self->param("ie-cli")        || undef;
        my $cnpj         = $self->param("cnpj-cli")      || undef;
        my $endereco     = $self->param("endereco-cli")  || undef;
        my $estado       = $self->param("estado")        || undef;
        my $bairro       = $self->param("bairro")        || undef;
        my $cidade       = $self->param("cidade")        || undef;
        my $cep          = $self->param("cep-cli")       || undef;
        my $pai          = $self->param("pai-cli")       || undef;
        my $mae          = $self->param("mae-cli")       || undef;
        my $email        = $self->param("email-cli")     || undef;
        my $observacao   = $self->param("obs-cli")       || undef;

        if ( $nome && $data_nasc && $sexo && $telefone && $rg && $cpf && $endereco 
            && $estado && $bairro && $cidade && $cep && $pai && $mae && $email ) {
                return $self->respond_to( 
                        json => { json => { mensagem => "Você está cadastrando um cliente pessoa física!", type => 'informacao' } },
                        html => { template => 'cadastro/cliente' },
                );
        }            
        elsif ( $nome && $telefone && $ie && $cnpj && $endereco 
            && $estado && $bairro && $cidade && $cep && $email ) {
                return $self->respond_to( 
                        json => { json => { mensagem => "Você está cadastrando um cliente pessoa jurídica!", type => 'informacao' } },
                        html => { template => 'cadastro/cliente' },
                );
        }            
        else {
            return $self->respond_to( 
                json => { json => { mensagem => "Não foi passado nada como parametro!", type => 'informacao' } },
                html => { template => 'cadastro/cliente' },
            );
        }
    }
        # valida dados do form
#        if ( $nome && $agencia && $conta_corrente ) {

            # adiciona dados ao banco de dados
#            my $banco_rs = $self->schema->resultset('Banco');
#            my $banco = $banco_rs->find( { nome => $nome } );
            
            # cria o banco se não existir no banco de dados
#            unless($banco) {
#                $banco = $banco_rs->create( {
#                    nome           => $nome,
#                    agencia        => $agencia,
#                    conta_corrente => $conta_corrente,
#                } );
#            }
#            else {
#                return $self->respond_to( 
#                        json => { json => { mensagem => "O Banco $nome já está cadastrado no sistema!", type => 'informacao' } },
#                        html => { template => 'cadastro/banco' },
#                );
#            }

            # sucesso 
#            if ( $banco && $banco->in_storage ) {
#                return $self->respond_to(
#                        json => { json => { mensagem => "Cadastro realizado com sucesso!", type => 'sucesso' } },
#                        html => { template => 'cadastro/banco' },
#                );
#            }

            # erro
#            return $self->respond_to(
#                json => { json => { mensagem => "Erro ao tentar salvar os dados do banco!", type => 'perigo' } },
#                html => { template => 'cadastro/banco' },
#            );

#        }
#    }

    # padrão
#    return $self->render( mensagem => undef );
}

sub fornecedor {
    my $self = shift;
}

1;

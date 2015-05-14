// Submit do formulário de cadastro de banco
$('#frm-cli').submit(function() {
    
    var formulario = $(this);

    var obrigatorio;

    if ( $('#tipo-cli').is(":checked") ) {
        pessoaJuridica();
        obrigatorio = $('.obrigatorio');
    }
    else {
        pessoaFisica();
        obrigatorio = $('.obrigatorio');
    }

    var conteudo = verificaVazio($(obrigatorio));

    $(obrigatorio).each( function() {
        //alert($(this).attr('type'));
    });

    return false;
});

// Submit do formulário de cadastro de banco
$('#frm-banco').submit(function() {

    var formulario = $(this);
    var obrigatorio = $('.obrigatorio');
    var conteudo = verificaVazio($(obrigatorio));
    
    if ( ! conteudo ) {
    
        $.ajax({
            url: '/cadastro/banco',
            type: 'POST',
            data: $('#frm-banco').serialize(),
            dataType: 'json',
            success: function( data ) {
                $('.mensagem-modal').html(
                    '<div class="icone">' +
                        '<i class="fa fa-'+data.type+' fa-3x"></i>'+
                    '</div>' +
                    '<p>' + data.mensagem + '</p>' +
                    '<a href="#" class="close">Fechar' + '</a>'
                );
                $('.mensagem-modal, .sobreposicao').fadeIn(retiraModal());
            },
            complete: function() {
                limpaCampo();
                focoText();
                $('.msg-campo-vazio').fadeOut();
            },
            error: function() {
                alert("Error");
            },
        });
    }
    return false;
});

// verifica se o campo está vazio
var verificaVazio = function(texto) {
    var retornado = undefined;
    
    texto.each(function() {
        var $this = $(this);
        var valor = $this.val().trim();

        if ( $this.attr('type') == 'text' ) {
    
            if ( valor === '' ) {
                $this.addClass('vazio');
                mostraMsgCampoVazio('.msg-campo-vazio');
                retornado = true;
            }
            else if ( valor !== '' && $this.closest('div').filter('vazio') ) {
                $this.removeClass('vazio');
            }
        }
        else if ( $this.attr('type') == 'select-one' ) {

            if ( valor === '' ) {
                $this.addClass('vazio');
                mostraMsgCampoVazio('.msg-campo-vazio');
                retornado = true;
            }
            else if ( valor !== '' && $this.closest('div').filter('vazio') ) {
                $this.removeClass('vazio');
            }
        }
    });
    
    return retornado == true ? true : false;
    
};

// limpa o campo após o submit
var limpaCampo = function() {
    $(':input').not(':button, :submit, :reset, :hidden, :checkbox, :radio').val('');
    $(':checkbox, :radio').prop('checked', false);
};
    
// dá o foco no primeiro campo texto
var focoText = function() {
    $('input:text').first().focus();
};

var mostraMsgCampoVazio = function(campoVazio) {
    $(campoVazio).fadeIn();
};

var retiraModal = function() {
    $('.sobreposicao, .close').on('click', function() {
        $('.sobreposicao, .mensagem-modal').fadeOut();
    });
};

// checa se o cadastro é cliente pessoa física ou jurídica
var ativaEmpresa = function() {
    var isCheck = $(this).is(":checked");
    if (isCheck) {
        $(':input').not(':button, :submit, :reset, :hidden, :checkbox, :radio').val('');
        $('.pode-esconder').fadeOut();
        $('.esconder').fadeIn();
        focoText();
    }
    else {
        $(':input').not(':button, :submit, :reset, :hidden, :checkbox, :radio').val('');
        $('.pode-esconder').fadeIn();
        $('.esconder').fadeOut();
        focoText();
    }
};

// 
var pessoaFisica = function() {
    $('#ie-cli').removeClass('obrigatorio');
    $('#cnpj-cli').removeClass('obrigatorio');
};

var pessoaJuridica = function() {
    $('#rg-cli').removeClass('obrigatorio');
    $('#cpf-cli').removeClass('obrigatorio');
};

// máscara para data
var maskDate = function(elemento) {
    $(elemento).mask("99/99/9999");
};

// máscara para telefone fixo e celular
var maskFone = function(elemento) {
    $(elemento).mask("(99) 9999-9999");
};

// máscara para cpf
var maskCPF = function(elemento) {
    $(elemento).mask("999.999.999-99");
};

// máscara para rg
var maskRG = function(elemento) {
    $(elemento).mask("999999999999-9");
};

// máscara para cnpj
var maskCNPJ = function(elemento) {
    $(elemento).mask("99.999.999/9999-99");
};

// inscrição estadual
var maskIE = function(elemento) {
    $(elemento).mask('999.999.99-9');
};

// mascara para cep
var maskCEP = function(elemento) {
    $(elemento).mask("99999-999");
};

var carregaFuncao = function() {
    $('#tipo-cli').click(ativaEmpresa);
    maskDate('.data');
    maskFone('.fone');
    maskCPF('.cpf');
    maskCNPJ('.cnpj');
    maskIE('.ie');
    maskRG(".rg");
    maskCEP('#cep-cli');
};

carregaFuncao();

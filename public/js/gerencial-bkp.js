//checa campo vazio
var checaVazio = function() {
    var formulario = $('form');
  
    // controla a submissão do formulário
    var cont = 0;

    formulario.each(function() {
        var elementos = formulario.find('input');

        for (var i = 0; i < elementos.length; i++) {
            if ( $(elementos[i]).attr('type') == "text" && $(elementos[i]).val() == "" ) {
                cont++;
                $(elementos[i]).css({ 'border-color' : 'red' });
                mostraMsgCampoVazio('.msg-campo-vazio');
            }
            else {
                $(elementos[i]).css({ 'border-color' : '#999' });
            }
        }
    });

    if ( cont == 0 ) {
        //alert("formulário submetido com sucesso " + cont + $(this));
        $('form').submit();
    }
    return false; 
};

// checa se o cadastro é cliente pessoa física ou jurídica
var ativaEmpresa = function() {
    var isCheck = $(this).is(":checked");
    if (isCheck) {
        $('.pode-esconder').fadeOut();
        $('.esconder').fadeIn();
    }
    else {
        $('.pode-esconder').fadeIn();
        $('.esconder').fadeOut();
    }
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

var mostraMsgCampoVazio = function(campoVazio) {
    $(campoVazio).fadeIn();
};

$('.sobreposicao, .close').on('click', function() {
    $('.sobreposicao, .mensagem-modal').fadeOut();
});

// roda todas as funções
var rodarFuncao = function() {
    $('#tipo-cli').click(ativaEmpresa);
    maskDate('.data');
    maskFone('.fone');
    maskCPF('.cpf');
    maskRG(".rg");
    $('input[type="submit"]').click(checaVazio);

};

rodarFuncao();

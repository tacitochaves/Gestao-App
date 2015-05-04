$('form').submit(function() {

    var formulario = $(this);
    var obrigatorio = $('.obrigatorio');
    var conteudo = verificaVazio($(obrigatorio));
    
    if ( ! conteudo ) {
    
        $.ajax({
            url: '/cadastro/banco',
            type: 'POST',
            data: $('form').serialize(),
            dataType: 'json',
            success: function( data ) {
                $('.mensagem-modal').html(
                    '<div class="icone">' +
                    '</div>' +
                    '<p>' + data.mensagem + '</p>' +
                    '<a href="#" class="close">Fechar' + '</a>'
                );
                $('.mensagem-modal, .sobreposicao').fadeIn(retiraModal());
            },
            error: function() {
                alert("Error");
            },
            complete: function() {
                limpaCampo();
                focoText();
                $('.msg-campo-vazio').fadeOut();
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
    
        if ( valor === '' ) {
            $this.addClass('vazio');
            mostraMsgCampoVazio('.msg-campo-vazio');
            retornado = true;
        }
        else if ( valor !== '' && $this.closest('div').filter('vazio') ) {
            $this.removeClass('vazio');
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

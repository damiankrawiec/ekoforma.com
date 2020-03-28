function addMenuSeparator() {

    $('.navbar-nav li').each(function($i){

        $('<li class="separator"><i class="fas fa-circle"></i></li>').insertBefore($(this));

    });

    $('.navbar-nav li:first-child').remove();

}

function titleRow() {

    var $titleClass = false;

    var $titleContent = [];

    $('.title-row .object').each(function($i) {

        if(!$titleClass)
            $titleClass = $(this).attr('class').replace('object ', '');

        $titleContent[$i] = $(this).html();

    });

    $('.row-1 .object').each(function($i) {

        $(this).prepend($titleContent[$i]);

    });

}
function addMenuSeparator() {

    $('.main-menu .navbar-nav li').each(function($i){

        $('<li class="separator"><i class="fas fa-circle"></i></li>').insertBefore($(this));

    });

    $('.main-menu .navbar-nav li:first-child').remove();

}

function title() {

    var $titleRow = [];

    var $titleCol = [];

    $('.title-row .object').each(function($i) {

        $titleRow[$i] = $(this).html();

    });

    $('.title-col .object').each(function($i) {

        $titleCol[$i] = $(this).find('section').text();

    });

    $('.row-1 .object').each(function($i) {

        $(this).prepend($titleRow[$i]);

    });

    $('.im-content-inside .objects').each(function($j){

        $(this).prepend('<div class="title-col-text">' + $titleCol[$j] + '</div>');

    });

}

function activeSubmenu() {

    var $url = $('#url').val();

    var $section = 'sniadania, dania-glowne, kolacje, przekaski, desery';

    if($section.indexOf($url) > -1) {

        $('.menu li.dropdown').addClass('active');

        $('.submenu .navbar-nav li a[href=' + $url + ']').parent().addClass('active-color');

    }

}
function addMenuSeparator() {

    $('.navbar-nav li').each(function($i){

        $('<li class="separator"><i class="fas fa-circle"></i></li>').insertBefore($(this));

    });

    $('.navbar-nav li:first-child').remove();

}
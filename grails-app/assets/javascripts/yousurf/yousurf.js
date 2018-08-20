/*if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}*/

/**
*/
function onDefaultLoad(action) {
    if (window['onLoad_' + action]) {
      window['onLoad_' + action]()
    }
}
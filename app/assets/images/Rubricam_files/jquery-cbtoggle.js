(function( $ ) {
  $.fn.cb_toggle = function( options ) {  
    // Create some defaults, extending them with any options that were provided
    var settings = $.extend( {
      'toggle_element' : undefined
    }, options);

    return this.each(function() {
      var $this = $(this);
      $this.bind('click', function() {
        $(settings.toggle_element).toggle( $this.is(':checked') );
      });
    });
  };
})( jQuery );

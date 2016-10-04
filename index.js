$( 'ul.nav.nav-tabs  a' ).click( function ( e ) {
e.preventDefault();
$( this ).tab( 'show' );
} );
( function( $ ) {
$( '.js-alert-test' ).click( function () {
alert( 'Button Clicked: Event was maintained' );
});
fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
})( jQuery );
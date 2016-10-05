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

function loadBlock() {
	var b = "./relay1.html";
	$.post(b, {load : "1"}, function(data){
   if (data.length>0){ 
     $("#relay1").html(data); 
   } 
})
}

$( document ).ready(function() {
    loadBlock();
$( 'button' ).click( function ( e ) {
e.preventDefault();
var edit_val= $(this).attr('id');
alert(edit_val);

} );
	
});

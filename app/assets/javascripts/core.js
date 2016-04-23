$(document).ready(function(){

   $(".froala-editor").froalaEditor({
     language: 'es',
     heightMin: 200
   });

   $("input[type=radio]").on("change", function(){
     if ( this.value == 'groups' ) {
       console.log( 'grupos' );
       $(".groups-div").show();
     } else {
       console.log( 'no grupos' );
       $(".groups-div input:checkbox").removeAttr('checked');
       $(".groups-div").hide();
     }
   });

 });

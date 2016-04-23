$(document).ready(function(){

   $(".froala-editor").froalaEditor({
     language: 'es',
     heightMin: 200
   });

   $("input[type=radio]").on("change", function(){
     if ( this.value == 'groups' ) {
       $(".groups-div").show();
     } else {
       $(".groups-div input:checkbox").removeAttr('checked');
       $(".groups-div").hide();
     }
   });

 });

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

	

	$('.upload').change(function() {
		readURL(this);
	});


	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('.img_preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

});
 	function recherchable(fieldTorecherchable) {  

   		$(fieldTorecherchable).typeahead({
      source: recherche()
    	});
   	}


  	function recherche() {  
  		var  liste_nom

  	    $.ajax({
		    type: 'GET',
		    url: "/recherche_ingredient",
		    data: 'param1=""',
		    dataType: "json",
		    async: false,
		    success: function(data){liste_nom= data;}
		})

		return   $.map( liste_nom, function(n){
				  return n["nom"];
				});	

  	};

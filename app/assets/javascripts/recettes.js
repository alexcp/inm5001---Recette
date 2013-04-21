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
				$('#img_preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("div.field_with_errors input").bind("focus.with_error",function(){
		var me = $(this),
			parent = me.parent();
		parent.removeClass("field_with_errors").addClass("field_corrected");
		me.unbind("focus.with_error");
	});

});
 	function recherchable(fieldTorecherchable, element) {  

   		$(fieldTorecherchable).typeahead({
      source: recherche(element)
    	});
   	}


  	function recherche(element) {  
  		var  liste_nom

  	    $.ajax({
		    type: 'GET',
		    url: "/recherche_ingredient",
		    data: 'element='+element,
		    dataType: "json",
		    async: false,
		    success: function(data){liste_nom= data;}
		})

		return   $.map( liste_nom, function(n){
				  return n["nom"];
				});	

  	};


function autoSize(textarea)
{
  var lines = textarea.value.split('\n');
  var width = textarea.cols;
  var height = 1;
  for (var i = 0; i < lines.length; i++) {
    var linelength = lines[i].length;
    if (linelength >= width) {
      height += Math.ceil(linelength / width);
    }
  }
  height += lines.length;
  textarea.rows = height-1;
}


jQuery(function ($) {
    window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
      	if($(link).attr('data-target')!=""){
	      	var me = $(link);
	        var $tr = $(me.attr('target_id')).find('tbody').append(content);
	        return $tr;
     	}
    };
  });


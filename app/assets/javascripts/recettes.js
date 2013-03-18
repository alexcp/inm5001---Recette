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

    

	$(document).find("[readonly]").each(function(value) {

		$(this).prop('disabled', true);
		$(this).css({'background-color' : 'transparent', 'border-color': 'transparent' , 'outline': 'none' , 'box-shadow':'none'  })
	})

	$("#modal_button").click(function(){

  // $("textarea").css({'background-color' : 'transparent', 'border': 'none' , 'outline': 'none' , 'box-shadow':'none'  })
  $(document).find("[readonly]").each(function(value) {
  	$(document).find(".cache").css("visibility","visible")
  	$(this).attr('readonly',false);
  	$(this).prop('disabled', false);
  	$(this).css({'background-color' : '' ,  'border': '' , 'outline': '' , 'box-shadow':'' })
//$(this).removeClass().addClass("invisibleInput");
})

});
});

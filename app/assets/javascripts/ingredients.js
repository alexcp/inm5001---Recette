// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('#test').html("<%= escape_javascript(render('test', test: @test})) %>")
jQuery(function() {
  return $('.best_in_place').best_in_place();
});
jQuery(function() {
$("#buttonAjout").click(function(){
	
    
    
  $.ajax({
        type: "POST",
        url: "", //sumbits it to the given url of the form
        dataType: "json" 
    }).success(function() {
      alert("asdf");
     // $('#test').html(<%= escape_javascript("salut") %>)
   // window.location.reload(true);
});
    	
    return false; // prevents normal behaviour
});
});
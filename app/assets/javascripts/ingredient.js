$(document).ready(function(){
  $("#modal_button").click(function(){
    $.ajax("/ingredients/new",{
      method: "GET",
      success: function(data){
        $(".modal-body").html(data);
      }
    });
  });
});

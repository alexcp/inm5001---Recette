// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function switcherFavoris(){
		$("#vos_favoris").css('visibility','visible');
		$("#vos_favoris").show();
		$("#vos_recettes").hide();
}	
function switcherRecettes(){	
		$("#vos_favoris").hide();
		$("#vos_recettes").show();
}



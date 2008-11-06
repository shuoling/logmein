$(document).ready( 
  function()
  {

    $(".organisation_completor").autocomplete("auto_complete_for_organisation_name", {selectFirst: false});
    
    $(".contact_completor").autocomplete("auto_complete_for_contact_name",{selectFirst: false });
     
    $(".organisation_completor").result(function(event, data, formatted) {
	if (data)
          $("#hidden_recommender_id").val(data[1]);
     });
     
     $(".contact_completor").result(function(event, data, formatted) {
	if (data)
          $("#hidden_recommender_id").val(data[1]);
     });
     
     setup_recomendation_display();
     
     $("#organisation_organisation_source_id").change(function() {
        $("#organisation_recommender").val("");
        $("#contact_recommender").val("");
        $("#organisation_other_organisation_source").val("");
        $("#hidden_recommender_id").val("");
        
        setup_recomendation_display();
        
     });
     
     function setup_recomendation_display()
     {
        $("#recommendation_contact_div").hide();
        $("#recommendation_organisation_div").hide();
        $("#recommendation_other_div").hide();
        
	if ($("#organisation_organisation_source_id option:selected").text() == "Recommendation (Contact)")
            $("#recommendation_contact_div").show();
        
        if ($("#organisation_organisation_source_id option:selected").text() == "Recommendation (Organisation)")
            $("#recommendation_organisation_div").show();
        
        if ($("#organisation_organisation_source_id option:selected").text() == "Other")
            $("#recommendation_other_div").show();
        $(".flash_me").effect("highlight", {}, 1000);
     }

  }
);
$(document).ready( 
  function()
  {

    $("input#contact_employment_at_organisation_name").autocomplete("auto_complete_for_organisation_name");

    $("input#contact_employment_at_organisation_name").blur(
      function()
      {
          $("#contact\\[main_address_id\\]").removeOption(/./);
          $("#contact\\[main_address_id\\]").ajaxAddOption("/contacts/load_organisation_addresses",{organisation_name: this.value}, false);
      }
    );

    $("#show_find_or_create_form").click(
      function () 
      { 
          $("#new_employment_form").show("blind", { direction: "vertical" }, 600);
          $("#show_find_or_create_form").hide("blind", { direction: "vertical" }, 600);
          return false
      }
    );

    $("#hide_find_or_create_form").click(
      function () 
      { 
          $("#new_employment_form").hide("blind", { direction: "vertical" }, 600);
          $("#show_find_or_create_form").show("blind", { direction: "vertical" }, 600);
          return false
      }
    );

    $("#new_employment_form").hide();

  }
);


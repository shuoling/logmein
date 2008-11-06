$(document).ready( 
  function()
  {

    $(".tag_completor").autocomplete("auto_complete_for_tag_name",{multiple: true,mustMatch: false,autoFill: true});

    $("#tag_form").hide();

    $("#show_edit_tags").click(
      function () 
      {   
          $("#tags").slideUp("fast", 
                              function() 
                              {
                                $("#tag_form").slideDown("slow");
                                  return false;
                              }
                            );
          return false
      }
    );

    
    $("#hide_edit_tags").click(
      function () 
      { 
          $("#tag_form").slideUp("fast", 
                                  function() 
                                  {
                                    $("#tags").slideDown("slow");
                                  }
                                );
          return false
      }
    );

  }
);
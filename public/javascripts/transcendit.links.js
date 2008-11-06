$(document).ready( 
  function()
  {
    $("#show_add_link_li").show();
    $("#link_form").hide();
    
    $("#show_add_link").click(
      function () 
      { 
          $("#links").slideUp("fast", 
                                  function() 
                                  {
                                    $("#link_form").slideDown("slow");
                                    return false
                                  }
                                );
          return false
      }
    );

    $("#hide_add_link").click(
      function () 
      { 
          $("#link_form").slideUp("fast", 
                                  function() 
                                  {
                                    $("#links").slideDown("slow");
                                    return false
                                  }
                                );
          return false
      }
    );
  }
);


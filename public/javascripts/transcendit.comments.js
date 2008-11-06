$(document).ready( 
  function()
  {
    $(".edit_area").editable(RESOURCE_COMMENT_UPDATE_PATH + "/dummy_id?authenticity_token=" + encodeURIComponent(AUTH_TOKEN), {
         id        : 'real_id',
         name      : 'comment',
         type      : 'textarea',
         _method   : 'put',
         cancel    : 'Cancel',
         submit    : 'OK',
         indicator : "<img src='/images/indicator.gif'>",
         tooltip   : 'Click to edit...',
         method    : 'PUT',
         rows      : 3,
         loadurl   : RESOURCE_COMMENT_UPDATE_PATH + "/dummy_id"
     });


    $("#add_comment_div").show();
    $("#add_resource_comment_form").hide();
    
    $("#add_comment_link").click(
      function () 
      { 
          $("#add_comment_div").slideUp("fast", 
                                  function() 
                                  {
                                    $("#add_resource_comment_form").slideDown("slow");
                                    return false
                                  }
                                );
          return false
      }
    );

    $("#hide_comment_link").click(
      function () 
      { 
          $("#add_resource_comment_form").slideUp("fast", 
                                  function() 
                                  {
                                    $("#add_comment_div").slideDown("slow");
                                    return false
                                  }
                                );
          return false
      }
    );
  }
);


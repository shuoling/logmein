$(document).ready( 
  function()
  {
      $(".collated_tag").click(
        function () 
        {   
            var orginal_text = $("#collated_tags").val();
            var text_to_remove = $(this).html() + ",";
            var new_text = orginal_text.replace(text_to_remove,"");
            
            $("#collated_tags").val(new_text);
            $(this).removeClass("brown")
            $(this).addClass("disabled")
            $("#search_form").submit();
            return false;
        }
      );
  }
);
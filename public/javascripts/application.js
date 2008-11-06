// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready( function(){
    
  $('.rounded').corners();
          
  $('#flash_div').click (
      function()
      {
        $('#flash_div').hide("slow");
      }
  )
  
  $("input:text:first").focus();

});


//// this would allow respond_to
//// http://ozmm.org/posts/jquery_and_respond_to.html
//jQuery.ajaxSetup({ 
//  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
//})
//
//$(document).ajaxSend(function(event, request, settings) {
//  if (typeof(AUTH_TOKEN) == "undefined") return;
//  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
//  settings.data = settings.data || "";
//  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
//});
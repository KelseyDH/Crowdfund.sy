# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on "click", ".pagination a", ->
    
    #formats views of pagination
    $(".pagination a").css("opacity", 0.25)
    
    #limits scope of load to pagination request
    $.getScript($(@).attr("href"))
    false
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Ajax for pagination disabled for FriendlyID
$ ->
  $(document).on "click", ".pagination a", ->
    
    #formats views of pagination
    $(".pagination a").css("opacity", 0.25)
    
    #limits scope of load to pagination request
    $.getScript($(@).attr("href"))
    false

  $(document).on "click", ".remove-reward-level", ->
    $(@).parents("fieldset").fadeOut(1000)
    $(@).parents("fieldset").find("input[type=hidden]").val("1")


  $(document).on "click", ".add_fields", ->
    time = new Date().getTime()
    regex = new RegExp($(@).data("id"), "g")
    $(@).before($(@).data("fields").replace(regex, time))
    false

# $ ->
#   $(document).on "click", ".remove-reward-level", ->
#     $(@).parents("fieldset").fadeOut(1000)
#     $(@).parents("fieldset").find("input[type=hidden]").val("1")

#   $(document).on "click", ".add_fields", ->
#     time = new Date().getTime()
#     regex = new RegExp($(@).data("id"), "g")
#     $(@).before($(@).data("fields").replace(regex, time))
#     false
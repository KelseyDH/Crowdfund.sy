# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  return if typeof Stripe == "undefined"
  Stripe.setPublishableKey($("meta[name='stripe-key')").attr("content"))

  $("#new_order").on "Submit", ->
    #disable on true disables form after input
    $("input[type=submit]").attr("disabled", true)
    processCard()
    false

processCard = -> 
  
  card = 
    #inspect element to find order IDs:
    number: $("#order_card_number").val()
    cvc: $("#order_cvc").val()
    expMonth: $("#order_card_month_2i").val()
    expYear: $("#order_card_year_1i").val()


  Stripe.createToken(card, response_handleStripeResponse)

handleStripeResponse= (status, response)->
  alert(status)
  if status == 200
    alert("Success!")
    $("#order_card_number").val("")
    $("#order_cvc").val("")
    $("#order_card_month_2i").val("")
    $("#order_card_year_1i").val("")
    $("#order_stripe_card_token").val(response.id)
    $("#new_order")[0].submit()
    #go to stripe.com for test cards to try out errors
    response.id
  else
    $("#stripe-error").text(response.error.message)
    $("input[type=submit]").attr("disabled", false)

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#invoice_note a').click -> 
    $('#invoice_note').html "<a href='/invoice_notes/ajax_new' data-remote='true'>Add Note</a>"
    return false
  	
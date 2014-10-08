# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#appointment_date').datepicker({ dateFormat: "yy-mm-dd" });
  $('#appointment_start_time').timepicker({ 'scrollDefault': 'now' });
  $('#appointment_end_time').timepicker({ 'scrollDefault': 'now' });


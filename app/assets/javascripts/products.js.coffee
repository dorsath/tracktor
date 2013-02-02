# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  set_issue_height()
  $(window).resize(set_issue_height)
  sort_issues()
  $("#add_issue_button").on("click", add_issue)

  $("body").keyup(handle_shortcuts)


handle_shortcuts = (e) ->
  switch e.keyCode
    when 65 then add_issue()

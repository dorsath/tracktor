# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  set_sprint_height()
  $(window).resize(set_sprint_height)
  sort_issues()
  $("#add_issue_button").on("click", add_issue)
  $("#add_sprint_button").on("click", add_sprint)
  $(".issues .name").on("dblclick", change_issue_name)
  add_toggle_to_issues()

  $("body").keyup(handle_shortcuts)


@project_id = ->
  $("#project_id").val()
handle_shortcuts = (e) ->
  switch e.keyCode
    when 65 then add_issue()

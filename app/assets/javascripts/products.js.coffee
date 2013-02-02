# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $( ".issues" ).sortable({
    connectWith: ".issues"
    over: ->
      
    update: ( event, ui ) ->
      issue = ui.item[0]
      sprint = $(this).parent("div.sprint")[0]

      sprint_id = sprint.id.replace("sprint_","")
      issue_id  = issue.id.replace("issue_","")

      if ($(sprint).find(issue)[0] == issue)
        $.ajax({
          type: "POST",
          url: "/issues/" + issue_id + "/move",
          data: {sprint_id: sprint_id},
          success: -> notify("Story moved to sprint")
          })
      
  }).disableSelection();



# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@set_issue_height = ->
  issue_height = $(window).height() - 150;
  $(".issues").css("height", issue_height)

@sort_issues = ->
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


@add_issue = ->
  return if ($(".add_issue")[0])
  $(".backlog ul.issues").append('<li><input id="add_issue" name="issue[name]"/></li>')
  $("#add_issue").focus()
  $("#add_issue").keyup(create_issue)

@create_issue = (e)->
  if e.keyCode == 13
    issue_name = $("#add_issue").val()
    product_id = $("#product_id").val()
    $.ajax({
      type: "POST",
      url: "/products/" + product_id + "/issues",
      data: {issue: {name: issue_name}},
      success: show_newly_issue
      })
  
@show_newly_issue = (id)->
  notify("New story added")
  $.get("/issues/"+id+"",(html)-> 
      container = $("#add_issue").parents("ul")
      $("#add_issue").parent("li").remove()
      container.append(html)
      )

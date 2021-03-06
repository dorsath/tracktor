# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@add_issue_bindings = ->
  sort_issues()
  add_toggle_to_issues()
  $(".issues .name").on("dblclick", change_issue_name)
  

@set_sprint_height = ->
  sprint_height = $(window).height() - 150;
  issues_height = sprint_height - 25;
  $(".sprint").css("height", sprint_height)
  $(".issues").css("height", issues_height)

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

@busy = ->
  $(':focus')[0]

@add_issue = ->
  return if busy()
  $(".backlog ul.issues").append('<li><input id="add_issue" name="issue[name]"/></li>')
  $("#add_issue").focus()
  $("#add_issue").keyup((e)->
      switch(e.keyCode)
        when 13 then create_issue()
        when 27 then cancel_create_issue()
      )

@cancel_create_issue = ->
  $("#add_issue").parent("li").remove()
  

@create_issue = ->
  issue_name = $("#add_issue").val()
  $.ajax({
    type: "POST",
    url: "/projects/" + project_id() + "/issues",
    data: {issue: {name: issue_name}},
    success: show_newly_issue
    })
  
@show_newly_issue = (id)->
  notify("New story added")
  $.get("/issues/"+id+"",(html)-> 
      container = $("#add_issue").parents("ul")
      $("#add_issue").parent("li").remove()
      container.append(html)
      add_issue_bindings()
      )

@change_issue_name = ->
  issue_id = $(this).parent()[0].id.replace("issue_","")
  $(this).html('<input id="change_issue_name" name="issue[name]" value="'+$(this).html()+'"/>')
  input = $(this).find("input#change_issue_name")
  input.focus()
  input.keyup((e)->
      switch(e.keyCode)
        when 13 then save_issue_name(issue_id, input.val())
        when 27 then cancel_change_issue_name(input)
      )
  input.bind('focusout',-> cancel_change_issue_name(input) )

@save_issue_name = (id, issue_name)->
  $.ajax({
    type: "PUT",
    url: "/projects/" + project_id() + "/issues/"+ id,
    data: {issue: {name: issue_name}},
    success: show_newly_issue_name()
    })

@cancel_change_issue_name = (input)->
  input.parent('div.name').html(input.val())


@show_newly_issue_name = ->
  input = $("input#change_issue_name")
  input.parent().html(input.val())
  notify("Issue name updated")

@add_toggle_to_issues = ->
  $(".issue").bind("click", toggle_display_mode)

@toggle_display_mode = (e) ->
  $(this).toggleClass('extensive')



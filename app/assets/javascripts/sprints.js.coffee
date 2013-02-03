# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@add_sprint = ->
  return if $("#add_sprint_input")[0]
  $(".sprints").append('<div class="sprint"><input id="add_sprint_input" name="sprint[name]"/></div>')
  set_sprint_height()
  input = $("#add_sprint_input")
  input.focus()
  input.keyup((e)->
      switch(e.keyCode)
        when 13 then create_sprint()
        when 27 then cancel_create_sprint()
      )

@create_sprint = ->
  sprint_name = $("#add_sprint_input").val()
  $.ajax({
    type: "POST",
    url: "/products/" + product_id() + "/sprints",
    data: {sprint: {name: sprint_name}},
    success: show_newly_sprint
    })

@show_newly_sprint=(id)->
  return unless id
  notify("New sprint created")
  $.get("/sprints/"+id, (html)->
      container = $(".sprints")
      $("#add_sprint_input").parent("div.sprint").remove()
      container.append(html)
      set_sprint_height()
      sort_issues()
      )


@cancel_create_sprint = ->
  $("#add_sprint_input").parent("div.sprint").remove()

@notify = (text)->
  $("body").append('<div id="notify">' + text + "</div>")
  showNotify()
  setTimeout(hideNotify, 5000)

hideNotify = ->
  $("#notify").remove()

showNotify = ->
  $("#notify").fadeIn()

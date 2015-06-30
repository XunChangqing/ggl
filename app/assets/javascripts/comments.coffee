# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$(document).on "page.change", ->
$(document).on "page:change", ->
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    #$("#comments_list").append xhr.responseText
    console.log data.id
    $("#comments_list").append "<tr><td>#{data.user_name}:::#{data.content}</td><tr>"
    $("#comment_content").val('')
  ).on("ajax:error", (e, xhr, status, error) ->
    #$("#new_comment").append xhr.responseText
    alert(error)
  )

$ ->
  $(".button_to").on "ajax:success", (e, data, status, xhr) ->
    alert "The post was deleted."
$(document).on('turbolinks:load', function() {
  $("#task_lavels").tagit({
    fieldName: "lavels[]",
    availableTags: gon.availavle_tags
  });
  if (gon.lavels) {
    lavels = gon.lavels
    for (i in lavels) {
      $('#task_lavels').tagit('createTag', lavels[i])
    }
  }
});

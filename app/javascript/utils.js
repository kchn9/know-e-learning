import "select2"

$(document).on("turbo:load", function() {
  $('.js-multiple-select').select2({
    placeholder: "Select a category",
  });
});

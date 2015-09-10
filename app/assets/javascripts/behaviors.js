
// finds timezone

jQuery(function() {
  var tz = jstz.determine();
  $.cookie('timezone', tz.name(), { path: '/' });
});

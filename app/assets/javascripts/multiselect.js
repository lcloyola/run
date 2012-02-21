$(function(){
  // choose either the full version
  $(".multiselect").multiselect();
  // or disable some features
  $(".multiselect").multiselect({sortable: false, searchable: false});
});

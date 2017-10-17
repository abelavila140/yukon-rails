$(document).ready( function() {
  $(".edit").on("click", function() {
    var id = $(this).attr('id');
    $(".edit").show();
    $(".editing").hide();
    $(this).hide();
    $("#editing_" + id).show();
    $('#cancel').show();
  });

  $('#cancel').on("click", function(event) {
    $(".edit").show();
    $(".editing").hide()
    $('#clickable').hide();
    $(this).hide();
    event.preventDefault();
  });

  $('.datepicker').datepicker();

  $('.clickable').click(function() {
    $('#cancel').show();
    $('.special-case').val('');
    $('#clickable').show('slow');
  });

  $('.click').click(function() {
    $('#editing').show();
    $(this).hide();
  });
  
  $('.blur').blur(function() {
    var id = $(this).attr('id');
    $('#edit_form_' + id).submit();
  });

  $('#textarea').blur(function() {
    $('#theForm').submit();
  });

});

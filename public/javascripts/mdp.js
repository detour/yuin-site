$(function() {
  if ($.address.path() != '/') {
    $('#main_view').addClass('hide');
    
    $('#sidebar a').removeClass('current');
    var current_project = $('#sidebar a[rel="'+$.address.path()+'"]');
    current_project.addClass('current');
    current_project.parents('.course_container').addClass('expanded');
  
    $('body').removeClass('home_body');
    
    var href = $.address.path();
    $.get(href,
      function(data) {
        $('#main_view').html(data);
        $('#main_view').removeClass('hide');
      });
  }
  
  $('#sidebar .project a').click(function() {
    $('body').removeClass('home_body');
    
    $('#sidebar a').removeClass('current');
    $(this).addClass('current');
    
    $('.course_container').removeClass('expanded');
    $(this).parents('.course_container').addClass('expanded');
    
    var href = $(this).attr('href');
    $.address.value(href);
    $.get(href,
      function(data) {
        $('#main_view').html(data);
      });
    return false;
  });
  
  /*
  $('.course').click(function() {
    var container = $(this).parents('.course_container');
    if (container.hasClass('expanded')) {
      container.find('.projects').slideUp('fast');
      container.removeClass('expanded');
    } else {
      container.find('.projects').slideDown('fast');
      container.addClass('expanded');
    }
  });
  */
});
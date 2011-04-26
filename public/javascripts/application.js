$(function() {  
  $('.category a').click(function() {
    var cur_a = $(this);
    if (cur_a.hasClass('current')) {
      $('.category a').removeClass('current');
      $('.project_cate').parents('.project').fadeTo('fast', 1.0);
      $.get('/save_selected_category', { selected_category: 0 });
    } else {
      $('.category a').removeClass('current');
      cur_a.addClass('current');
      var category_id = $(this).attr('rel');
      $.get('/save_selected_category', { selected_category: category_id });

      $('.project_cate'+category_id).parents('.project').fadeTo('slow', 1.0);
      $('.project_cate').not('.project_cate'+category_id).parents('.project').fadeTo('fast', 0.4);
    }
    
    return false;
  });
});
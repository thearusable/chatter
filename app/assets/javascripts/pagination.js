jQuery(document).on('turbolinks:load', function() {
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on('scroll', function() {
      var more_users_url;
      more_users_url = $('.pagination a.next_page').attr('href');
      if (more_users_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('.pagination').html('<div class="ui active centered inline loader"></div>');
        $.getScript(more_users_url);
      }
    });
  }
});

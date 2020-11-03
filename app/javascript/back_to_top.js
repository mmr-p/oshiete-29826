$(function(){
  const backToTop = $('#back_to_top');
  backToTop.hide();
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      backToTop.fadeIn();
    } else {
      backToTop.fadeOut();
    }
  });
  backToTop.click(function() {
    $('body, html').animate({ scrollTop: 0}, 300);
    return false;
  })
})
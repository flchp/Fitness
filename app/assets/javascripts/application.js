// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require social-share-button
//= require social-share-button/wechat
//= require module
//= require hotkeys
//= require module
//= require uploader
//= require simditor
//= require_tree .


$(document).ready(function() {
  /*增加数量*/
  $("#quantity-plus").click(function(e) {
    var num = parseInt($("#quantity-input").val()) + 1;
    $("#quantity-minus").removeClass("disabled");
    $("#quantity-input").val(num);
    e.preventDefault();
  });

  /*减少数量*/
  $("#quantity-minus").click(function(e) {
    var num = parseInt($("#quantity-input").val());
    if (num > 1) {
      $("#quantity-input").val(num -= 1);
      $("#quantity-plus").removeClass("disabled");
    }
    if (num <= 1) {
      $("#quantity-minus").addClass("disabled");
    }
    e.preventDefault();
  });
});


// flash通知自动消失
$(document).ready(function() {

  // 收起通知
  slideUpAlert();

});

// 收起通知信息
function slideUpAlert() {
  // 消息停留2000毫秒（2秒），消失动画时间250毫秒
  $(".alert").delay(1000).slideUp(250, function() {
    $(this).remove();
  });
}

// navbar
$(window).scroll(function () {
    if ($(this).scrollTop() > 125) {
        $('#navbar').addClass('show_bgcolor')
    } else {
        $('#navbar').removeClass('show_bgcolor')
    }
})

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var createAttachment = function(file) {
  var uid  = [App.username, (new Date).getTime(), 'raw'].join('-');

  var data = new FormData();

  data.append('attachment[name]', file.name);
  data.append('attachment[file]', file);
  data.append('attachment[uid]',  uid);

  $.ajax({
    url: '/attachments',
    data: data,
    cache: false,
    contentType: false,
    processData: false,
    type: 'POST',
  }).error(function(){
    // ...
  });

  var absText = '![' file.name + '](/attachments/' + uid + ')';
  $('.new_post_area').insertAtCaret(absText);
};
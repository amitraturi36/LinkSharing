// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self
//= require bootstrap.min
//= require jquery-1.8.3.min
//= require changeread
//= require spinner.js
//= require jquery.spinner.js
//= requireindex.js
//= require profile_jquery.js
//= require sidebarscroll.js
//= require scroll_jquery.js
//= require profilecommon-scripts.js

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1107707042583570";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function twitter() {


    window.open("https://twitter.com/intent/tweet?text=Hello%20world", "_blank", "resizable=yes, top=200, left=300, width=800, height=600")
}



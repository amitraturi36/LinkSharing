
$('.readitem').on("click", function(e){$(".readitem").html("hello");
    jQuery.ajax({url: "/readingItems/changeIsRead", success: function(){
       // $(".readitem").html("hello");
        console.log("hello")
    }});
});

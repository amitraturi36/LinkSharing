function read(id) {
    jQuery.ajax({
        url: "/readingItems/changeIsRead",
        data: {id: id},
        success: function (message) {
            val = $('#' + id).html()
            $('#' + id).html("<span style='background-color:limegreen'>" + val + "</span>")
            if (message.status == 1) {
                $('#mainmessage').text(message.message)
            }
            else {
                $('#mainerror').text(message.error)
            }

        }
    });
}
function deleteresource(id) {
    jQuery.ajax({
        url: "/resource/delete",
        data: {id: id},
        success: function () {
            $('#post' + id).html('')


        }
    });

}
function resourcerating(id) {


}


//$(function () {
//    $('#myform').fileupload({
//        dataType: 'json',
//        done: function () {
//            alert("sucess")
//        }
//    });
//});
//
//
//    $('').ajaxSubmit({
//        async: true,
//        url:"/resource/saveDocument",
//        success: function () {
//            alert("success")
//        }
//    });


function sendinvitation() {
    var oData = new FormData(document.forms.namedItem('invitationform'))
    jQuery.ajax({
        type: 'POST',
        url: "/user/sendInvitation",
        data: oData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function () {
            $('myModal2').remove(this)
        }
    });
    return false

}
function passwordchange() {
    var oData = new FormData(document.forms.namedItem('forgetpassform'))
    jQuery.ajax({
        type: 'POST',
        url: "/user/changePassword",
        data: oData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function () {
            $('#forgetpassform').html(data)
        },
        fail: function (data, status) {

            $("#forgetpassword").html(data.data)
        }
    });
    return false
}


function seriousnesschange(subId) {
    var oData = $('#sub' + subId).val()
    jQuery.ajax({
        type: 'POST',
        url: "/Subscription/ update",
        data: {
            subId: subId,
            seriousness: oData
        }
    });
}


function visiblitychange(topicId) {
    var oData = $('#vistopic' + topicId).val()
    jQuery.ajax({
        type: 'POST',
        url: "/topic/visiblity",
        data: {
            topicId: topicId,
            visiblity: oData
        }
    });
}


function subscriptionstatus(topicId, status) {
    if (status == 1) {
        url = '/subscription/delete'
    }
    else {
        url = '/subscription/save'
    }
    jQuery.ajax({
        type: 'POST',
        url: url,
        data: {id: topicId},
        success: function () {
            $('#user' + status + topicId).html('');
            if (status == 1) {
                $('#mainmessage').text("successfully unsubscribed")
            }
            else {
                $('#mainmessage').text("successfully subscribed")
            }
        }
    })
}
function download(id) {
    var a = this
    jQuery.ajax({
        type: 'POST',
        url: "/documentResource/download",
        data: {resourceId: id},
        success: function (download) {
            console.log(download.download)
            if (download.download == 1) {
                $("#resc" + id).attr("href", "file:///home/amit/projects/LinkSharing/grails-app/assets/images/user.png");
                $("#resc" + id).attr(download)
                $("#resc" + id + '1').text("Click Again")
            }


            else {
                $("#resc" + id).text("Permission dennied")
            }
        }
    })

}
function topicdelete(topicId){
    jQuery.ajax({
        type: 'POST',
        url: "/topic/delete",
        data: {topicId: topicId},
        success: function (message) {
            if(message.message) {
                $('#user' + status + topicId).html('');
                $('#mainmessage').text(message.message)
            }
            else{
                $('#mainerrors').text("Topic Not Deleted")
            }
        }
    })
}
function pagination() {

    jQuery.ajax({
        url: "/user/profile",
        success: function () {
            // location.refresh()
        }
    })

}
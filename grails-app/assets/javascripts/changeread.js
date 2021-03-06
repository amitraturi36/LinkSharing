function read(id) {
    jQuery.ajax({
        url: "/readingItems/changeIsRead",
        data: {id: id},
        success: function (message) {
            val = $('#' + id).html()
            $('#' + id).html("<span class='alert-success'>" + val + "</span>")
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
    var oData = $('#resc' + id).val()
    jQuery.ajax({
        url: "/resourceRating/resourcerating",
        data: {
            id: id,
            score: oData
        },
        success: function (message) {
            if (message.message) {
                $('#mainmessage').text(message.message)
            }
            else {
                $('#mainerror').text(message.error)
            }


        }
    });
}

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
            $('#user'+status +topicId).html('');

            if (status == 1) {
                $('#mainmessage').text("successfully unsubscribed")
                $('.usersub1'+topicId).text('subscribe')
                $('.usersub1'+topicId).attr('onclick','subscriptionstatus('+topicId+',0)')
            }
            else {
                $('#mainmessage').text("successfully subscribed")
                $('.usersub0'+topicId).text("UnSubscribe")
                $('.usersub0'+topicId).attr('onclick','subscriptionstatus('+topicId+',1)')
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
                console.log(download.resource)
                $("#rescdownl" + id).attr('download', true)
                $("#rescdownl" + id).attr("href", download.resource);
                $("#rescdownl" + id + '1').text("Click Again")
            }
            else {
                $("#resc" + id).text("Permission dennied")
            }
        }
    })

}
function topicdelete(topicId) {
    jQuery.ajax({
        type: 'POST',
        url: "/topic/delete",
        data: {topicId: topicId},
        success: function (message) {
            if (message.message) {
                $('#user' + 1 + topicId).html('');
                $('#mainmessage').text(message.message)
            }
            else {
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
function activation(uid, status) {
    jQuery.ajax({
        type: 'POST',
        url: "/user/changeActivation",

        data: {uId: uid, status: status},
        success: function (data) {
            if (data.message) {

                $("#admin" + uid).text("Deactivate")
                $("#admin" + uid).removeClass("text-success").addClass( "text-danger" )
                $("#admincol"+uid).removeClass("alert-danger").addClass( "alert-success" )
                $("#admin" + uid).attr('onclick',"activation("+uid+",0)")
                $('#mainmessage').text(data.message)
            }
            else if (data.error) {
                $("#admin" + uid).text("Activate")
                $("#admin" + uid).removeClass("text-danger").addClass( "text-success" )
                $("#admincol"+uid).removeClass("alert-success").addClass( "alert-danger" )
                $("#admin" + uid).attr('onclick','activation('+uid+',1)')
                $('#mainerror').text(data.error)
            }
            else {

            }
        }
    })
}
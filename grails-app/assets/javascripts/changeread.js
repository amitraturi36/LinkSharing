function read(id) {
    jQuery.ajax({
        url: "/readingItems/changeIsRead",
        data: {id: id},
        success: function (message) {
            val1 = $('#' + id).html()
            $('#' + id).html("<span class='alert-success'>" + val1 + "</span>")
            if (message.status == 1) {

                $('#messageanderrorblock').html("<div id='mainmessage' class='alert-success text-success' style='padding: 20px;font-size: large;margin-bottom: 20px;margin-top: 20px'>" +
                    message.message +
                    " <span class='glyphicon glyphicon-remove'style='float: right;cursor:pointer' onclick='suspend()'></span>" +
                    "</div>")
            }
            else {

                $('#messageanderrorblock').html("<div id='mainerrors' class='alert-danger text-danger' style='padding: 20px;font-size: large;margin-bottom: 20px;margin-top: 20px'>" +
                    message.error
                    + " <span class='glyphicon glyphicon-remove'style='float: right;cursor:pointer' onclick='suspend()'></span>" +
                    "</div>")
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
            $('#messageanderrorblock').html("<div id='mainmessage' class='alert-success text-success' style='padding: 20px;font-size: large;margin-bottom: 20px;margin-top: 20px'>" +
                "Successfully deleted" +
                " <span class='glyphicon glyphicon-remove'style='float: right;cursor:pointer' onclick='suspend()'></span>" +
                "</div>")

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
        success: function (response) {

            if (!response.status) {
                $('#forgetpasswordmessage').html("<div id='forgetpasswordmessage' class='alert-danger' style='height: 5%'>" + "Email Not Matched Please Enter Valid Email Address" + "</div>")
                $('#forgetpassform')[0].reset();
            }
            else {
                $('#forgetpasswordmessage').html("<div id='forgetpasswordmessage' class='alert-success' style='height: 5%'>" + "Password Updated Please Check you Email" + "</div>")
                $('#forgetpassform')[0].reset();
            }
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
        success: function (data) {
            $('#user' + status + topicId).html('');
            $("#inboxpanel").html(data)
            if (status == 1) {
                $('#mainmessage').text("successfully unsubscribed")
                sub = $('.usersub1' + topicId)
                sub.text("Subscribe")
                sub.addClass('usersub0' + topicId)
                sub.attr('onclick', 'subscriptionstatus(' + topicId + ', 0 )')
                sub.removeClass('usersub1' + topicId)
            }
            else {
                $('#mainmessage').text("successfully subscribed")
                sub = $('.usersub0' + topicId)
                sub.text("UnSubscribe")
                sub.addClass('usersub1' + topicId)
                sub.attr('onclick', 'subscriptionstatus(' + topicId + ', 1 )')
                sub.removeClass('usersub0' + topicId)
            }
        }
    })
}
function download(id) {

    jQuery.ajax({
        type: 'POST',
        url: "/documentResource/download",
        data: {resourceId: id},
        success: function (download) {

            if (download.download == 1) {

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

                $('#messageanderrorblock').html("<div id='mainmessage' class='alert-success text-success' style='padding: 25px;font-size: large;margin-bottom: 20px;margin-top: 20px;margin-left: -2%;" +
                    " margin-right: -2%;'>" +
                    message.message +
                    " <span class='glyphicon glyphicon-remove'style='float: right;cursor:pointer' onclick='suspend()'></span>" +
                    "</div>")
            }
            else {
                $('#mainerrors').text("")
                $('#messageanderrorblock').html("<div id='mainerrors' class='alert-danger text-danger' style='padding: 25px;font-size: large;margin-bottom: 20px;margin-top: 20px;" +
                    "margin-left: -2%;margin-right: -2%;'" +

                    "Topic Not Deleted" + " <span class='glyphicon glyphicon-remove'style='float: right;cursor:pointer' onclick='suspend()'></span>" +
                    "</div>")
            }
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
                $("#admin" + uid).removeClass("text-success").addClass("text-danger")
                $("#admincol" + uid).removeClass("alert-danger").addClass("alert-success")
                $("#admin" + uid).attr('onclick', "activation(" + uid + ",0)")
                $('#mainmessage').text(data.message)
            }
            else if (data.error) {
                $("#admin" + uid).text("Activate")
                $("#admin" + uid).removeClass("text-danger").addClass("text-success")
                $("#admincol" + uid).removeClass("alert-success").addClass("alert-danger")
                $("#admin" + uid).attr('onclick', 'activation(' + uid + ',1)')
                $('#mainerror').text(data.error)
            }
            else {

            }
        }
    })
}


$("document").ready(function () {

    function locationHashChanged() {
        if (location.hash) {
            var hash = window.location.hash
            console.log(hash);
            if (window.location.hash == "#inbox") {
                inboxload();
            }
            else if (window.location.hash == "#subscribedTopics") {
                subscribedtopicload();
            }
            else if ((window.location.hash == "#subscribedUser")) {
                subscribeduserload()
            }
            else if (window.location.hash == "#topicCreated") {

                createdtopicload()
            }
            else if (hash.indexOf("#topic:") > -1) {
                topicload(hash.substring(hash.indexOf(':') + 1))
            }
            else if (hash.indexOf("#resource-") > -1) {

                resourceload(hash.substring(hash.indexOf('-') + 1), 1)

            }
           else if(hash=="#setting"){
                settingload()
            }
           else if(hash.indexOf("#profile:") > -1){
                profileload(hash.substring(hash.indexOf(':') + 1), 1)
            }
            else if (window.location.hash == "#trendingtopic") {
                trendingtopicload();
            }
        }
    }

    window.onhashchange = locationHashChanged;


    $("#inputEmail").keyup(function () {
        userval = $("#inputEmail").val();
        if ((userval == "") || (userval == null) || (userval == ' ')) {
            $("#loginformemail").html("<span id='loginformemail' class='alert-danger ' style='float: right;margin-right:10% '>" + "Email can not be empty" + "</span>")
        } else {
            jQuery.ajax({
                type: 'POST',
                url: "/user/checkUniqueUser",

                data: {userName: userval},
                success: function (data) {
                    if (data.form1) {
                        $("#loginformemail").html("<span id='loginformemail' class='alert-danger ' style='float: right;margin-right:5% '>" + data.form1 + "</span>")
                    } else {
                        $("#loginformemail").html("<span id='loginformemail' class='alert-success ' style='float: right;margin-right: 5%'>" + "User Matched" + "</span>")
                    }
                }


            })
        }
    });

    $("#form2Email").keyup(function () {
        userval = $("#form2Email").val();
        if ((userval == "") || (userval == null) || (userval == ' ')) {
            $("#loginform2email").html("<span id='loginform2email' class='alert-danger ' style='float: right;margin-right:10% '>" + "Email can not be empty" + "</span>")
        }
        else {
            jQuery.ajax({
                type: 'POST',
                url: "/user/checkUniqueUser",

                data: {
                    userName: userval,
                    status: 2
                },
                success: function (data) {
                    if (data.form2) {
                        $("#loginform2email").html("<span id='loginform2email' class='alert-danger ' style='float: right;margin-right:10% '>" + data.form2 + "</span>")
                    } else {
                        $("#loginform2email").html("<span id='loginform2email' class='alert-success ' style='float: right;margin-right: 10%'>" + "Email Is unique" + "</span>")
                    }
                }


            })
        }

    });

    $("#form2Username").keyup(function () {
        userval = $("#form2Username").val();
        if ((userval == "") || (userval == null) || (userval == ' ')) {
            $("#loginform2username").html("<span id='loginform2username' class='alert-danger ' style='float: right;margin-right:10% '>" + "User name cannot be Null" + "</span>")
        }
        else {
            jQuery.ajax({
                type: 'POST',
                url: "/user/checkUniqueUser",

                data: {
                    userName: userval,
                    status: 1
                },
                success: function (data) {
                    if (data.form2) {
                        $("#loginform2username").html("<span id='loginform2username' class='alert-danger ' style='float: right;margin-right:10% '>" + data.form2 + "</span>")
                    } else {
                        $("#loginform2username").html("<span id='loginform2username' class='alert-success ' style='float: right;margin-right: 10%'>" + "UserName Is unique" + "</span>")
                    }
                }


            })
        }
    });
    $("#resetregistrationform").click(function () {
        $("#loginform2username").html("<span id='loginform2username'></span>")
        $("#loginform2email").html("<span id='loginform2email'></span>")


    });


    setInterval(function () {
        $("#inboxpanel").load("/user/inbox", {"q": $("#srch-inbox").val(), status: 1});
    }, 5000);
    setInterval(function () {
        $("#header_inbox_bar").load("/user/inboxbar");
    }, 6000);


});
function linkresource() {
    var oData = new FormData(document.forms.namedItem('linkresourceform'))
    jQuery.ajax({
        type: 'POST',
        url: "/LinkResource/saveLinkResources",
        data: oData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function (data) {

            if (data.message) {
                $("#linkspan").html("<div class='alert-success'>" + data.message + "</div>")
            } else {
                $("#linkspan").html("<div class='alert-danger'>" + data.errors + "</div>")
            }
        }
    });
    return false
}

function docresource() {
    var oData = new FormData(document.forms.namedItem('mydocform'))
    jQuery.ajax({
        type: 'POST',
        url: "/documentResource/saveDocument",
        data: oData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function (data) {

            if (data.message) {
                $("#docspan").html("<div class='alert-success'>" + data.message + "</div>")
            } else {
                $("#docspan").html("<div class='alert-danger'>" + data.errors + "</div>")
            }
        }
    });
    return false
}
function recentshare(status) {
    $("#recentshare").load("/resource/recentPost", {"status": status})

}
function inboxload() {
    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3, // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/user/inboxload")
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })
}
function subscribedtopicload() {
    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/topic/subTopic")
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })
}
function createdtopicload() {
    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/topic/topicLoad", {"status": 2})
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })
}
function subscribeduserload() {

    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/topic/topicLoad", {"status": 8})
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })

}
function inboxsearch() {
    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#loader").animate({
        top: -200
    }, 1500);
    $("#inboxpanel").load("/user/inbox", {"q": $("#srch-inbox").val()})
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })

}
function suspend() {
    $("#messageanderrorblock").html('')
}
function topicload(id) {

    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/topic/show/" + id, {"status": 8})
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })

}
function resourceload(id, status) {

    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/resource/show", {"id": id, "status": status})
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })

}
function postSearch() {

    $("#postwithintopic").load("/resource/postSearch", {
        "q": $("#srch_topic_post").val(),
        topicId: $("#post-topicId").val()
    });
}
function settingload() {

    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/user/settings")
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })

}
function profileload(user) {
    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/user/profile",{'userId':user})
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })

}
function trendingtopicload(){

    $("#trigger").html("<div id='log'></div>");
    var spinner = new Spinner({
        lines: 15, // The number of lines to draw
        length: 15, // The length of each line
        width: 3,  // The line thickness
        radius: 10, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    }).spin(document.getElementById("log"));
    $("#dashboardcontentbody").load("/topic/trendingTopic")
    $("#dashboardcontentbody2").html("")
    $(document).ajaxComplete(function () {
        $("#log").hide().spin(false);
    })
}
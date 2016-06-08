<!doctype html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <title>Link Sharing</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="canonical" href="https://dev.twitter.com/web/tweet-button">
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>

    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>


</head>

<body>
<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into Facebook.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '1107707042583570',
            cookie     : true,  // enable cookies to allow the server to access
            status: true,              // the session
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.5' // use graph api version 2.5
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

//        FB.getLoginStatus(function(response) {
//            statusChangeCallback(response);
//        });

    };
    function facebook() {

        FB.Event.subscribe('auth.statusChange', function(response) {
            // do something with response
            console.log(response, "STTSTS");
        });
        FB.getLoginStatus(function (resp) {
            console.log(resp);
            if (resp.authResponse) {
                testAPI(resp)
            } else {
                FB.login(function (response) {
                    console.log(response);
                    if(resp.status === "connected") {
                        testAPI(response);
                    }
                    else{
                        statusChangeCallback(response);
                    }
                    // handle the response
                }, {scope: 'email,public_profile'});
            }
        });

    }
    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        var obj;
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', {fields: "id,email,picture,first_name,last_name"}, function(response) {
            obj =JSON.stringify(response);
            console.log('Successful login for: ' + obj);
            jQuery.ajax({
                type: 'POST',
                url: "/facebook/register",

                data: {
                    obj:obj,
                    status:1


                },
                success: function (data) {
                    if(data==2){

                        window.location.href="/login/auth"
                    }

                }


            });


        });

    }

</script>
<div id="changebody" >
<div id="loginbody">
    <div class="container  ">
        <div class="row pull-right">

            <div class="search pull-right">
                <g:form name="globalsearch" url="/topic/search">
                    <input type="text" class="form-control input-sm" maxlength="64" name="q"
                           placeholder="Search" required/>
                    <Button type="submit" class="  btn btn-primary btn-sm ">Search</Button>
                </g:form>
            </div>

        </div>
    </div>

    <div id="header-wrapper" style="padding-top:5px ">
        <div id="header" class="container">
            <div id="logo">
                <h1><a href="#">Link Sharing</a></h1>
                <span>Share Download and Upload New REsources</span>

            </div>

        </div>
    </div>

    <div id="three-column" class="container" style="margin-top: -10%">
        <div style="margin-left: 10%">
            <div><span class="arrow-down"></span></div>

            <div id="tbox1">
                <a href="#toppostbody">
                    <span class="icon "><span class="glyphicon glyphicon-tags"></span></span>

                    <div class="title special" style="text-decoration: none">
                        <h2>Top Posts</h2>
                    </div>
                </a>

                <p>CheckOut The Top Resources</p>
            </div>

            <div id="tbox2">
                <a href="#recentsharebody">
                    <span class="icon"><span class="glyphicon glyphicon-tag"></span></span>

                    <div class="title special" style="text-decoration: none">

                        <h2>Recent Shares</h2>
                    </div>
                </a>

                <p>Check Out what peoples are Recently Sharing</p>
            </div>

            <div id="tbox3">
                <a href="#logintemplate">
                    <span class="icon"><span class="glyphicon glyphicon-lock"></span>
                    </span>

                    <div class="title special" style="text-decoration: none">
                        <h2>Login</h2>
                    </div>
                </a>

                <p>Login And Join  the World Of LinkSharing where you can create new topics Share  And Download Resources</p>
            </div>
        </div>
    </div>
</div>

<div id="wrapper2">
    <div id="welcome" class="container" style="padding-top: 5px">
        <div class="title" id="logintemplate">
            <h2>Login Or Create Your Account</h2>
        </div>


            <g:if test="${error}">

               <span class="alert-danger h4" style="margin-left:5%;padding:15px  ">${error}</span>
                <div style="margin-top: -70px">
            </g:if>
        <g:else>
            <div style="margin-top: -70px">
        </g:else>
            <g:render template="login"/>
            <g:render template="/login/forgetPassword"/>
        </div>
    </div>

    <div id="recentsharebody">

        <div class="title" style="text-align: center;padding-top: 1%">
            <h2>Recent Shared</h2>
            <span class="byline">Recent Posts share By the Users</span>

            <div class=" col-sm-12 ">

                <div class="nav navbar" style="margin-right: 45%;">
                    <a class="btn dropdown-toggle " data-toggle="dropdown" href="#"
                       style="font-size: 20px ">
                        Today
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu   " style="    margin-left: 76%;">
                        <li value="1" onclick=" recentshare(1)"><a style="cursor: pointer">Week</a></li>
                        <li class="divider"></li>
                        <li value="2" onclick=" recentshare(2)"><a style="cursor: pointer">Month</a></li>
                        <li class="divider"></li>
                        <li value="3" onclick=" recentshare(3)"><a style="cursor: pointer">Year</a></li>
                    </ul>

                </div>

            </div>

        </div>
        <br>


        <div class="col-sm-12">
            <br> <br>
            <ls:recentshare/>

        </div>

    </div>

    <div class="col-sm-12">
        <div id="toppostbody" style="padding-top: 5%;">
            <div class="title" style="text-align: center;">
                <h2>Top Posts</h2>
                <span class="byline">Top Posts share By the Users</span>
                <br/><br/><br/> <br/>
            </div>
        </div>
        <ls:toptopics/>

    </div>

    <span><br/></span>

    <div class="col-sm-12" style="margin-top: 10%;margin-bottom: 10%"><a href="#loginbody"><button
            class="btn btn-block form-control  "
            style="align-items: center ;border-radius:10px;width: 25%;font-size: 20px;
            height: 60px; margin-right: 35%;background: blueviolet;
            color: floralwhite;
            font-family: monospace; ">Go Back To Top</button></a></div>
    </div>
    </div>


    <div id="copyright" class="container">
        <div style="text-align: center;    margin-left: 20%;">
            <img src="${assetPath(src: 'tothe newdigital.jpeg')}" width="120px" height="120px"
                 class="pull-left colsm-3">

            <p class="h3 col-sm-8"
               style="color: #45443B;text-decoration: blink">&copy; All rights reserved by <a
                    href="http://ToTheNew.com/" style="color: black" class="h2">To the New Digital</a> .</p>
        </div>
    </div>

    <div id="wrapper4">
        <div id="footer" class="container">
            <div id="loginfooter" style="margin-left:-10%;margin-right:-10%;padding-bottom: 5% ;padding-top: 5%">
                <header class="title">
                    <h2>Get in touch</h2>
                    <span class="byline">Like Us</span></header>
                <ul class="contact">
                    <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
                    <li><a href="#" class="icon icon-facebook"><span></span></a></li>
                    <li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
                    <li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
                    <li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
                </ul>
            </div>
        </div>
    </div>


<script>
    $("#myregisterform").validate({
        rules: {
            passwrd: "required",
            CnfrmPsswrd: {
                equalTo: "#passwrd"
            },
            fname: {
                required: true,
                pattern: /^[A-Za-z0-9\w]{4,20}/

            }
        }
    });

</script>
</body>
</html>



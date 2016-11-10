<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>LinkSharing</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="canonical" href="https://dev.twitter.com/web/tweet-button">
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="sidebarscroll.js"/>
    <asset:javascript src="/scroll_jquery.js"/>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<body>
<div id="loginbody" class="col-sm-12">

        <a href="/user/index.html" class="logo" ><b>LinkSharing</b></a>

    </div>
<div style="    text-align: center;">
    <a href="/user/profile?userId=${user.id}"><ls:userImage user="${user}"/></a>
    <span class="text-muted col-sm-12 h4"><strong><a href="/user/profile?userId=${user.id}"
    style="text-decoration: none">${user.name}</a></strong>
    </span>
</div>
<div class="col-sm-12 col-lg-12" style="background: aliceblue;">
    <div class="row">

        <div class="col-lg-9 main-chart" >

            <div class="row mtbox" style="margin-left: 35%">
                <div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                    <div class="box1">
                        <span class="li_heart"></span>
                    <h3><ls:subscribedusers user="${user.id}"/></h3>
                </div>
                <p>${user.name} have total <ls:subscribedusers user="${user.id}"/> Subscriptions ..</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_world"></span>
                        <h3>+<ls:createdByresourceCount user="${user.id}"/></h3>
                    </div>
                    <p>Total  <ls:createdByresourceCount user="${user.id}"/>  Posts Are Uploaded To ${user.name} Topics.</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_stack"></span>
                        <h3><ls:besttopiccount user="${user.id}" /></h3>
                    </div>
                    <p>${user.name} Best Topic Have<ls:besttopiccount user="${user.id}" /> Posts</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_news"></span>
                        <h3>+<ls:topicCount user="${user.id}"/></h3>
                    </div>
                    <p>${user.name} Have Created <ls:topicCount user="${user.id}"/> topics .</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_user"></span>
                        <h3>+<ls:subscriptionCount user="${user}"/></h3>
                    </div>
                    <p><ls:subscriptionCount user="${user}"/> Users are SubScribed TO ${user.name}'s Topics</p>
                </div>

            </div><!-- /row mt -->






        </div><!-- /col-lg-9 END SECTION MIDDLE -->
</div>


    <div id="copyright" class="container" style="margin-top: 5%">
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
            <div id="loginfooter" style="margin-left:-10%;margin-right:-20%;padding-bottom: 5% ;padding-top: 5%">
                <header class="title">
                    <h2>Get in touch</h2>
                    <span class="byline">Like Us</span></header>
                <ul class="contact">
                    <li><a href="https://twitter.com/tothenew?lang=en" class="icon icon-twitter"><span>Twitter</span></a></li>
                    <li><a href="https://www.facebook.com/tothenewdigital/" class="icon icon-facebook"><span></span></a></li>
                    <li><a href="https://plus.google.com/+Intelligrape/videos" class="fa fa-google-plus"><span class="fa-google-plus"></span></a></li>
                    <li><a href="https://www.linkedin.com/company/tothenew" class="fa fa-linkedin "><span class="fa-linkedin "></span></a></li>
                </ul>
            </div>
        </div>
    </div>

</div>
</body>
</html>
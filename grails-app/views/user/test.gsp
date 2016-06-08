<%--
  Created by IntelliJ IDEA.
  User: amit
  Date: 21/3/16
  Time: 11:30 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html itemscope itemtype="http://schema.org/Education">
<head>
    <!-- Update your html tag to include the itemscope and itemtype attributes. -->
    <!-- Add the following three tags inside head. -->
    <meta itemprop="name" content="LinkSharing">
    <meta itemprop="description" content=" topic have awesome resources please check them out at">
    <meta itemprop="image" content="/home/amit/Downloads/linksharing.png">
    <meta name="layout" content="main"/>
    <link rel="canonical"
          href="https://dev.twitter.com/web/tweet-button">
    <asset:stylesheet src="bootstrap.min.css"/>
    <title></title>
</head>

<body>
<div id="fb-root"></div>

%{--<div class="fb-share-button" style="transform: scale(3);margin-left: 2%" data-href="http://www.sumitraturi.com" data-layout="icon"></div>--}%
%{--<a class="twitter-share-button btn fa fa-twitter" onclick="twitter()">--}%
    %{--</a>--}%
%{--<div class="g-plusone" data-annotation="inline" data-width="300"></div>--}%
%{--<script src="https://apis.google.com/js/platform.js" async defer></script>--}%
%{--<div class="g-follow" data-href="https://plus.google.com/{pageId}" data-rel="{relationshipType}"></div>--}%
<!-- Place this tag in your head or just before your close body tag. -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- Place this tag where you want the share button to render. -->
<div class="g-plus" data-action="share"></div>
<script type="text/javascript">
    (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/platform.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
    })();
</script>


</body>
</html>
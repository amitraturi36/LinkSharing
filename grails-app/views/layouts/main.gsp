<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>

</head>

<body>
<div class="navbar navbar-default ">
    <div class="container-fluid headbgcolor" style="border:1px solid grey">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="#" class="col-sm-6 "><h3 style="margin:0px" data-toggle="modal"
                                                      data-target="#myModal0"><ins>Link Sharing</ins></h3></a>

                    <div id="myModal0" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Send Invitations</h4>
                                </div>

                                <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">
                                    <form class="inline-form">
                                        <span class=" col-sm-4">Link<sup>*</sup></span>
                                        <input type="Text" class=" col-sm-6"><br/><br/>

                                        <span class=" col-sm-4">Description<sup>*</sup></span>
                                        <textarea rows="4" cols="50" class=" col-sm-6"></textarea><br/><br/>

                                        <span class=" col-sm-4" style="margin:10px 0px">Topics<sup>*</sup></span>
                                        <select class=" col-sm-5" style="background:white;margin:10px 0px">
                                            <option>Serious</option>
                                            <option>notserious</option>
                                        </select>

                                    </form><br/><br/><br/>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default">Share</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>

                        </div>
                    </div>

                </li>
                <li><a href="#" class="col-sm-3"><form class="form-control" style="overflow:hidden">
                    <div class="inner-addon left-addon">
                        <i class="glyphicon glyphicon-search" style="margin:-5px -10px"></i><input type="search"
                                                                                                   placeholder="Search"
                                                                                                   style="overflow:hidden ;border:none;background:white"/>
                    </div>
                </form></a></li>

                <div class=" col-sm-3 " style="padding:10px 0px;margin:10px 0px">
                    <li><a href="#" class="glyphicon glyphicon-comment" style="padding:0px 5px;margin:0px 5px"
                           data-toggle="modal" data-target="#myModal1"></a>

                        <div id="myModal1" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Create Topics</h4>
                                    </div>

                                    <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">
                                        <form class="inline-form">
                                            <span class=" col-sm-4">Name<sup>*</sup></span>
                                            <input type="Text" class=" col-sm-6"><br/><br/>
                                            <span class=" col-sm-4">Visiblity<sup>*</sup></span>
                                            <select class=" col-sm-5" style="background:white">
                                                <option>Public</option>
                                                <option>Private</option>
                                            </select>
                                        </form>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default">Save</button>
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>




                        <a href="#" class="glyphicon glyphicon-envelope" style="padding:0px 7px;margin:0px 7px"
                           data-toggle="modal" data-target="#myModal2"></a>


                        <div id="myModal2" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Send Invitations</h4>
                                    </div>

                                    <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">
                                        <form class="inline-form">
                                            <span class=" col-sm-4">Email<sup>*</sup></span>
                                            <input type="Text" class=" col-sm-6"><br/><br/>
                                            <span class=" col-sm-4">Topics<sup>*</sup></span>
                                            <select class=" col-sm-5" style="background:white">
                                                <option>Subscribe</option>
                                                <option>Unsubscribe</option>
                                            </select>

                                        </form>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default">Invite</button>
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>




                        <a href="#" class="glyphicon glyphicon-link" style="padding:0px 7px;margin:0px 7px"></a>
                        <a href="#" class="glyphicon glyphicon-file" style="padding:0px 7px;margin:0px 7px"></a>

                        <div style="position:absolute;top:3px;right:20px;"><a
                                class="btn dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
                                href="#">uday
                            <span class="caret"></span>
                        </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Profile</a></li>
                                <li><a href="#">Users</a></li>
                                <li><a href="#">Topics</a></li>
                                <li><a href="#">Posts</a></li>
                                <li><a href="#">LogOut</a></li>
                            </ul></div>

                    </li>
                </div>

            </ul></div>
    </div></div>

<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>

<!doctype html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

</head>

<body>
<!------------ box1 -->


<div class="col-sm-6">

    <div>
        <div class="panel-default ">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey;background-color: black">
                <div class="col-sm-8 h4" style="color:white">Recent Shares</div>

                <div class="col-sm-4 " ><a class="btn dropdown-toggle " data-toggle="dropdown" href="#" style="color:white;font-size: 20px ">
                   Today
                    <span class="caret" style="color:white"></span>
                </a>
                    <ul class="dropdown-menu">
                        <li value="1"><a href="#">Week</a></li>
                        <li class="divider"></li>
                        <li value="2"><a href="#">Month</a></li>
                        <li class="divider"></li>
                        <li value="3"><a href="#">Year</a></li>
                    </ul></div>

            </div>

            <div class="panel-body col-sm-12" style="border:1px solid grey">
                <g:each in="${recentpost}" var="post">
                    <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${post.createdBy}"/>
                    </div>

                    <div class="text-info" style="float: right">${post.topic}</div>
                    <span class=" col-sm-6 " style="font-size: 15px;padding:20px 15px;">${post.createdBy}</span>
                    <span class=" col-sm-3 text-muted "
                          style="padding:20px 0px;">@${post.createdBy.firstName}<g:formatDate date="${post.dateCreated}"
                                                                                              type="time"
                                                                                              style="SHORT"/></span>

                    <p class="text-muted col-sm-10">${post.description}</p>

                    <div class=" col-sm-12 row">
                        <a href="http://www.facebook.com"><i class="fa fa-facebook "
                                                             style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.google.com"><i class="fa fa-google"
                                                           style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.twitter.com"><i class="fa fa-twitter"
                                                            style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <ins><g:link url="/resource/show?id=${post.topicId}" class="text-info" style="float: right" >View post</g:link></ins>
                    </div>
                    <br/><br/> <br/><br/>
                </g:each>

            </div>

        </div></div>
    <ls:toptopics/>

</div>

<div class="col-sm-6 " style="padding-left:10px;">

    <div class="panel-default  ">
        <div class="panel-heading" style="border: 1px solid grey;background:black;color:white "><h4>Login</h4>
        </div>

        <div class="panel-body " style="border:1px solid grey">

            <g:form class="form-inline" role="form" url="[action: 'loginHandler']">
                <div class="form-group">
                    <label class="control-label col-sm-4 h4" for="Email">Email/UserName<sup>*</sup></label>
                    <input type="email" class="form-control col-sm-4" id="inputEmail" placeholder="Email"
                           name="username"
                           style="border: 1px solid grey; margin-left:40px ">
                    <br/><br/><br/><br/>


                    <label class="control-label col-sm-5 h4" for="inputPassword">Password<sup>*</sup></label>
                    <input type="password" class="form-control col-sm-6" id="inputPassword" name="password"
                           placeholder="Password"
                           style="border: 1px solid grey;"><br/><br/><br/><br/>
                    <a href="#" data-toggle="modal"
                       data-target="#forgetpassword "><span class="col-sm-8 text-info h4">Forgot Password</span></a>
                    <g:submitButton name="Login" class="btn col-sm-4 btn-default form-control" value="Login" style="border:1px solid grey;background-color: black;color: white  "/>
                </div>
            </g:form>
            <g:render template="/login/forgetPassword"></g:render>
        </div></div><br/><br/><br/><br/>


    <div class="panel-default ">
        <div class="panel-heading " style="border: 1px solid grey; background:black;color: white"><h4>Register</h4>
        </div>

        <div class="panel-body " style="border:1px solid grey">
            <span class="col-sm-12"></span>

            <g:uploadForm class="form-inline cmxform" role="form" url="/user/register" method="post"
                          name="myregisterform">
                <div class="form-group col-sm-12">
                    <fieldset>
                        <label class="control-label col-sm-6 h4" for="Fname">First Name<sup>*</sup></label>
                        <input type="text" name="fname" class="form-control col-sm-5 "
                               style="border:1px solid grey" required><br/><br/><br/><br/>



                        <label class="control-label col-sm-6 h4" for="Lname">Last Name<sup>*</sup></label>
                        <input type="text" name="lname" class="form-control col-sm-6"
                               style="border:1px solid grey" required><br/><br/><br/><br/>
                        <label class="control-label col-sm-6 h4" for="Email">Email<sup>*</sup></label>
                        <input type="email" name="email" class="form-control col-sm-6  "
                               style="border:1px solid grey" required><br/><br/><br/><br/>



                        <label class="control-label col-sm-6 h4" for="uname">Username<sup>*</sup></label>
                        <input type="text" name="uname" class="form-control col-sm-6"
                               style="border:1px solid grey" required><br/><br/><br/><br/>
                        <label class="control-label col-sm-6 h4" for="pass">Password<sup>*</sup></label>
                        <input type="password" id="passwrd" name="passwrd" class="form-control col-sm-6 "
                               minlength="5" style="border:1px solid grey" required><br/><br/><br/><br/>



                        <label class="control-label col-sm-6 h4 " for="CPassword">Confirm Password<sup>*</sup></label>
                        <input type="password" name="CnfrmPsswrd" id=" CnfrmPsswrd" class="form-control col-sm-6"
                               style="border:1px solid grey"
                               style="border:1px solid grey" required><br/><br/><br/><br/>

                        <label class="control-label col-sm-6 h4 text-info" for="photo">Photo</label><span class="col-sm-2 "
                                                                                                       style="width:85px;height:20px;border:1px solid grey;"></span>

                        <div class="form-group">
                            <div>
                                <label for="files"><span class="btn"
                                                         Style="border:1px solid grey;padding:0px 30px">Browse</span>
                                </label>
                                <input style="visibility: hidden; position: absolute;" id="files" class="form-control"
                                       type="file" name="photo">


                            </div>

                        </div><br/><br/>


                        <span class="col-sm-8 text-info"></span>  <g:submitButton name="submit" class="form-control"
                                                                                  type="submit" style="background-color: black;color: white" value="Register"/>
                    </fieldset>
                </div>
            </g:uploadForm></div></div>
    <script>
        // just for the demos, avoids form submit

        $("#myregisterform").validate({
            rules: {
                passwrd: "required",
                CnfrmPsswrd: {
                    equalTo: "#passwrd"
                }
            }
        });

    </script>
</div>

</body>
</html>



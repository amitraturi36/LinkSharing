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


<div class="col-sm-6  ">

    <div z>
        <div class="panel-default ">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;"><div
                    class="col-sm-8">Recent Shares</div>

                <div class="col-sm-4"><a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                    Today
                    <span class="caret"></span>
                </a>
                    <ul class="dropdown-menu">
                        <li value="1"><a href="#">Week</a></li>
                        <li value="2"><a href="#">Month</a></li>
                        <li value="3"><a href="#">Year</a></li>
                    </ul></div>

            </div>

            <div class="panel-body col-sm-12" style="border:1px solid grey">
               <g:each in="${recentpost}" var="post">
                <div class="col-sm-2" style="margin: 25px 0px;border: 1px solid grey;"><span
                        class="glyphicon glyphicon-user " style="font-size:60px;"></span>
                </div>
                <span class=" col-sm-6 " style="font-size: 15px;padding:20px 15px;">${post.createdBy}</span>
                <span class=" col-sm-3 text-muted " style="padding:20px 0px;">@${post.createdBy.firstName}<g:formatDate date="${post.dateCreated}" type="time" style="SHORT"/> </span>

                <p class="text-muted col-sm-10">${post}</p>

                <div class=" col-sm-10">
                    <i class="fa fa-facebook "></i>
                    <i class="fa fa-google"></i>
                    <i class="fa fa-twitter"></i>

                    <ins><span class="text-info" style="padding:5px;">View post</span></ins>
                </div>
               </g:each>
            </div>

        </div></div>
   <ls:toptopics/>

</div>

<div class="col-sm-5 " style="padding-left:10px;">

    <div class="panel-default ">
        <div class="panel-heading " style="border: 1px solid grey; background:#f2f2f2; ">Login
        </div>

        <div class="panel-body " style="border:1px solid grey">

            <g:form class="form-inline" role="form" url="[action: 'loginHandler']">
                <div class="form-group">
                    <label class="control-label col-sm-5" for="Email">Email/UserName<sup>*</sup></label>
                    <input type="email" class="form-control col-sm-6" id="inputEmail" placeholder="Email"
                           name="username"
                           style="border: 1px solid grey;">
                    <br/><br/><br/><br/>


                    <label class="control-label col-sm-5" for="inputPassword">Password<sup>*</sup></label>
                    <input type="password" class="form-control col-sm-6" id="inputPassword" name="password"
                           placeholder="Password"
                           style="border: 1px solid grey;"><br/><br/><br/><br/>
                    <a href="#" data-toggle="modal"
                       data-target="#forgetpassword "><span class="col-sm-8 text-info">Forgot Password</span></a>
                    <g:submitButton name="Login" class="btn col-sm-4" value="Login" style="border:1px solid grey"/>
                </div>
            </g:form>
            <g:render template="/login/forgetPassword"></g:render>
        </div></div><br/><br/><br/><br/>


    <div class="panel-default ">
        <div class="panel-heading " style="border: 1px solid grey; background:#f2f2f2; ">Login
        </div>

        <div class="panel-body " style="border:1px solid grey">
            <span class="col-sm-12"></span>

            <g:uploadForm class="form-inline cmxform" role="form" url="/user/register" method="post" name="myregisterform">
                <div class="form-group col-sm-12">
                    <fieldset>
                        <label class="control-label col-sm-5" for="Fname">First Name<sup>*</sup></label>
                        <input type="text" name="fname" class="form-control col-sm-5 "
                               style="border:1px solid grey" required><br/><br/><br/><br/>



                        <label class="control-label col-sm-5" for="Lname">Last Name<sup>*</sup></label>
                        <input type="text" name="lname" class="form-control col-sm-6"
                               style="border:1px solid grey"required><br/><br/><br/><br/>
                        <label class="control-label col-sm-5" for="Email">Email<sup>*</sup></label>
                        <input type="email" name="email" class="form-control col-sm-6  "
                               style="border:1px solid grey" required><br/><br/><br/><br/>



                        <label class="control-label col-sm-5" for="uname">Username<sup>*</sup></label>
                        <input type="text" name="uname" class="form-control col-sm-6"
                               style="border:1px solid grey" required><br/><br/><br/><br/>
                        <label class="control-label col-sm-5"  for="pass">Password<sup>*</sup></label>
                        <input type="password" id="passwrd" name="passwrd" class="form-control col-sm-6 "
                               minlength="5" style="border:1px solid grey" required><br/><br/><br/><br/>



                        <label class="control-label col-sm-5" for="CPassword">Confirm Password<sup>*</sup></label>
                        <input type="password" name="CnfrmPsswrd" id=" CnfrmPsswrd" class="form-control col-sm-6"
                               style="border:1px solid grey"
                               style="border:1px solid grey" required><br/><br/><br/><br/>

                        <label class="control-label col-sm-5 text-info" for="photo">Photo</label><span class="col-sm-2 "
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


                        <span class="col-sm-8 text-info"></span>  <input type="submit" value="Validate!">
                    </fieldset>
                </div>
            </g:uploadForm></div></div>
    <script>
        // just for the demos, avoids form submit
        jQuery.validator.setDefaults({
            debug: true,
            success: "valid"
        });
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



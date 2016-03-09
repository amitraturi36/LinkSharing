<!doctype html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8">
    <title>Document</title>
</head>

<body>
<!------------ box1 -->


<div class="col-sm-7  ">

    <div z>
        <div class="panel-default ">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;"><div
                    class="col-sm-8">Recent Shares</div>

                <div class="col-sm-4"><a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                    Today
                    <span class="caret"></span>
                </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Week</a></li>
                        <li><a href="#">Month</a></li>
                        <li><a href="#">Year</a></li>
                    </ul></div>

            </div>

            <div class="panel-body col-sm-12" style="border:1px solid grey">

                <div class="col-sm-2" style="margin: 25px 0px;border: 1px solid grey;"><span
                        class="glyphicon glyphicon-user " style="font-size:60px;"></span>
                </div>
                <span class=" col-sm-6 " style="font-size: 15px;padding:20px 15px;">Uday paratap singh</span>
                <span class=" col-sm-3 text-muted " style="padding:20px 0px;">@Uday 5min</span>

                <p class="text-muted col-sm-10">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                <div class=" col-sm-10">
                    <i class="fa fa-facebook "></i>
                    <i class="fa fa-google"></i>
                    <i class="fa fa-twitter"></i>

                    <ins><span class="text-info" style="padding:5px;">View post</span></ins>
                </div>


                <!-- box 1 part 2-->

                <div class="col-sm-2" style="margin: 25px 0px;border: 1px solid grey;"><span
                        class="glyphicon glyphicon-user " style="font-size:60px;"></span>
                </div>
                <span class=" col-sm-6 " style="font-size: 15px;padding:20px 15px;">Uday paratap singh</span>

                <div class=" col-sm-3">
                    <span class=" col-sm-6 text-muted " style="padding:20px 0px;">@Uday</span><span
                        class=" col-sm-6 text-info" style="padding:20px 23px;">Grails</span>

                </div>

                <p class="text-muted col-sm-10">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                <div class=" col-sm-10">
                    <i class="fa fa-facebook"></i>
                    <i class="fa fa-google"></i>
                    <i class="fa fa-twitter"></i>
                    <ins><span class="text-info" style="padding:5px;">View post</span></ins>
                </div>
            </div>

        </div></div>
    <g:render template="/topic/toppost"/>



</div>

<div class="col-sm-4 " style="padding:10px;">

    <div class="panel-default ">
        <div class="panel-heading " style="border: 1px solid grey; background:#f2f2f2; ">Login
        </div>

        <div class="panel-body " style="border:1px solid grey">

            <g:form class="form-inline" role="form" url="[action:'loginHandler']">
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

            <form class="form-inline" role="form">
                <div class="form-group col-sm-12" style="margin:5px">
                    <label class="control-label col-sm-5" for="Fname">First Name<sup>*</sup></label>
                    <input type="text" class="form-control col-sm-6  "
                           style="border:1px solid grey"><br/><br/><br/><br/>



                    <label class="control-label col-sm-5" for="Lname">Last Name<sup>*</sup></label>
                    <input type="text" class="form-control col-sm-6" style="border:1px solid grey"><br/><br/><br/><br/>
                    <label class="control-label col-sm-5" for="Email">Email<sup>*</sup></label>
                    <input type="email" class="form-control col-sm-6  "
                           style="border:1px solid grey"><br/><br/><br/><br/>



                    <label class="control-label col-sm-5" for="uname">Username<sup>*</sup></label>
                    <input type="text" class="form-control col-sm-6" style="border:1px solid grey"><br/><br/><br/><br/>
                    <label class="control-label col-sm-5" for="pass">Password<sup>*</sup></label>
                    <input type="password" class="form-control col-sm-6 "
                           style="border:1px solid grey"><br/><br/><br/><br/>



                    <label class="control-label col-sm-5" for="CPassword">Confirm Password<sup>*</sup></label>
                    <input type="password" class="form-control col-sm-6" style="border:1px solid grey"
                           style="border:1px solid grey"><br/><br/><br/><br/>

                    <label class="control-label col-sm-5 text-info" for="photo">Photo</label><span class="col-sm-2 "
                                                                                                   style="width:85px;height:20px;border:1px solid grey;"></span>

                    <div class="form-group">
                        <div>
                            <label for="files"><span class="btn"
                                                     Style="border:1px solid grey;padding:0px 30px">Browse</span>
                            </label>
                            <input style="visibility: hidden; position: absolute;" id="files" class="form-control"
                                   type="file" name="files">

                        </div>

                    </div><br/><br/>


                    <span class="col-sm-8 text-info"></span>  <button type="file" class="btn col-sm-4"
                                                                      style="border:1px solid grey">Register</button>

                </div>
            </form></div></div>

</div>

</body>
</html>



<div >
    <div class="logmod__wrapper">
        <div class="logmod__container">
            <ul class="logmod__tabs">
                <li data-tabtar="lgm-2"><a href="#">Login</a></li>
                <li data-tabtar="lgm-1"><a href="#">Sign Up</a></li>
            </ul>

            <div class="logmod__tab-wrapper">
                <div class="logmod__tab lgm-1">
                    <div class="logmod__heading">

                        <span class="logmod__heading-subtitle">

                            Enter your personal details <strong>to create an acount</strong>

                        </span>
                    </div>

                    <div class="logmod__form">
                        <g:uploadForm class=" simform" role="form" url="/user/register" method="post"
                                      name="myregisterform">
                            <div class="form-group ">
                                <fieldset>
                                    <div class="sminputs">
                                        <input type="text" name="fname" id="regfirstname" class="registartionformcommon"
                                               placeholder="First Name*" required>
                                    </div>

                                    <div class="sminputs">

                                        <input type="text" name="lname" id="reglastname" class="registartionformcommon"
                                               placeholder="Last Name*" required>
                                    </div>

                                    <div class="sminputs">
                                        <input type="email" name="email" id="form2Email" class="registartionformcommon"
                                               placeholder="Email*" required>
                                    </div>

                                    <div class="sminputs">
                                        <span id="loginform2email"></span></div>

                                    <div class="sminputs">
                                        <input type="text" name="uname" id="form2Username"
                                               class="registartionformcommon"
                                               id="form2Username" placeholder="User Name*" required>
                                    </div>

                                    <div class="sminputs">
                                        <span id="loginform2username"></span>
                                    </div>

                                    <div class="sminputs">
                                        <input type="password" id="passwrd" name="passwrd"
                                               class="registartionformcommon "
                                               minlength="5" placeholder="Password*" required>

                                    </div>

                                    <div class="sminputs">
                                        <input type="password" name="CnfrmPsswrd" id=" CnfrmPsswrd"
                                               class="registartionformcommon " placeholder="Confirm Password*" required>
                                    </div>
                                     <div>
                                    <input id="files"
                                           class="form-control btn-info  col-sm-12" type="file" name="photo" accept="image/*" style="margin: 0%;cursor: pointer;    border-radius: 0px;"
                                           required>
                                    <button type="reset" class="btn btn-danger form-control col-sm-12" style="margin-top:-5px;border-radius: 0px;" id="resetregistrationform">Reset</button>

                                    <g:submitButton name="submit" class="form-control btn-success col-sm-12"
                                                    type="submit" value="Register" style="margin-top: 5px;border-radius: 0px;"/>
                                     </div>
                                </fieldset>
                            </div>
                        </g:uploadForm>
                    </div>

                    <div class="logmod__alter" style="margin:0px">
                        <div class="logmod__alter-container">
                            <a href="#" class="connect facebook">
                                <div class="connect__icon">
                                    <i class="fa fa-facebook"></i>
                                </div>

                                <div class="connect__context">
                                    <span onclick="facebook()">Create an account with <strong>Facebook</strong></span>
                                </div>
                            </a>

                            <a href="#" class="connect googleplus">
                                <div class="connect__icon">
                                    <i class="fa fa-google-plus"></i>
                                </div>

                                <div class="connect__context">
                                    <span>Create an account with <strong>Google+</strong></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="logmod__tab lgm-2">
                    <div class="logmod__heading">
                        <span class="logmod__heading-subtitle">Enter your email and password <strong>to sign in</strong>
                        </span>
                    </div>

                    <div class="logmod__form">
                        <g:form class="simform" role="form" url="${postUrl}">
                            <div class="sminputs">
                                <div>

                                    <input name="j_username" class="string optional" maxlength="255" id="user-email"
                                           placeholder="UserName"
                                           type="text" size="50"/>
                                </div>
                            </div>

                            <div class="sminputs">
                                <div>
                                    <input name="j_password" class="string optional" maxlength="255" id="user-pw"
                                           placeholder="Password"
                                           type="password" size="50"/>

                                </div>

                            </div>

                            <div class="simform__actions">
                                <span><a class="special col-sm-4" href="#" data-toggle="modal"
                                         data-target="#forgetpassword " style="margin-top:3% ">Forgot password</a>
                                    <g:submitButton class="sumbit col-sm-4" name="submit" value="Log In"/>
                                </span>

                            </div>
                        </g:form>
                    </div>

                    <div class="logmod__alter">
                        <div class="logmod__alter-container">
                            <a  class="connect facebook"  style="cursor: pointer" onclick="facebook()">
                                <div class="connect__icon">
                                    <i class="fa fa-facebook"></i>
                                </div>

                                <div class="connect__context">
                                    <span >Sign in with <strong>Facebook</strong></span>
                                </div>
                            </a>
                            <a href="#" class="connect googleplus">
                                <div class="connect__icon">
                                    <i class="fa fa-google-plus"></i>
                                </div>

                                <div class="connect__context">
                                    <span>Sign in with <strong>Google+</strong></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




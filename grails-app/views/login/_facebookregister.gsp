%{--<g:uploadForm url="/facebook/login">--}%
    %{--<input class="form-control" name="fname" value="${user.first_name}" disabled/>--}%
    %{--<input class="form-control" name="lname" value="${user.last_name}" disabled/>--}%
    %{--<input class="form-control" name="email" value="${user.email}" disabled/>--}%
    %{--<input class="form-control" name="password" placeholder="Password"/>--}%
    %{--<input class="form-control" name="confrmpassword" placeholder="confirm Password"/>--}%
    %{--<input class="form-control" name="uname" placeholder="username"/>--}%
    %{--<input class="form-control" type="file" name="photo" style="visibility: hidden"/>--}%
    %{--<button type="submit" class="alert-success">Create Account</button>--}%

%{--</g:uploadForm>--}%



<div class=" panel panel-default" id="loginbody">
    <div class=" h3" style="margin-left: 32%;
    padding-top: 5%;">Please fill your Password And Username in the given form</div>

    <div class="panel-body ">
        <span class="col-sm-12"></span>

        <g:uploadForm class="form-inline cmxform" role="form" url="/facebook/login" method="post"
                      name="myregisterform">
            <div class="form-group col-sm-12">
                <input  id="files"  type="text" name="photo"   style="visibility: hidden">
                <fieldset>
                    <input type="text" name="fname"
                           style="visibility: hidden" value="${user.first_name}">
                    <input type="text" name="lname"
                           style=" visibility: hidden" value="${user.last_name}">
                    <input type="email" name="email" value="${user.email}"
                           style="visibility: hidden">
                    <br/>
                    <label class="control-label col-sm-4 h4" for="form2Username"><span class="h4 " style="color: #040404">Username<sup>*</sup></span></label>
                    <input type="text" name="uname" id="form2Username" class="form-control col-sm-6"
                           style="border:1px solid grey;width: 45%;" id="form2Username" required><br/>
                    <div class="col-sm-12">
                        <span id="loginform2username"></span></div>
                    <br/><br/><br/>
                    <label class="control-label col-sm-4 h4" for="passwrd"><span class="h4 " style="color: #040404">Password<sup>*</sup></span></label>
                    <input type="password" id="passwrd" name="passwrd" class="form-control col-sm-6 "
                           minlength="5" style="border:1px solid grey;width: 45%;" required><br/><br/><br/><br/>



                    <label class="control-label col-sm-4 h4 " for="CnfrmPsswrd"><span class="h4 " style="color: #040404">Confirm Password<sup>*</sup></span></label>
                    <input type="password" name="CnfrmPsswrd" id=" CnfrmPsswrd" class="form-control col-sm-6"
                           style="border:1px solid grey;width: 45%;" required><br/><br/><br/><br/>
                    <div class="col-sm-3"></div>
                    <div class="col-sm-4">

                    <button type="reset" name="reset" class="btn btn-danger form-control" style="margin-right: 25%;
                    width: 50%;"
                    >Reset</button>
                    </div>
                    <div class="col-sm-4">
                        <g:submitButton name="submit" class="btn btn-success form-control"
                                        type="submit"  value="Create Account" style="margin-right: 41%;
    width: 50%;" />
                        <br><br>
                    </div>

                       <br><br>

                </fieldset>
            </div>
        </g:uploadForm></div></div>
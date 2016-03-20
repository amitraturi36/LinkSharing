<div id="registerationform2" class="modal fade" role="dialog">
 <div   class="modal-dialog">
      <div class="modal-content">
    <div class="modal-header alert-success" style="border: 1px solid grey;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3>Register</h3>
    </div>
<div class="modal-body container col-sm-12 " style="background-color: whitesmoke">


        <g:uploadForm class="form-inline cmxform" role="form" url="/user/register" method="post"
                      name="myregisterform">
            <div class="form-group col-sm-12">
                <fieldset>
                    <b>
                    <label class="control-label col-sm-6 " for="regfirstname"><span class="h3 " style="color: #040404">First Name<sup>*</sup></span></label>
                    <input type="text" name="fname" id="regfirstname" class="form-control col-sm-5 "
                           style="border:1px solid grey" required><br/><br/><br/><br/>

                    <label class="control-label  col-sm-6" for="reglastname"><span class="h3 " style="color: #040404">Last Name<sup>*</sup></span></label>
                    <input type="text" name="lname" id="reglastname" class="form-control col-sm-6"
                           style="border:1px solid grey" required><br/><br/><br/><br/>
                    <label class="control-label col-sm-6 h4" for="form2Email"><span class="h3 " style="color: #040404">Email<sup>*</sup></span></label>
                    <input type="email" name="email" id="form2Email" class="form-control col-sm-6   "
                           style="border:1px solid grey" required>
                    <br/>
                    <div class="col-sm-12">
                        <span id="loginform2email"></span></div>
                    <br/><br/><br/><br/>



                    <label class="control-label col-sm-6 h4" for="form2Username"><span class="h3 " style="color: #040404">Username<sup>*</sup></span></label>
                    <input type="text" name="uname" id="form2Username" class="form-control col-sm-6"
                           style="border:1px solid grey" id="form2Username" required><br/>
                    <div class="col-sm-12">
                        <span id="loginform2username"></span></div>
                    <br/><br/><br/>
                    <label class="control-label col-sm-6 h4" for="passwrd"><span class="h3 " style="color: #040404">Password<sup>*</sup></span></label>
                    <input type="password" id="passwrd" name="passwrd" class="form-control col-sm-6 "
                           minlength="5" style="border:1px solid grey" required><br/><br/><br/><br/>



                    <label class="control-label col-sm-6 h4 " for="CnfrmPsswrd"><span class="h3 " style="color: #040404">Confirm Password<sup>*</sup></span></label>
                    <input type="password" name="CnfrmPsswrd" id=" CnfrmPsswrd" class="form-control col-sm-6"
                           style="border:1px solid grey"
                           style="border:1px solid grey" required><br/><br/><br/><br/>

                    <label class="control-label col-sm-6 h3 text-info" for="files">Photo</label>
                    <input  id="files" style="width: 37%;cursor: pointer;margin-top: 2%" class="form-control btn-info" type="file" name="photo"   accept="image/*" required>
                    <br/><br/>
                    </b>

                    <span class="col-sm-6"></span>
                    <button type="reset" class="btn btn-danger form-control col-sm-2">Reset</button>
                    <span class="col-sm-1"></span>
                    <g:submitButton name="submit" class="form-control btn-success col-sm-2"
                                                                              type="submit" style=" margin-left:4% " value="Register"/>
                </fieldset>
            </div>
        </g:uploadForm></div>
        </div></div>
</div>
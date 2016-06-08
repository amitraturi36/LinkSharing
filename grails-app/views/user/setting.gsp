


<div style="
width: 123%; margin-left:-11.7%;" >
<div class=" panel panel-default col-sm-12" id="loginbody" style="">
   <div class=" h3" style="    margin-left: 50%;;padding-top: 2%">Update Info</div>

    <div class="panel-body " style="">
        <span class="col-sm-12"></span>

        <g:uploadForm class="form-inline cmxform" role="form" url="/user/update" method="post"
                      name="myregisterform">
            <div class="form-group col-sm-12">
                <fieldset>
                    <label class="control-label col-sm-6 h4" for="Fname">First Name<sup>*</sup></label>
                    <input type="text" name="fname" class="form-control col-sm-5 "
                           style="border:1px solid grey;width: 45%;" value="${user.firstName}" required><br/><br/><br/><br/>



                    <label class="control-label col-sm-6 h4" for="Lname">Last Name<sup>*</sup></label>
                    <input type="text" name="lname" class="form-control col-sm-6"
                           style="border:1px solid grey;width: 45%;" value="${user.lastName}" required><br/><br/><br/><br/>
                    <label class="control-label col-sm-6 h4" for="Email">Email<sup>*</sup></label>
                    <input type="email" name="email" value="${user.email}" class="form-control col-sm-6  "
                           style="border:1px solid grey;width: 45%;" disabled><br/><br/><br/><br/>

                    <label class="control-label col-sm-6 h4 " for="photo">Photo</label>
                    <input  id="files" style="width: 45%;" class="form-control btn-info" type="file" name="photo"   accept="image/*" required>
                    <br/><br/>

                    <div class="col-sm-3"></div>
                    <div class="col-sm-4">

                        <button type="reset" name="reset" class="btn btn-danger form-control" style="margin-right: -34%;
                        width: 60%;"
                        >Reset</button>
                    </div>
                    <div class="col-sm-4">
                        <g:submitButton name="submit" class="btn btn-success form-control"
                                        type="submit"  value="Update" style="    margin-right: -10%;
    width: 60%;" />
                        <br><br>
                    </div>

                </fieldset>
            </div>
        </g:uploadForm>
        <div class="col-sm-12"> <br/><br/><br></div>

        <div class="col-sm-12" ><h4><span data-toggle="modal" data-target="#changepassword" style="cursor: pointer;color: aliceblue;    margin-left: 1%;">Change Password</span></h4>

            <g:render template="changepassword"/>
        </div>
    </div>
    <div style="    margin-bottom: 10%;"></div>

</div>
</div>


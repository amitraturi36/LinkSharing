<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="panel-default col-sm-10">
    <div class="panel-heading " style="border: 1px solid grey; background:black;color: white"><h4>Update Info</h4>
    </div>

    <div class="panel-body " style="border:1px solid grey">
        <span class="col-sm-12"></span>

        <g:uploadForm class="form-inline cmxform" role="form" url="/user/update" method="post"
                      name="myregisterform">
            <div class="form-group col-sm-12">
                <fieldset>
                    <label class="control-label col-sm-6 h4" for="Fname">First Name<sup>*</sup></label>
                    <input type="text" name="fname" class="form-control col-sm-5 "
                           style="border:1px solid grey" value="${user.firstName}" required><br/><br/><br/><br/>



                    <label class="control-label col-sm-6 h4" for="Lname">Last Name<sup>*</sup></label>
                    <input type="text" name="lname" class="form-control col-sm-6"
                           style="border:1px solid grey" value="${user.lastName}" required><br/><br/><br/><br/>
                    <label class="control-label col-sm-6 h4" for="Email">Email<sup>*</sup></label>
                    <input type="email" name="email" value="${user.email}" class="form-control col-sm-6  "
                           style="border:1px solid grey" disabled><br/><br/><br/><br/>

                    <label class="control-label col-sm-6 h4 text-info" for="photo">Photo</label><span class="col-sm-2 "
                                                                                                      style="width:85px;height:20px;border:1px solid grey;"></span>

                    <div class="form-group">
                        <div>
                            <label for="files"><span class="btn "
                                                     Style="border:1px solid grey;padding:0px 30px">Browse</span>
                            </label>
                            <input style="visibility: hidden; position: absolute;" id="files" class="form-control"
                                   type="file" name="photo">


                        </div>

                    </div><br/><br/>

                    <span class="col-sm-8 text-info"></span>  <g:submitButton name="submit" class="btn btn-success form-control"
                                                                              type="submit"  value="Update"/>
                <button type="reset" name="reset" class="btn btn-danger form-control"
                                >Reset</button>

                </fieldset>
            </div>
        </g:uploadForm></div></div>
<div class="col-sm-12" ><h4><span data-toggle="modal" data-target="#changepassword" style="cursor: pointer">Change Password</span></h4>

    <g:render template="changepassword"/>
</div>

</body>
</html>
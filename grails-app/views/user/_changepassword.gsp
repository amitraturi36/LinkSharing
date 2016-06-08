 <div id="changepassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content col-sm-12">
                <div class="modal-header  " style="background-color:purple;margin-left:-15px;    width: 105.3%;    margin-bottom: 5%;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <div class="modal-title  h4 " style="color: white">Change Password</div>
                </div>

                <div class="modal-body">
                <form class="form-horizontal" method="post" id="changepswwrd" action="/forgotpassword/changePassword">
                    <div class="form-group">
                        <label class="col-xs-4">Password</label>

                        <div class="col-xs-8">
                            <input type="password"class="form-control"  name="passwrd"  minlength="5"  id="passwrd" style="    width: 95%;" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4">Confirm Password</label>

                        <div class="col-xs-8">
                            <input type="password" class="form-control"  name="CnfrmPsswrd"  id="CnfrmPsswrd" style="    width: 95%;" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row col-sm-12" style="margin-bottom: 20px">

                            <button type="submit" class="btn btn-success  col-sm-4" style="margin-left: 3%;">Update</button>
                            <button type="reset" class="btn btn-warning col-sm-4" style="margin-left: 29%;">Reset</button>
                        </div>
                    </div>
                </form></div>
        </div>

    </div>
</div>
<script>
    // just for the demos, avoids form submit

    $("#changepswwrd").validate({
        rules: {
            passwrd: "required",
            CnfrmPsswrd: {
                equalTo: "#passwrd"
            }
        }
    });

</script>
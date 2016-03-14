<div id="changepassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->

        <div class="panel panel-default">
            <div class="panel-heading"><strong>Change Password</strong></div>

            <div class="panel-body">
                <form class="form-horizontal" method="post" id="changepswwrd" action="/forgotpassword/changePassword">
                    <div class="form-group">
                        <label class="col-xs-4">Password</label>

                        <div class="col-xs-8">
                            <input type="password"class="form-control"  name="passwrd"  minlength="5"  id="passwrd" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4">Confirm Password</label>

                        <div class="col-xs-8">
                            <input type="password" class="form-control"  name="CnfrmPsswrd"  id="CnfrmPsswrd" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-10">
                            <button type="submit" class="btn btn-primary">Update</button>
                            <button type="button" class="btn btn-primary"
                                    data-dismiss="modal">Close</button>
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
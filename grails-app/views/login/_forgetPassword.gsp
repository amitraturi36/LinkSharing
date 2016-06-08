<div id="forgetpassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header " style="border: 1px solid grey;background-color: purple">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Forget Password</h4>
            </div>

            <g:form name="forgetpassform" class="inline-form" method="post"  onsubmit="return passwordchange()">
                <div class="modal-body" style="border: 1px solid grey;background:inherit; ">
                         <div id="forgetpasswordmessage" ></div>
                    <span class=" col-sm-4 h3">Email<sup>*</sup></span>
                    <input type="email" class=" form-control col-sm-6" style="width: 50%;margin-top:4% " id="forgetPass" name="email" required><br/><br/>
                    <span style="margin:20px"></span>


                <div class="row col-sm-12">
                    <g:submitButton name="submitemail" value="Send Email" class="btn btn-success col-sm-4"/>
                    <span class="col-sm-4"></span>
                    <button type="reset" class="btn btn-danger col-sm-4" >Reset</button>
                </div>
                    <br/><br/><br/>
                </div>
            </g:form>
        </div>

    </div>
</div>
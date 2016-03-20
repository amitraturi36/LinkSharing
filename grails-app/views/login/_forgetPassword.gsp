<div id="forgetpassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header alert-success" style="border: 1px solid grey;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Forget Password</h4>
            </div>

            <g:form name="forgetpassform" class="inline-form" method="post" url="[controller: 'topic', action: 'save']" onsubmit="return passwordchange()">
                <div class="modal-body" style="border: 1px solid grey;background:inherit; ">
                         <div id="forgetpasswordmessage" ></div>
                    <span class=" col-sm-4 h3">Email<sup>*</sup></span>
                    <input type="email" class=" form-control col-sm-6" style="width: 50%;margin-top:4% " id="forgetPass" name="email" required><br/><br/>
                    <span style="margin:20px"></span>
                </div>

                <div class="modal-footer">
                    <g:submitButton name="submitemail" value="Send Email" class="btn btn-success"/>
                    <button type="reset" class="btn btn-danger" >Reset</button>
                </div>
            </g:form>
        </div>

    </div>
</div>
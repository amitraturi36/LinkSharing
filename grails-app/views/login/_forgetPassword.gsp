<div id="forgetpassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Forget Password</h4>
            </div>

            <g:form name="forgetpassform" class="inline-form" method="post" url="[controller: 'topic', action: 'save']" onsubmit="return passwordchange()">
                <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">

                    <span class=" col-sm-4">Email<sup>*</sup></span>
                    <input type="email" class=" col-sm-6" name="email" required><br/><br/>
                    <span style="margin:20px"></span>
                </div>

                <div class="modal-footer">
                    <g:submitButton name="submitemail" value="Send Email" class="btn btn-default"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </g:form>
        </div>

    </div>
</div>
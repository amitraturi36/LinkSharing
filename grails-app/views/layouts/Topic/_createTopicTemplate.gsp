<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topics</h4>
            </div>

            <g:form class="inline-form" method="post" url="[controller:'topic',action:'save']">
                <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">

                    <span class=" col-sm-4">Name<sup>*</sup></span>
                    <input type="Text" class=" col-sm-6" required><br/><br/>
                    <span class=" col-sm-4">Visiblity<sup>*</sup></span>
                    <select class=" col-sm-5" style="background:white">
                        <option>Public</option>
                        <option>Private</option>
                    </select>

                    <span style="margin:20px"></span>
                </div>

                <div class="modal-footer">
                    <g:submitButton name="save" value="Save" class="btn btn-default"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </g:form>
        </div>

    </div>
</div>
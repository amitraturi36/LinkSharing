<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header alert-success" style="border: 1px solid grey;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topics</h4>
            </div>


                <div class="modal-body" style="borer: 1px solid grey; ">
                    <g:form class="inline-form" method="post" url="[controller: 'topic', action: 'save']">
                    <span class=" col-sm-4">Name<sup>*</sup></span>
                    <input type="Text" class=" form-control" style="width: 50%" name="topicName" required><br/><br/>
                    <span class=" col-sm-4">Visiblity<sup>*</sup></span>
                    <select class=" col-sm-5 form-control" style="background:white;width: 50%" name="visiblity">
                        <option value="Public">Public</option>
                        <option value="Private">Private</option>
                    </select>

                    <span style="margin:20px"></span>

                     <br/><br/><br/>
            <span style="float: right">
                <g:submitButton name="edit" class="btn btn-success" value="Share"/>
                <button type="reset" class="btn btn-warning">Reset</button>
                </span>
                <div class="col-sm-12">
                    <br/><br/><br/> <br/><br/><br/>

                </div> <br/><br/><br/>
            </g:form>
    </div>
        </div>

    </div>
</div>
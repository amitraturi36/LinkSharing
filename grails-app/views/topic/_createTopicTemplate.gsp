<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content col-sm-12">
            <div class="modal-header " style=" background-color: purple;margin-left: -15px;margin-right: -15px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topics</h4>

            </div>


            <div class="modal-body col-lg-12 col-sm-12" style="borer: 1px solid grey; ">
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
                    <span class="col-sm-12 col-lg-12">
                        <input type="submit" id="edit" name="edit"  class="btn btn-success col-sm-4 col-lg-4" value="Share" style="margin-left: -5px"/>
                        <button type="reset" class="btn btn-warning col-sm-4 col-lg-4" style="margin-left:100px;">Reset</button>
                    </span>


                </g:form>
            </div>
        </div>

    </div>
</div>


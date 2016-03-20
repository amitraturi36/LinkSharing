<div id="myedittopic${topic.id}" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header alert-success" style="border: 1px solid grey; background:#f2f2f2;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Topics</h4>
            </div>

            <g:form class="inline-form" url="/topic/update?topicId=${topic.id}">
                <div class="modal-body" style="borer: 1px solid grey; ">

                    <span class=" col-sm-4">Name<sup>*</sup></span>
                    <input type="Text" class=" col-sm-6" name="name" placeholder="${topic.topicName}" required><br/><br/>
                    <span style="margin:20px"></span>
                </div>

                <br/><br/><br/>
                <span style="float: right">
                    <g:submitButton name="save" class="btn btn-success" value="Share"/>
                    <button type="reset" class="btn btn-warning">Reset</button>
                </span>
                <div class="col-sm-12">
                    <br/><br/><br/> <br/><br/><br/>

                </div> <br/><br/><br/>
            </g:form>
        </div>

    </div>
</div>
<div id="createDoc" class="modal fade" role="dialog">
    <div class="modal-dialog">

    <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header alert-success" style="border: 1px solid grey; background:#f2f2f2;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Document</h4>
                </div>

                <div class="modal-body" style="borer: 1px solid grey; ">
        <g:uploadForm name="myform" class="inline-form" url="/documentResource/saveDocument">
                    <span class=" col-sm-4">Document<sup>*</sup></span>
                    <input type="file" class="form-control text-info" style="width: 50%" name="doc"><br/><br/>

                    <span class=" col-sm-4">Description<sup>*</sup></span>
                    <textarea rows="4" cols="50" class="form-control" style="width: 50%"name="description"></textarea><br/><br/>

                    <span class=" col-sm-4" style="margin:10px 0px">Topics<sup>*</sup></span>
                    <g:if test="${subtopics}">
                        <select class="form-control col-sm-5" style="background:white;width:50%" name="topicId">
                            <g:each in="${subtopics}">
                                <option value="${it.id}">${it}</option>
                            </g:each>
                        </select>
                    </g:if>
                    <g:if test="${topic}">

                        <select class="form-control col-sm-5" style="background:white;width:50%" name="topicId">

                            <option value="${topic.id}">${topic.topicName}</option>

                        </select>

                    </g:if>

                </div>
                <br/><br/><br/>
            <span style="float: right">
                <g:submitButton name="linkresource" class="btn btn-success" value="Share"/>
                <button type="reset" class="btn btn-warning">Reset</button>
            </span>
            <div class="col-sm-12">
                <br/><br/><br/> <br/><br/><br/>

            </div> <br/><br/><br/>
        </g:uploadForm>

            </div>


    </div>
</div>

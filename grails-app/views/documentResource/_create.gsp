
   <div id="createDoc" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content col-sm-12">
            <div class="modal-header " style=" background-color: purple;margin-left: -15px;margin-right: -15px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Documents</h4>

            </div>


            <div class="modal-body col-lg-12 col-sm-12" style="borer: 1px solid grey; ">
        <span id="docspan"> </span><br/>
        <g:uploadForm name="mydocform" class="inline-form" onSubmit="return docresource()">
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
            <div class="row col-sm-12" style="margin-bottom: 20px">

                <button type="submit" class="btn btn-success  col-sm-4" style="margin-left: 3%;">Share</button>
                <button type="reset" class="btn btn-warning col-sm-4" style="margin-left: 19%;">Reset</button>
            </div>


        </g:uploadForm>

            </div>


    </div>
</div>


  <div id="createlinkresc" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content col-sm-12">
            <div class="modal-header " style=" background-color: purple;margin-left: -15px;margin-right: -15px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Link</h4>

            </div>


            <div class="modal-body col-lg-12 col-sm-12" style="borer: 1px solid grey; ">
                    <span id="linkspan"> </span><br/>
                    <form class="inline-form"   id="linkresourceform" onSubmit="return linkresource() " >
                    <span class=" col-sm-4">Link<sup>*</sup></span>
                    <input type="Text" class=" form-control" style="width: 50%" name="url"><br/>
                        <br/>

                    <span class=" col-sm-4" >Description<sup>*</sup></span>
                    <textarea rows="4" cols="50" class=" form-control" style="width: 50%" name="description"></textarea><br/><br/>

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


                        <span class="col-sm-12 col-lg-12">
                            <input type="submit" id="edit" name="edit"  class="btn btn-success col-sm-4 col-lg-4" value="Share" style="margin-left: -5px"/>
                            <button type="reset" class="btn btn-warning col-sm-4 col-lg-4" style="margin-left:100px;">Reset</button>
                        </span>


        </form>

    </div>
    </div>

    </div>
</div>

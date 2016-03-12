<%@ page import="com.intelligrape.linksharing.ResourceController" %>
<div id="createlink" class="modal fade" role="dialog">
    <div class="modal-dialog">

    <!-- Modal content-->
        <g:form class="inline-form" url="/resource/saveLinkResources">
            <div class="modal-content">
                <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Link</h4>
                </div>

                <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">

                    <span class=" col-sm-4">Link<sup>*</sup></span>
                    <input type="Text" class=" col-sm-6" name="url"><br/><br/>

                    <span class=" col-sm-4" >Description<sup>*</sup></span>
                    <textarea rows="4" cols="50" class=" col-sm-6"name="description"></textarea><br/><br/>

                    <span class=" col-sm-4" style="margin:10px 0px">Topics<sup>*</sup></span>
                    <select class=" col-sm-5" style="background:white;margin:10px 0px" name="topicId" value="Select Topics">
            <g:each in="${subtopics}">
                <option value="${it.id}">${it}</option>
            </g:each>
            </select>

            <br/><br/><br/>
            </div>

            <div class="modal-footer">
                <g:submitButton name="linkresource" class="btn btn-default" value="Share"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </g:form>
    </div>

    </div>
</div>

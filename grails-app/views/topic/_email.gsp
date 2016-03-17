<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
                <div class="modal-header alert-success" style="border: 1px solid grey;">
                   <button type="button" class="close" data-dismiss="modal" >&times;</button>

                    <div class="modal-title  h4 ">Send Invitations</div>
                </div>

                <div class="modal-body">
                    <g:form class="inline-form" style="padding-bottom:15%" name="invitationform"
                            onsubmit="return sendinvitation()">
                         <div>
                        <span class=" col-sm-4 h4">Email<sup>*</sup></span>
                        <input type="Text" class=" form-control col-sm-4" name="email" style="width:50%; "><br/><br/>
                        <span class=" col-sm-4 h4">Topics<sup>*</sup></span>
                        <g:if test="${topic}">

                            <select class="form-control col-sm-5" style="background:white;width:50%" name="topicId">

                                <option value="${topic.id}">${topic.topicName}</option>

                            </select>

                        </g:if>
                        <g:if test="${subtopics}">
                        <select class="form-control col-sm-5" style="background:white;width:50%" name="topicId">
                            <g:each in="${subtopics}">
                                <option value="${it.id}">${it}</option>
                            </g:each>
                        </select>
                        </g:if>


                       <div class="col-sm-12"></div>
                        <div class="row col-sm-12">
                            <span class="col-sm-7"></span>
                <button type="submit" class="btn btn-success  col-sm-2 ">Invite</button>
                            <span class="col-sm-1"></span>
                <button type="reset" class="btn btn-warning col-sm-2">Reset</button>
                        </div>
            </g:form>
        </div>

    </div>
        </div></div></div>

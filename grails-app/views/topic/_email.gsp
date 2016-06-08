<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content col-sm-12">
                <div class="modal-header  " style="background-color:purple;margin-left:-15px;    width: 105.3%;    margin-bottom: 5%;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <div class="modal-title  h4 " style="color: white">Send Invitations</div>
                </div>

                <div class="modal-body">
                    <g:form class="inline-form" style="padding-bottom:15%" name="invitationform"
                            onsubmit="return sendinvitation()">
                         <div class="col-sm-12">
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

                        <div class="row col-sm-12" style="margin-bottom: 20px">
                            
                <button type="submit" class="btn btn-success  col-sm-4" style="margin-left: 3%;">Invite</button>
                <button type="reset" class="btn btn-warning col-sm-4" style="margin-left: 19%;">Reset</button>
                        </div>

                         </div>

            </g:form>



    </div>
        </div></div></div>


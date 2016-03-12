<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <g:form class="inline-form" style="padding-bottom:20px"  name="invitationform" onsubmit="return sendinvitation()">

            <div class="modal-content">
                <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Send Invitations</h4>
                </div>


                <div class="modal-body" style="borer: 1px solid grey;background:transparent; ">

                    <span class=" col-sm-4">Email<sup>*</sup></span>
                    <input type="Text" class=" col-sm-6" name="email"><br/><br/>
                    <span class=" col-sm-4">Topics<sup>*</sup></span>
                    <select class=" col-sm-5" style="background:white" name="topicId">
                        <g:each in="${subtopics}">
                            <option value="${it.id}">${it}</option>
                        </g:each>
                    </select>

                </div>

                <div class=" col-sm-12"></div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Invite</button>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">Close</button>
                </div>
            </div>
        </g:form>

    </div>
</div>
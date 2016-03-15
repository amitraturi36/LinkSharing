<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
                <div class="modal-header" style="border: 1px solid grey; background-color:black;color: white">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <div class="modal-title  h4 ">Send Invitations</div>
                </div>
        <g:form class="inline-form" style="padding-bottom:15%" name="invitationform"
                onsubmit="return sendinvitation()">
                <div class="modal-body">
                         <div>
                        <span class=" col-sm-4 h4">Email<sup>*</sup></span>
                        <input type="Text" class=" form-control col-sm-4" name="email" style="width:50%; "><br/><br/>
                        <span class=" col-sm-4 h4">Topics<sup>*</sup></span>
                        <select class="form-control col-sm-5" style="background:white;width:50%" name="topicId">
                            <g:each in="${subtopics}">
                                <option value="${it.id}">${it}</option>
                            </g:each>
                        </select>
            <div class="modal-footer col-sm-12" style="background-color:#040404;margin-top:5px;  ">
                <button type="submit" class="btn btn-default">Invite</button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
            </div>
            </g:form>
        </div>

    </div>

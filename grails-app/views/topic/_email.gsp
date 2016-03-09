<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send Invitations</h4>
            </div>


        <div class="modal-body" style="borer: 1px solid grey;background:transparent; ">
            <form class="inline-form" style="padding-bottom:20px">
                    <span class=" col-sm-4">Email<sup>*</sup></span>
                    <input type="Text" class=" col-sm-6"><br/><br/>
                    <span class=" col-sm-4">Topics<sup>*</sup></span>
                    <select class=" col-sm-5" style="background:white">
                        <g:each in="${subtopics}">
                            <option>${it}</option>
                        </g:each>
                    </select>
        </form>

            </div>
        <div  class=" col-sm-12"></div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default">Invite</button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
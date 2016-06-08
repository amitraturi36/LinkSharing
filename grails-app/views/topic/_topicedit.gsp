 <div id="myedittopic${topic.id}" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content col-sm-12">
                <div class="modal-header  " style="background-color:purple;margin-left:-15px;    width: 105.3%;    margin-bottom: 5%;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <div class="modal-title  h4 " style="color: white">Send Invitations</div>
                </div>

                <div class="modal-body">

            <g:form class="inline-form" url="/topic/update?topicId=${topic.id}">
                <div class="modal-body" style="borer: 1px solid grey; ">

                    <span class=" col-sm-4">Name<sup>*</sup></span>
                    <input type="Text" class=" col-sm-6" name="name" placeholder="${topic.topicName}" required><br/><br/>
                    <span style="margin:20px"></span>
                </div>

                <br/><br/><br/>
                <div class="row col-sm-12" style="margin-bottom: 20px">

                    <button type="submit" class="btn btn-success  col-sm-4" style="margin-left: 3%;">Edit</button>
                    <button type="reset" class="btn btn-warning col-sm-4" style="margin-left: 19%;">Reset</button>
                </div>

            </g:form>
        </div>

    </div>
</div></div>
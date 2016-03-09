<div id="users" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="border: 1px solid grey; background:#f2f2f2;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Subscribed Users</h4>
            </div>

            <div class="modal-body" style="borer: 1px solid grey;background:whitesmoke; ">
                ${params.topic}

                <span style="margin:20px"></span>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

        </div>

    </div>
</div>
%{--<g:each in="${user}">${it}</g:each>--}%
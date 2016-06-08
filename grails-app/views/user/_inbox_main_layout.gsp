<div  style="margin-top: 3%">

        <div class="row ">
               <div style="float: right" id="inboxsearchform">
                    <div class="input-group"  style="
                    margin-left: 2%;margin-right: 2%;
                    ">
                        <input type="text" class="form-control" placeholder="Inbox Search" name="q" id="srch-inbox" onkeyup="inboxsearch()">

                        <div class="input-group-btn">
                            <button class="form-control" onclick="inboxsearch()" ><i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </div>

        </div>
    </div>
    <div >
        <g:render template="inbox"/>
</div>

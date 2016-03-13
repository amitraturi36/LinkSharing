<div>
    <div class="col-sm-12" style="padding:10px;margin:10px 0px">

    </div>

    <div style="padding:10px;margin:10px 0px">
        <div class="panel">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">Top Post
            </div>

            <div class="panel-body col-sm-12" style="border: 1px solid grey;">
                <g:each in="${list}">
                    <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${it.createdBy}"/>
                    </div>
                    <span class=" col-sm-6 " style="font-size: 15px;padding:20px 15px;">${it.createdBy}</span>
                    <span class=" col-sm-3 text-muted " style="padding:20px 0px;">${it.name}</span>



                    <div class=" col-sm-10">
                        <i class="fa fa-facebook "></i>
                        <i class="fa fa-google"></i>
                        <i class="fa fa-twitter"></i>

                        <span class="text-info col-sm-2"><a href="#"><ins>click</ins></a></span>

                    </div>
                </g:each>
            </div></div></div>

</div>
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Name Panel -->
<!-- ************************************************** -->
<g:each in="${resources}" var="resource">
    <div class="panel panel-default" id="post${resource.id}">

        <div class="panel-body">

            <div>
                <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${resource.createdBy}"/>
                </div>

                <div class="col-xs-10">
                    <div class="row" style="padding-bottom:5px">
                        <div class="col-xs-6">
                            <span class="h5">${resource.createdBy}</span>
                        </div>

                        <div class="col-xs-3">
                        </div>

                        <div class="col-xs-3">
                            <a href="#" class="text-left">${resource.topic}</a>
                        </div>
                    </div>

                    <div class="row" style="padding-bottom:10px">
                        <div class="col-xs-4">
                            <small class="text-muted">@uday</small>
                        </div>

                        <div class="col-xs-2"></div>

                        <div class="col-xs-6 text-muted">
                            <g:formatDate date="${resource.dateCreated}" type="datetime" style="MEDIUM"/></div>
                    </div>
                </div>

                <p style="padding-bottom:5px">${resource.description}</p>

                <div class="row">
                    <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                    <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                    <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                    <div class="col-xs-6"></div>

                    <div class="col-xs-4" class='readitem'><ls:read resource="${resource}"/></div>
                    <ls:download resource="${resource}"/>
                    <ls:link resource="${resource}"/>
                    <a href="/resource/show?id=${resource.topic.id}">View Post</a>
                </div>
            </div>

        </div>

    </div>
</g:each>
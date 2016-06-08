
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Name Panel -->
<!-- ************************************************** -->

<div id="inboxpanel" >
<g:if test="${!resources}">

    <span class="alert-warning">Inbox Is Empty</span>
    <span class="col-sm-12"></span>
</g:if>
<g:else>
    <div >
        <div class="col-lg-12" id="messageanderrorblock" >
        </div>
        <table class="table table-striped" style="margin-top: 2%">

            <g:each in="${resources}" var="post">
                <tr>  <td>
                    <span class="h2 col-sm-12 text-info" style="text-align: center;margin-bottom: 5%"> ${post.topic.topicName}</span>

                    <div class="col-sm-3" >
                        <a href="/user/profile?userId=${post.createdBy.id}" style="text-decoration: none"><ls:userImage
                                user="${post.createdBy}"/></a>
                    </div>
                    <span class="col-sm-8">
                        <a  class="h3 " href="/user/profile?userId=${post.createdBy.id}" style="text-decoration: none;">${post.createdBy}</a>
                        <span class="pull-right" style="font-size:20px;"><ls:read
                                resource="${post}"/>
                        </span>


                    </span>
                    <span class=" col-sm-3 text-muted "
                          style="    padding: 5px;margin-left: 6px;">
                        <g:formatDate date="${post.dateCreated}" type="time" style="short" />
                        <g:formatDate date="${post.dateCreated}" type="date" style="short" />

                    </span>

                    <p class="text-success col-sm-10" style="margin-left: 23%" >${post.description}</p>

                    <div class=" col-sm-12 row" style="margin-left: 5px">
                        <a href="http://www.facebook.com"><i class="fa fa-facebook "
                                                             style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.google.com"><i class="fa fa-google"
                                                           style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.twitter.com"><i class="fa fa-twitter"
                                                            style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <ins><g:link url="/resource/show?id=${post.topic.id}" class="text-info h3"
                                     style="float: right">View post</g:link></ins>
                    </div>

                </td>  </tr>
            </g:each>
        </table>
    </div>
    </div>
</g:else>

</div>









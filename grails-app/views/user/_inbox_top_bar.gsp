<g:if test="${resources}">

<a data-toggle="dropdown" class="dropdown-toggle" href="index.html#"style="    color: aliceblue"F>
    <i class="fa fa-envelope-o"></i>
    <span class="badge bg-theme">${resourcecount}</span>
</a>
<ul class="dropdown-menu extended inbox">
    <div class="notify-arrow notify-arrow-green"></div>
<li>
<p class="green">You have ${resourcecount} new messages</p>
</li>
    <g:set var="i" value="${0}"/>
    <g:while test="${(i<5)||(resourcecount<5)}">
        <g:set var="i" value="${i+1}"/>
        <g:set var="resourcecount" value="${resourcecount-1}"/>

<li>
<a href="/resource/show?id=${resources[i].id}&status=1">
<span class="photo">

        <ls:inboxImage
                user="${resources.createdBy[i]}"/>

    </span>
    <span class="subject">
        <span class="from">${resources.createdBy.name[i]}</span>

    </span>
    <span class="message">
       New Post is Uploaded for<b> Topic<br/> ${resources[i].topic}</b>
        <br/><span class="col-sm-1"></span><span class="col-sm-9">Uploaded by<b>  ${resources[i].createdBy}</b></span>

    </span>
</a>
    </li>
        </g:while>
    <li>
        <a onclick=" inboxload()"  style="cursor: pointer">See all Posts</a>
    </li>
</ul>
</g:if>
<g:else>

    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#"style="    color: aliceblue"F>
        <i class="fa fa-envelope-o"></i>
        <span class="badge bg-theme">0</span>
    </a>
    <ul class="dropdown-menu extended inbox">
        <div class="notify-arrow notify-arrow-green"></div>
    <li>
    <p class="red">You have No New Post</p>
    </li>
    </ul>
</g:else>
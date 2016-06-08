<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script></head>

<body>
<div class="nav navbar" >
    <div class="navbar-header col-sm-12" style="border:none;" id="loginfooter">
        <div class="row">

                <a href="/user/index.html" class="logo" style="margin-top: 23px;margin-left: 20px"><b>LinkSharing</b></a>
            <span class="h3 col-sm-4" style="color: aliceblue;margin-top: 23px">
                Admin Panel</span>
            <g:form class="form-inline col-sm-6" style="float: right" name="inboxsearchform" url="/user/admin">

                <select class="form-control col-sm-3 "  name="selector" style="margin-top: 21px;">

                    <option class="alert-info" value="2">All Users</option>
                    <option class="alert-success" value="1">Active</option>
                    <option class="alert-danger" value="0">InActive</option>
                </select>
                   <span class="col-sm-3"></span>
                <div class="input-group col-sm-6" style="margin-top: 12px;margin-left: 58px;">
                    <input type="text" class="form-control" placeholder="Search" name="search" id="srch-inbox" style="
                    margin-top: 10px;
                    ">

                    <div class="input-group-btn">
                        <button class="btn btn-default form-control" type="submit"><i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

<div class=" col-sm-12">
    <div class="table-responsive">
        <table class="table table-striped">
            <tr>
                <th>id</th>
                <th>UserName</th>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Active</th>
                <th>Manage</th>
            </tr>
            <tbody id="tablecontent">
            <g:if test="${users}">
            <g:each in="${users}" var="user">
                <g:if test="${user.active}">
                    <tr class="alert-success">
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.active}</td>
                        <td><span style="cursor: pointer" class="text-danger" id="admin${user.id}"
                                  onclick="activation(${user.id}, 0)">Deactivate</span></td>
                    </tr>

                </g:if>
                <g:else>
                    <tr class="alert-danger" id="admincol${user.id}">
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.active}</td>
                        <td><span style="cursor: pointer" class="text-success" id="admin${user.id}"
                                  onclick="activation(${user.id}, 1)">Activate</span></td>
                    </tr>
                </g:else>
            </g:each>
            </g:if>
            <g:else>

                <div class="alert-warning h2" style="padding: 20px;
                text-align: center;
                position: absolute;
                top: 50px;
                width: 100%">No Record Found</div>
            </g:else>
            </tbody>
        </table>
        <div>

            <util:remotePaginate maxsteps="5" max="20" update="#tablecontent" controller="user" action="admin" total="${usercount}"/>
        </div>
    </div>
</div>

<div id="copyright" class="container" style="    position:relative;top: 260px;">
    <div style="text-align: center;    margin-left: 20%;">
        <img src="${assetPath(src: 'tothe newdigital.jpeg')}" width="120px" height="120px"
             class="pull-left colsm-3">

        <p class="h3 col-sm-8"
           style="color: #45443B;text-decoration: blink">&copy; All rights reserved by <a
                href="http://ToTheNew.com/" style="color: black" class="h2">To the New Digital</a> .</p>
    </div>
</div>






</body>
</html>
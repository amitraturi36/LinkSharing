<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="panel panel-default" style="margin-top: 10%">
    <div class="panel-heading col-sm-12 "
         style="border: 1px solid grey;background-color: black;margin-top:-30px;padding-top:-30px">
        <div class="row">
            <span class="h4 col-sm-5" style="color:white">Users</span>
            <g:form class="form-inline col-sm-6" style="float: right" name="inboxsearchform" url="/user/admin">
                <select class="form-control col-sm-5" style="width:20% " name="selector">
                    <option class="alert-info" value="2">All Users</option>
                    <option class="alert-success" value="1">Active</option>
                    <option class="alert-danger" value="0">InActive</option>
                </select>
                   <span class="col-sm-3"></span>
                <div class="input-group col-sm-4">
                    <input type="text" class="form-control" placeholder="Search" name="search" id="srch-inbox">

                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

<div class="panel-body">
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
            </tbody>
        </table>
        <div>

            <util:remotePaginate maxsteps="5" max="20" update="#tablecontent" controller="user" action="admin" total="${usercount}"/>
        </div>
    </div>
</div>
</body>
</html>
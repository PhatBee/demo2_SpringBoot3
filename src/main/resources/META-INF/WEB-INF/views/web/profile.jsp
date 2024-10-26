<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 23/09/2024
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp"%>
<!-- BEGIN CONTENT -->
<div class="col-md-9 col-sm-7">
    <h1>Update Profile</h1>
    <div class="content-form-page">
        <form method="post" action="${pageContext.request.contextPath}/profile" enctype="multipart/form-data" role="form" class="form-horizontal form-without-legend">
            <div class="form-group">
                <label class="col-lg-2 control-label" for="full-name">Full Name <span class="require">*</span></label>
                <div class="col-lg-8">
                    <input type="text" id="full-name" class="form-control" value="${sessionScope.account.fullname}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="user-name">User name <span class="require">*</span></label>
                <div class="col-lg-8">
                    <input type="text" id="user-name" class="form-control" id="username" name="username" value="${sessionScope.account.username}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="email">E-Mail <span class="require">*</span></label>
                <div class="col-lg-8">
                    <input type="text" id="email" class="form-control" value="${sessionScope.account.email}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="telephone">Telephone <span class="require">*</span></label>
                <div class="col-lg-8">
                    <input type="text" id="telephone" class="form-control" value="${sessionScope.account.phone}">
                </div>
            </div>

<%--            <div class="form-group">--%>
<%--                <label class="col-md-2 control-label">Dropdown</label>--%>
<%--                <div class="col-md-8">--%>
<%--                    <select class="form-control">--%>
<%--                        <option>value="${sessionScope.account.roleid}"</option>--%>
<%--                        <option>Option 2</option>--%>
<%--                        <option>Option 3</option>--%>
<%--                        <option>Option 4</option>--%>
<%--                        <option>Option 5</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="form-group">
                <label class="col-lg-2 control-label">Checkboxes</label>
                <div class="col-lg-8 checkbox-list">
                    <c:if test="${sessionScope.account.roleid == 1}">
                        <input type="text" id="role" class="form-control" value="Admin" readonly></c:if>
                    <c:if test="${sessionScope.account.roleid == 2}">
                        <input type="text" id="role" class="form-control" value="Manager" readonly></c:if>
                    <c:if test="${sessionScope.account.roleid == 3}">
                        <input type="text" id="role" class="form-control" value="Seller" readonly></c:if>
                    <c:if test="${sessionScope.account.roleid == 4}">
                        <input type="text" id="role" class="form-control" value="Shipper" readonly></c:if>
                    <c:if test="${sessionScope.account.roleid == 5}">
                        <input type="text" id="role" class="form-control" value="User" readonly></c:if>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">File input</label>
                <div class="col-lg-8">
                        <input type="file" name="image">
                        <c:if test="${message !=null}">${message}</c:if>
                    <p class="help-block">some help text here.</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="message">Message</label>
                <div class="col-lg-8">
                    <textarea class="form-control" rows="6"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                    <button class="btn btn-primary" type="submit">Continue</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- END CONTENT -->

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 09/10/2024
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp"%>
<form action="<c:url value="/admin/video/insert"/>" method="post" enctype="multipart/form-data">

    <label for="categoryid">Category ID:</label><br>
    <input type="text" id="categoryid" name="categoryid"><br>

    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title"><br>

    <label for="poster">Poster:</label><br>
    <input type="text" id="poster" name="poster"><br>

    <label for="poster1">Upload File:</label><br>
    <img height="150" width="200" src="" id="posterr" />
    <input type="file" onchange="chooseFile(this)" id="poster1" name="poster1"><br><br>

    <label for="description">Description:</label><br>
    <input type="text" id="description" name="description"><br>

    <label for="views">Title:</label><br>
    <input type="text" id="views" name="views"><br>


    <label for="active">Active:</label><br>
    <input type="radio" id="activeon" name="active" value="1">
    <label for="activeon">Hoạt động</label>
    <input type="radio" id="activeoff" name="active" value="0">
    <label for="activeoff">Khoá</label>
    <br>
    <hr>
    <input type="submit" value="Submit">
</form>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/09/2024
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>
<form action="/ltwebst2/forgot-password" method="post" >

    <c:if test="${alert !=null}">
        <h3 class="alert alert danger">${alert}</h3>
    </c:if>

    <div class="container">
        <label for="username"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="username" required>

        <label for="email"><b>Email</b></label>
        <input type="text" placeholder="Enter Email" name="email" required>

        <button type="submit">Submit</button>
    </div>

</form>

</body>
</html>

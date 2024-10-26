<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/09/2024
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset Password</title>
</head>
<body>
<form action="/ltwebst2/reset-password" method="post">

    <c:if test="${alert !=null}">
        <h3 class="alert alert danger">${alert}</h3>
    </c:if>

    <div class="container">
        <input type="hidden" name="username" value="${username}">

        <label for="newPassword"><b>New Password</b></label>
        <input type="password" placeholder="Enter New Password" name="newPassword" required>

        <label for="confirmPassword"><b>Confirm Password</b></label>
        <input type="password" placeholder="Confirm Password" name="confirmPassword" required>

        <button type="submit">Submit</button>
    </div>

</form>
</body>
</html>

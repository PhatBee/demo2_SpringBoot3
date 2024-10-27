<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<a href="/admin/categories/add">Add Category</a><br>

<c:if test="${message!=null}">
    ${message}
</c:if>

<table border="1" width="100%">
    <tr>
        <th>Stt</th>
        <th>Images</th>
        <th>Category Name</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach items = "${list}" var="cate" varStatus="stt">
        <tr>
            <td>${stt.index+1}</td>
            <td>${cate.images}</td>
            <td>${cate.name}</td>
            <td>${cate.status}</td>
            <td>
                <a href="/admin/categories/edit/${cate.id}">Sửa</a> |
                <a href="/admin/categories/delete/${cate.id}">Xoá</a>
            </td>
        </tr>
    </c:forEach>
</table>

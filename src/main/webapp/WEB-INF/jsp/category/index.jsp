<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../layout/style.jsp" %>
<head>
    <%@ include file="../layout/bootstrap_meta.jsp" %>
    <title>Category</title>
</head>
<body>
<%@ include file="../layout/navbar.jsp" %>
<div class="container w-50">

<div class="list-group mb-2">
<c:forEach items="${categories}" var="category">
    <a href="/admin/category/${category.getId()}/edit" class="list-group-item list-group-item-action ">${category.getCategory()}</a>
    <a href="/admin/category/${category.getId()}/delete" class="btn btn-danger btn-sml mb-2 float-right" style="width:15%;">Usuń</a>
</c:forEach>
</div>
    <a href="/admin/category/add" class="btn btn-success">Dodaj</a>
</div>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>

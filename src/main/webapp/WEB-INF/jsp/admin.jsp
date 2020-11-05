<%--
  Created by IntelliJ IDEA.
  User: Damiano
  Date: 18.02.2020
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="layout/style.jsp" %>
<head>
    <%@ include file="layout/bootstrap_meta.jsp" %>
    <title>Admin Panel</title>
</head>
<body>
<%@ include file="layout/navbar.jsp" %>

<a class="btn btn-primary" href="/admin/movie" role="button">Movie</a>
<a class="btn btn-primary" href="/admin/category" role="button">Category</a>
<a class="btn btn-primary" href="/admin/comments" role="button">Comments</a>
</body>
</html>

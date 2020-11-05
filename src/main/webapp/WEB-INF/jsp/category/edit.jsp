<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../layout/style.jsp" %>
<head>
    <%@ include file="../layout/bootstrap_meta.jsp" %>
    <title>Edit Category</title>
</head>
<body>
<%@ include file="../layout/navbar.jsp" %>
<div class="container w-50">
<form:form method="POST" action="/admin/category/edit"
           modelAttribute="categoryForm">
    <form:hidden path="id"></form:hidden>
    <form:label  for="labelselect1" path="category">Kategoria</form:label>
    <form:input class="form-control mb-2" id="labelselect1" path="category" />
    <input type="submit" class="btn btn-primary" value="Edytuj" />
</form:form>
</div>
<%@ include file="../layout/footer.jsp" %>
</body>
</html>

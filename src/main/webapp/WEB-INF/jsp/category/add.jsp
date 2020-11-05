<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../layout/style.jsp" %>
<head>
    <%@ include file="../layout/bootstrap_meta.jsp" %>
    <title>Add Category</title>
</head>
<body>
<%@ include file="../layout/navbar.jsp" %>
<form:form class="form-inline" method="POST" action="/admin/category/add"
           modelAttribute="categoryForm">

    <form:label for="labelinput1" path="category">Kategoria</form:label>
    <form:input  class="form-control ml-2" id="labelinput1" path="category" />

    <input type="submit" class="btn btn-primary ml-2" value="Dodaj" />

</form:form>
<%@ include file="../layout/footer.jsp" %>
</body>
</html>

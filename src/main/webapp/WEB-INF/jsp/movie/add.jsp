<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../layout/style.jsp" %>
<head>
    <%@ include file="../layout/bootstrap_meta.jsp" %>
    <title>Add Movie</title>
</head>
<body>
<%@ include file="../layout/navbar.jsp" %>
<div class="container w-50">
<form:form method="POST" action="/admin/movie/add"
           modelAttribute="movieForm">
<div class="form-group">
    <form:label  for="labelselect1" path="category">Kategoria filmu</form:label>
    <form:select  class="form-control" id="labelselect1" path="category">
        <c:forEach items="${categories}" var="category">
            <form:option value="${category}">${category.getCategory()}</form:option>
        </c:forEach>
    </form:select>
    <form:label for="labelinput1" path="movieName"> Nazwa filmu</form:label>
    <form:input  class="form-control" id="labelinput1" path="movieName" />
    <form:label  for="labelinput2" path="movieDescription">Opis filmu</form:label>
    <form:input   class="form-control"  id="labelinput2"  path="movieDescription" />
    <form:label  for="labelinput3" path="movieDirector">Reżyseria filmu</form:label>
    <form:input   class="form-control"  id="labelinput3"  path="movieDirector" />
    <form:label  for="labelinput4" path="movieRealiseDate">Premiera filmu</form:label>
    <form:input   type="number" class="form-control"  id="labelinput4"  path="movieRealiseDate" />
    <form:label for="labelinput5" path="movieRentPrice"> Cena filmu</form:label>
    <form:input  class="form-control" id="labelinput5" path="movieRentPrice" type="number" step="0.01"/>
    <form:label  for="labelinput6" path="movieOriginCountry">Kraj produkcji filmu</form:label>
    <form:input   class="form-control"  id="labelinput6"  path="movieOriginCountry" />
    <form:label  for="labelinput7" path="moviePhoto">Zdjęcie filmu</form:label>
    <form:input   class="form-control"  id="labelinput7"  path="moviePhoto" />
    <form:label  for="labelinput8" path="movieTrailer">Trailer filmu</form:label>
    <form:input    class="form-control"  id="labelinput8"  path="movieTrailer" />



    <input type="submit" class="btn btn-primary" value="Submit" />
</div>
</form:form>
</div>
<%@ include file="../layout/footer.jsp" %>
</body>
</html>

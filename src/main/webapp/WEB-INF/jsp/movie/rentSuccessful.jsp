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


<div class="jumbotron">
    <h1 class="display-4">Wypożyczono pomyślnie film <strong>${rentHistory.getMovie().getMovieName()}</strong>!</h1>
    <p class="lead">Dziękujemy za wypożyczenie filmu <strong>${rentHistory.getMovie().getMovieName()}</strong>, data wygaśniecia filmu to: <strong>${addedDaysToRentDate}</strong></p>
    <p class="lead">Całkowity koszt wypożyczenia: <strong> ${sumPrice} zł</strong></p>
    <hr class="my-4">
    <p>Aby sprawdzić datę wygaśnięcia filmu, zajrzyj do profilu do zakładki Historia wypożyczeń.</p>
    <a class="btn btn-primary btn-lg" href="/index" role="button">Powrót na stronę główną</a>
</div>


<%@ include file="../layout/footer.jsp" %>
</body>
</html>
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

<table class="table table-hover table-dark">
    <thead>
    <tr>
        <th scope="col">Nazwa</th>
        <th scope="col">Kategoria</th>
        <th scope="col">Opis</th>
        <th scope="col">Reżyseria</th>
        <th scope="col">Premiera</th>
        <th scope="col">Cena</th>
        <th scope="col">Kraj produkcji</th>
        <th scope="col">Zdjęcie</th>
        <th scope="col">Trailer</th>
        <th scope="col">Usuń</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${movie}" var="movie">
        <tr onclick="window.location='/admin/movie/${movie.getId()}/edit'" style=" cursor: pointer;">

            <th scope="row">${movie.getMovieName()}</th>
            <td>${movie.getCategory().getCategory()}</td>
            <td>${movie.getMovieDescription()}</td>
            <td>${movie.getMovieDirector()}</td>
            <td>${movie.getMovieRealiseDate()}</td>
            <td>${movie.getMovieRentPrice()}</td>
            <td>${movie.getMovieOriginCountry()}</td>
            <td><img src="${movie.getMoviePhoto()}" style="width:50%;"/></td>
            <td>${movie.getMovieTrailer()}</td>
            <td>
                <a href="/admin/movie/${movie.getId()}/delete" class="btn btn-danger">Usuń</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/admin/movie/add" class="btn btn-success">Dodaj</a>
</body>
<%@ include file="../layout/footer.jsp" %>
</html>

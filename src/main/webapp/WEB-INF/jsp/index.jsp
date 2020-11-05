<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@ include file="layout/style.jsp" %>
<head>
  <%@ include file="layout/bootstrap_meta.jsp" %>
  <title> MovieRent</title>
</head>
<body>
<%@ include file="layout/navbar.jsp" %>

<div class="container">




<c:forEach items="${movies}" var="movie">
  <div class="grid">
    <figure class="effect-chico">
      <img src="${movie.getMoviePhoto()}" />
      <figcaption>
        <h2><span>${movie.getMovieName()}</span></h2>
        <p>Opis: ${movie.getMovieDescription()}</p>
        <p>Cena: ${movie.getMovieRentPrice()} zł</p>
        <a href="/movie/${movie.getId()}/details">Wypożycz</a>
      </figcaption>
    </figure>

  </div>
</c:forEach>

</div>


<%@ include file="layout/footer.jsp" %>
</body>
</html>

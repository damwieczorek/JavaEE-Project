<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../layout/style.jsp" %>
<head>
    <%@ include file="../layout/bootstrap_meta.jsp" %>
    <title>${movie.getMovieName()}</title>
</head>
<body>
<%@ include file="../layout/navbar.jsp" %>
<script src="https://kit.fontawesome.com/5a29b017d2.js" crossorigin="anonymous"></script>

<script >
var rating = 0;
if (ViewBag.rating.Count != 0)
{
rating = ViewBag.rating[0].RatingValue;
}
</script>

<div class="card mb-3">
    <iframe class="card-img-top" width="800" height="415" src="${movie.getMovieTrailer()}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <h2 class="card-header">${movie.getMovieName()}</h2>
    <div class="card-body">
        <img class="rounded float-left mr-2" style="width:30%; max-height:40%;" src="${movie.getMoviePhoto()}">
        <p class="card-text">${movie.getMovieDescription()}</p>
        <hr />

        <p class="card-text"><a class="text-muted">Reżyseria: </a>${movie.getMovieDirector()}</p>
        <p class="card-text"><a class="text-muted">Gatunek: </a>${movie.getCategory().getCategory()}</p>
        <p class="card-text "><a class="text-muted">Produkcja: </a>${movie.getMovieOriginCountry()}</p>
        <p class="card-text "><a class="text-muted">Premiera: </a>${movie.getMovieRealiseDate()}</p>
        <p class="card-text "><a class="text-muted">Cena: </a>${movie.getMovieRentPrice()} zł/24h</p>


        <div>
            <c:if test="${pageContext.request.isUserInRole('USER') || pageContext.request.isUserInRole('ADMIN')}">
            <span class="fa fa-star checked" onmouseover="star(1)" onclick="setStar(1)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(2)" onclick="setStar(2)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(3)" onclick="setStar(3)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(4)" onclick="setStar(4)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(5)" onclick="setStar(5)" onmouseout="delMsg()"></span>
            <span class="badge badge-success" id="ratingMsg"></span>
            <br />

<%--            <p class="text-muted">Średnia ocena: <strong> @ViewBag.avg (@ViewBag.allRatings)</strong></p>--%>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="rent">Wypożycz</button>
            </c:if>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ustal okres wypożyczenia filmu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form:form method="POST" action="/rentHistory/add"
                                   modelAttribute="rentHistoryForm">
                        <div class="modal-body">

                            <div class="form-group">
                                <label class="col-form-label">Okres wypożyczenia(w dniach)</label>
                                <form:input type="number"  class="form-control mb-2" id="rentTime" path="rentTime" onchange="calcPrice(${movie.getMovieRentPrice()})" />
                                <form:hidden path="movie" value="${movie.getId()}"></form:hidden>

                                 <p class="text-muted" id="result"></p>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Anuluj</button>
                            <input type="submit" value="Akceptuj" class="btn btn-success" />
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
    <p>
        <a href="/admin/movie/${movie.getId()}/edit" class="btn btn-primary btn-sm float-right" style="width:15%;">Edytuj</a>
        <a href="/admin/movie/${movie.getId()}/delete" class="btn btn-primary btn-sm float-right" style="width:15%;">Usuń</a>
    </p>
    </c:if>
    <div id="comments" class="container mb-2">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                <form:form method="POST" action="/movie/details"
                                 modelAttribute="commentsForm">

                        <div class="form-horizontal">
                            <h4>Komentarze</h4>
                            <form:hidden path="movie" value="${movie.getId()}"></form:hidden>

                            <div class="form-group">
                                <form:textarea class="form-control" path="comment" rows="5"  style="max-width:unset;"/>

                                <c:if test="${pageContext.request.isUserInRole('USER') || pageContext.request.isUserInRole('ADMIN')}">
                                <input type="submit" value="Dodaj" class="btn btn-primary mt-1 float-right" />
                                </c:if>
                            </div>

                        </div>
                </form:form>
                    </div>
                </div>
                <hr />
            <c:forEach items="${comments}" var="comment">
                <div class="row">
                    <div class="col">
                        <p class="card-title"> <span class="badge badge-pill badge-primary"> ${comment.getUser().getUsername()}</span></p>
                        <p class="card-text">${comment.getComment()}</p>

                        <c:if test="${pageContext.request.isUserInRole('ADMIN')}">

                            <a href="/admin/comments/${comment.getId()}/delete" class="btn btn-danger btn-sm float-right" style="width:15%;">Usuń</a>

                        </c:if>

                    </div>
                </div>
                <hr />
            </c:forEach>
                </div>
        </div>
    </div>

</div>

<script src="/resources/movieDetailsJS.js"></script>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>

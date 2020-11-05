<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../layout/style.jsp" %>
<head>
    <%@ include file="../layout/bootstrap_meta.jsp" %>
    <title> Manage Account</title>
</head>
<body>
<%@ include file="../layout/navbar.jsp" %>

<div class="container-fluid">
    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h2 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Historia zamówień
                    </button>
                </h2>
            </div>

            <div id="collapseOne" class="collapse " aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>

                            <th scope="col">Nazwa Filmu</th>
                            <th scope="col">Data wypożyczenia</th>
                            <th scope="col">Dni do oddania</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${rentHistory}" var="rent">
                            <c:choose >
                            <c:when test="${pageContext.request.userPrincipal.name == rent.getUser().getUsername()}">
                        <tr>


                            <th scope="row">${rent.movie.getMovieName()}</th>
                            <td>${rent.getRentDate()}</td>
                            <td>${rent.getRentTime()} dni</td>
                        </tr>
                            </c:when>
                            </c:choose>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="../layout/footer.jsp" %>
</body>
</html>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-2">
        <a class="navbar-brand" href="/">MovieRent</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

        <li class="nav-item ">
        <a class="nav-link" href="/"> Filmy <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="#">Kontakt</a>
        </li>
        <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
        <li class="nav-item">
        <a class="nav-link" href="/admin">Admin</a>
        </li>
        </c:if>
        </ul>
        <c:choose >
            <c:when test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        <div class="float-right">
                <a href="/manage" class="badge badge-pill badge-success">${pageContext.request.userPrincipal.name}</a>
        <a class="btn btn-primary btn-sm" role="button" aria-pressed="true"onclick="document.forms['logoutForm'].submit()">Wyloguj</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="float-right">
                <a class="btn btn-light btn-sm" role="button" href="/login">Zaloguj</a>
                <a class="btn btn-light btn-sm" role="button" href="/registration">Rejestracja</a>
                </div>
            </c:otherwise>
        </c:choose>
       </div>
        </nav>
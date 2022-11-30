<%@ include file="/WEB-INF/jsp/header.jsp"%>

<div class="container">
    <h1>Liste of old movies (before 2000)</h1>

    <c:url var="movieAction" value="/movie" />

    <table class="table">
        <tr>
            <th>Name</th>
            <th>Year</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="oldMovie" items="${oldMovies}">
            <tr>
                <td>${oldMovie.name}</td>
                <td>${oldMovie.year}</td>
                <td><a class="btn btn-primary btn-sm"
                       href="${movieAction}/${oldMovie.id}">Montrer</a></td>
            </tr>
        </c:forEach>
    </table>

    <p>
        <a class="btn btn-primary btn-sm" href="/movies">Liste des films</a>
    </p>
</div>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

<%@ include file="/WEB-INF/jsp/header.jsp"%>

<div class="container">
	<h1>Liste des films</h1>

	<c:url var="movieAction" value="/movie" />

	<table class="table">
		<tr>
			<th>Name</th>
			<th>Year</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="movie" items="${movies}">
			<tr>
				<td>${movie.name}</td>
				<td>${movie.year}</td>
				<td><a class="btn btn-primary btn-sm"
					href="${movieAction}/${movie.id}">Montrer</a></td>
			</tr>
		</c:forEach>
	</table>

	<p>
		<a class="btn btn-success" href="/old-movies">Old Movies (before 2000)</a>
		<a class="btn btn-info" href="/movies/add">Add movie</a>
		<a class="btn btn-danger" href="/logout">Log out</a>
	</p>
</div>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

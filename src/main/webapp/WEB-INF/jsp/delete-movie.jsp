<%@ include file="/WEB-INF/jsp/header.jsp"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url var="movieDeleteControl" value="/delete-movie" />

<div class="container">
  <h1>Confirm Delete Movie</h1>

  <form:form method="post" action="${movieDeleteControl}/${movie.id}" modelAttribute="movie">

    <div class="form-group">
      <label>Do you want to delete this movie : ${movie.name} ?</label>

      <div class="form-group">
        <label for="yes">Yes</label>
        <input type="radio" id="yes" name="delete-controller" value="yes">
      </div>

      <div class="form-group">
        <label for="no">No</label>
        <input type="radio" id="no" name="delete-controller" value="no">
      </div>

    </div>

    <div class="form-group">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form:form>
</div>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

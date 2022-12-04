

<%@ include file="/WEB-INF/jsp/header.jsp"%>


<c:url var="home" value="/aaa" />
<c:url var="app" value="/app.js" />

<c:url var="show-movie" value="/api/cvs/" />
<script>
    var counter = 0;

    function moreFields() {

        counter++;

        var newFields = document.getElementById('readroot').cloneNode(true);
        newFields.id = '';
        newFields.style.display = 'block';
        var newField = newFields.childNodes;
        for (var i=0;i<newField.length;i++) {
            var theName = newField[i].name
            if (theName)
                newField[i].name = theName + counter;
        }
        var insertHere = document.getElementById('writeroot');
        insertHere.parentNode.insertBefore(newFields,insertHere);
    }

    window.onload = moreFields;
</script>
<div id="myApp">
    <div class="container">
        <h1>Gestion CV</h1>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand badge badge-pill text-white badge-primary" href="/app" >My Cv</a>
    </nav>

    <table class="table">
        <tr>
            <th>FirstName</th>
            <th>LastName</th>
        </tr>
        <tr v-for="cv in cvs">
            <td>{{cv.person.firstName}}</td>
            <td>{{cv.person.lastName}}</td>

            <%--Actions--%>
            <td><button class="btn btn-primary btn-sm"
                        v-on:click="showCv(cv.person.id)">Show Cv</button></td>
        </tr>
    </table>

<%--    <table v-if="(activities != null)" class="table">--%>
<%--        <tr>--%>
<%--            <th>id</th>--%>
<%--            <th>year</th>--%>
<%--            <th>nature</th>--%>
<%--        </tr>--%>

<%--        <tr v-for="activity in activities">--%>
<%--            <td>{{activity.id}}</td>--%>
<%--            <td>{{activity.year}}</td>--%>
<%--            <td>{{activity.nature}}</td>--%>
<%--        </tr>--%>

<%--    </table>--%>

<%--  show cv   --%>

    <div v-if="(activitiesStatus)"  class="container py-5" >
        <div class="row">
            <div class="col-lg-6 mx-auto">
                <div class="card ">
                    <div class="card-header">
                        <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                              <div id="accordion">
                               <div class="card" v-for="activity in activities" >
                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" data-toggle="collapse"
                                                    data-target="#collapseOne" aria-expanded="true"
                                                    aria-controls="collapseOne">
                                                {{activity.nature}}
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card" style="width: 30rem;">
                                            <div class="card-body">
                                                <h5 class="card-title">{{activity.title}}</h5>
                                                <h6 class="card-subtitle mb-2 text-muted">{{activity.year}}</h6>
                                                <p class="card-text">{{activity.description}}</p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%-- add cv section --%>

<div v-if="(isAddCv)" class="container py-5">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
<%--                        <div id="readroot" style="display: none">--%>

<%--                            <input type="button" value="Remove review"--%>
<%--                                   onclick="this.parentNode.parentNode.removeChild(this.parentNode);"--%>
<%--                            /><br/><br />--%>

<%--                            <div class="form-group">--%>
<%--                                <label for="datetimepicker3">Year</label>--%>
<%--                                <div class='input-group date' id='datetimepicker3'>--%>
<%--                                    <input type='text' name="year" id="year" class="form-control" />--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div  class="form-group">--%>
<%--                                <label>--%>
<%--                                    <select name="activity.nature" class="form-control form-control-sm">--%>
<%--                                        <option value="formation">Formation</option>--%>
<%--                                        <option value="experience_prof" >expérience professionnelle</option>--%>
<%--                                        <option value="projets">projets</option>--%>
<%--                                        <option value="autre">autre</option>--%>
<%--                                    </select>--%>
<%--                                </label></div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="formGroupExampleInput2">titre</label>--%>
<%--                                <input type="text" class="form-control" id="formGroupExampleInput3" name="activity.title" placeholder="Another input">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="exampleFormControlTextarea1">description</label>--%>
<%--                                <textarea class="form-control" name="activity.description" id="exampleFormControlTextarea1" rows="3"></textarea>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="formGroupExampleInput2">Adresse WEB </label>--%>
<%--                                <input type="text" class="form-control" name="activity.web" id="formGroupExampleInput2" placeholder="Another input">--%>
<%--                            </div>--%>

<%--                        </div>--%>

<%--                        <form method="post">--%>


<%--                            <span id="writeroot"></span>--%>

<%--                            <input type="button" onclick="moreFields()"  value="ajouter une section" />--%>
<%--                            <input v-on:click="setAddCv(false)" type="button" value="clear"/>--%>
<%--                            <button v-on:click.prevent="addCv(personId,cvActivities)" class="btn btn-primary mr-2">--%>
<%--                                Add Movie</button>--%>


<%--                        </form>--%>
<%--                        --%>







<script src="${app}" type="module"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

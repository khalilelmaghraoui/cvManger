

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
        <h1><a href="/home">Gestion CV</a></h1>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand badge badge-pill text-white badge-primary" href="/app" >My Cv</a>
    </nav>

    <table class="table">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>web</th>
            <th>birth</th>
        </tr>
        <tr v-for="cv in cvs">
            <td>{{cv.person.firstName}}</td>
            <td>{{cv.person.lastName}}</td>
            <td>{{cv.person.web}}</td>
            <td>{{cv.person.birth}}</td>

            <%--Actions--%>
            <td><button class="btn btn-primary btn-sm"
                        v-on:click="showCv(cv.person.id)">Show Cv</button></td>
        </tr>
    </table>

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
                                                <h5 class="card-title"><span class="font-weight-light font-weight-bold">Title: </span>{{activity.title}}</h5>
                                                <h6 class="card-text text-muted"><span class="font-weight-light font-weight-bold">Year: </span>{{activity.year}}</h6>
                                                <p class="card-text text-muted"><span class="font-weight-light font-weight-bold">Description: </span>{{activity.description}}</p>
                                                <h6 class="card-subtitle mb-2 text-muted"><span class="font-weight-light font-weight-bold">Web: </span>{{activity.web}}</h6>
                                                <h6 class="card-subtitle mb-2 text-muted"><span class="font-weight-light font-weight-bold">Nature: </span> <span class="badge badge-secondary">{{activity.nature}}</span></h6>

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





<script src="${app}" type="module"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

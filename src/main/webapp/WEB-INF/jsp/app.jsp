

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
        <a class="navbar-brand" href="#" v-on:click="setAddCv(true)">ajouter un Cv</a>
        <a class="navbar-brand" href="#" v-on:click="setAddPerson(true)">ajouter un Person</a>
    </nav>



    <div  class="pageWrapper">
        <table class="table">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>web</th>
                <th>birth</th>
            </tr>

                <td>{{me.firstName}}</td>
                <td>{{me.lastName}}</td>
                <td>{{me.web}}</td>
                <td>{{me.birth}}</td>

                <%--Actions--%>
                <td><button class="btn btn-primary btn-sm"
                            v-on:click="showCv(me.id)">Show Cv</button></td>
        </table>

        <div v-if="(activitiesStatus)"  class="container py-5" >
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card ">
                        <div class="card-header">
                            <h1 class="navbar-brand">CV</h1>
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
                                                    <h5 class="card-title"><span class="font-weight-light">Title: </span>{{activity.title}}</h5>
                                                    <h6 class="card-text"><span class="font-weight-light">Year: </span>{{activity.year}}</h6>
                                                    <p class="card-text"><span class="font-weight-light">Description: </span>{{activity.description}}</p>
                                                    <h6 class="card-subtitle mb-2 text-muted"><span class="font-weight-light">Web: </span>{{activity.web}}</h6>
                                                    <h6 class="card-subtitle mb-2 text-muted"><span class="font-weight-light">Nature: </span> <span class="badge badge-secondary">{{activity.nature}}</span></h6>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn mr-1 btn-success btn-sm"
                                                        v-on:click="editCV(activity,activity.id)">Edit</button>

                                                <button class="btn .px-2 btn-danger  btn-sm"
                                                        v-on:click="deleteActivity(activity.id)">delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="navbar-brand" href="#" v-on:click="setAddCv(true)">ajouter une section</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div v-if="(isAddCv)" class="container py-5">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card ">
                        <div class="card-header">
                            <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">

                                <form  id="add-cv" method="post" novalidate="true">
                                    <h1 class="mt-4">add new Section</h1>

                                    <div class="form-group">
                                        <label>title :</label>
                                        <input v-model="cvActivities.title" name="cvActivities.title" class="form-control"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>nature :</label>
                                        <select v-bind:class="{'is-invalid':errors.name}" v-model="cvActivities.nature" name="cvActivities.nature" class="form-select" aria-label="Default select example">
                                            <option value="professional">professional</option>
                                            <option value="professional">foramtion</option>
                                            <option value="projets">projets</option>
                                            <option value="autre">autre</option>
                                        </select>
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>year :</label>
                                        <input v-model="cvActivities.year" name="cvActivities.year" class="form-control"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>description :</label>
                                        <input v-model="cvActivities.description" name="cvActivities.description" class="form-control"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>web :</label>
                                        <input v-model="cvActivities.web" name="cvActivities.web"  class="form-control"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button v-on:click.prevent="addCv(me.id,cvActivities)" class="btn btn-primary mr-2">
                                            Add Movie</button>
                                        <button v-on:click.prevent="addCv(me.id,cvActivities)" class="btn btn-outline-primary">
                                            add add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <form v-if="(editCvActivity != null)" id="app" method="post" novalidate="true">

            <div  class="container py-5" >
                <div class="row">
                    <div class="col-lg-6 mx-auto">


                        <div class="card ">
                            <div class="card-header">
                                <h1 class="mt-4">Edit section</h1>
                                <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                    <div id="accordion1">
                                        <div class="card" >
                                            <div class="card-header" id="headingOne1">
                                                <h5 class="mb-0">
                                                    <button class="btn btn-link" data-toggle="collapse"
                                                            data-target="#collapseOne1" aria-expanded="true"
                                                            aria-controls="collapseOne1">
                                                        {{editCvActivity.nature}}
                                                    </button>
                                                </h5>
                                            </div>

                                            <div id="collapseOne1" class="collapse show" aria-labelledby="headingOne1"
                                                 data-parent="#accordion1">
                                                <div class="card" style="width: 30rem;">
                                                    <div class="card-body">
                                                        <div class="form-group">
                                                            <label>title :</label>
                                                            <input v-model="editCvActivity.title" name="editCvActivity.title" class="form-control"
                                                                   v-bind:class="{'is-invalid':errors.name}" />
                                                            <div v-if="(errors.name)" class="alert alert-warning">
                                                                {{errors.name}}
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>nature :</label>
                                                            <input v-model="editCvActivity.nature" name="editCvActivity.nature" class="form-control"
                                                                   v-bind:class="{'is-invalid':errors.name}" />
                                                            <div v-if="(errors.name)" class="alert alert-warning">
                                                                {{errors.name}}
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>year :</label>
                                                            <input v-model="editCvActivity.year" name="editCvActivity.year" class="form-control"
                                                                   v-bind:class="{'is-invalid':errors.name}" />
                                                            <div v-if="(errors.name)" class="alert alert-warning">
                                                                {{errors.name}}
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>description :</label>
                                                            <input v-model="editCvActivity.description" name="editCvActivity.description" class="form-control"
                                                                   v-bind:class="{'is-invalid':errors.name}" />
                                                            <div v-if="(errors.name)" class="alert alert-warning">
                                                                {{errors.name}}
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>web :</label>
                                                            <input v-model="editCvActivity.web" name="editCvActivity.web"  class="form-control"
                                                                   v-bind:class="{'is-invalid':errors.name}" />
                                                            <div v-if="(errors.name)" class="alert alert-warning">
                                                                {{errors.name}}
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <button v-on:click.prevent="editCV(editCvActivity, editCvActivity.id)" class="btn btn-primary mr-2">
                                                        Save</button>
                                                    <button v-on:click="addNewPerson(newPerson)" class="btn btn-outline-primary">
                                                        Clear</button>
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
        </form>

        <div v-if="(isAddPerson)"  class="container py-5" >
            <div class="row">
                <div  class="col-lg-6 mx-auto">


                    <div class="card ">
                        <div class="card-header">
                            <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                <form  id="add-movie" method="post" novalidate="true">
                                    <h1 class="mt-4">add new Person</h1>
                                    <div class="form-group">
                                        <label>firstName :</label>
                                        <input v-model="newPerson.firstName" class="form-control" name="newPerson.firstName"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>lastName :</label>
                                        <input v-model="newPerson.lastName" class="form-control" name="newPerson.lastName"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>web :</label>
                                        <input v-model="newPerson.web" class="form-control" name="newPerson.web"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="datetimepicker3">date</label>
                                        <div class='input-group date' id='datetimepicker3'>
                                            <input type='date' class="form-control" name="newPerson.date"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>userName :</label>
                                        <input v-model="newPerson.userName" class="form-control" name="newPerson.userName"
                                               v-bind:class="{'is-invalid':errors.name}" />
                                        <div v-if="(errors.name)" class="alert alert-warning">
                                            {{errors.name}}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>password :</label>
                                        <input v-model="newPerson.password" class="form-control" name="newPerson.password"
                                               v-bind:class="{'is-invalid':errors.year}" number/>
                                        <div v-if="(errors.year)" class="alert alert-warning">
                                            {{errors.year}}
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <button v-on:click.prevent="addNewPerson(newPerson)" class="btn btn-primary mr-2">
                                            Add Movie
                                        </button>
                                        <button v-on:click="" class="btn btn-outline-primary">
                                            Clear
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



<%--  show cv   --%>





<%-- add cv section --%>




<%--    edit Activity --%>










<script src="${app}" type="module"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

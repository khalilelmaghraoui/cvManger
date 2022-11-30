

<%@ include file="/WEB-INF/jsp/header.jsp"%>


<c:url var="home" value="/aaa" />
<c:url var="app" value="/app.js" />

<c:url var="show-movie" value="/api/cvs/" />

<div id="myApp">
    <div class="container">
        <h1>Gestion CV</h1>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#" v-on:click="register(true)">register</a>
<%--        <a class="navbar-brand" href="#" v-on:click="login(true)">login</a>--%>
    </nav>


<%--    edit Activity --%>

    <form  id="add-movie" method="post" novalidate="true">
        <h1 class="mt-4">Add New Movie</h1>
        <div class="form-group">
            <label>firstName :</label>
            <input v-model="person.firstName" class="form-control" name="person.firstName"
                   v-bind:class="{'is-invalid':errors.name}" />
            <div v-if="(errors.name)" class="alert alert-warning">
                {{errors.name}}
            </div>
        </div>
        <div class="form-group">
            <label>lastName :</label>
            <input v-model="person.lastName" class="form-control" name="person.lastName"
                   v-bind:class="{'is-invalid':errors.name}" />
            <div v-if="(errors.name)" class="alert alert-warning">
                {{errors.name}}
            </div>
        </div>
        <div class="form-group">
            <label>web :</label>
            <input v-model="person.web" class="form-control" name="person.web"
                   v-bind:class="{'is-invalid':errors.name}" />
            <div v-if="(errors.name)" class="alert alert-warning">
                {{errors.name}}
            </div>
        </div>
        <div class="form-group">
            <label for="datetimepicker3">date</label>
            <div class='input-group date' id='datetimepicker3'>
                <input type='date' class="form-control" name="person.date"/>
            </div>
        </div>
        <div class="form-group">
            <label>userName :</label>
            <input v-model="person.userName" class="form-control" name="person.userName"
                   v-bind:class="{'is-invalid':errors.name}" />
            <div v-if="(errors.name)" class="alert alert-warning">
                {{errors.name}}
            </div>
        </div>
        <div class="form-group">
            <label>password :</label>
            <input v-model="person.password" class="form-control" name="person.password"
                   v-bind:class="{'is-invalid':errors.year}" number />
            <div v-if="(errors.year)" class="alert alert-warning">
                {{errors.year}}
            </div>
        </div>

        <div class="form-group">
            <button v-on:click.prevent="register(person)" class="btn btn-primary mr-2">
                Add Movie</button>
            <button v-on:click="setRegister(true)" class="btn btn-outline-primary">
                Clear</button>
        </div>
    </form>





</div>





<script src="${app}" type="module"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

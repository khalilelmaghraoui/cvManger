

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
        <a class="navbar-brand badge badge-pill text-white badge-primary" href="#" v-on:click="setAddCv(true)">add new Cv</a>
        <a class="navbar-brand badge badge-pill  text-white badge-primary" href="#" v-on:click="setAddPerson(true)">add new person</a>
        <a class="navbar-brand badge badge-pill  text-white badge-danger pull-right" href="#" v-on:click="logout(true)">logout</a>
    </nav>



    <div  class="pageWrapper">

        <%--  show cv   --%>
        <%@ include file="/WEB-INF/jsp/personDetails.jsp"%>

        <%@ include file="/WEB-INF/jsp/activity.jsp"%>

         <%-- add cv section --%>
        <%@ include file="/WEB-INF/jsp/addActivity.jsp"%>

        <%--    edit Activity --%>
        <%@ include file="/WEB-INF/jsp/editActivity.jsp"%>

        <%--    add person  --%>
        <%@ include file="/WEB-INF/jsp/addPerson.jsp"%>
    </div>
























<script src="${app}" type="module"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

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
<div v-if="(isRegister)" class="container py-5">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                        <form id="add-movie" method="post" novalidate="true">
                            <h1 class="mt-4">Register</h1>
                            <div class="form-group">
                                <label>firstName :</label>
                                <input v-model="person.firstName" class="form-control" name="person.firstName"
                                       v-bind:class="{'is-invalid':errors.name}"/>
                                <div v-if="(errors.name)" class="alert alert-warning">
                                    {{errors.name}}
                                </div>
                            </div>
                            <div class="form-group">
                                <label>lastName :</label>
                                <input v-model="person.lastName" class="form-control" name="person.lastName"
                                       v-bind:class="{'is-invalid':errors.name}"/>
                                <div v-if="(errors.name)" class="alert alert-warning">
                                    {{errors.name}}
                                </div>
                            </div>
                            <div class="form-group">
                                <label>web :</label>
                                <input v-model="person.web" class="form-control" name="person.web"
                                       v-bind:class="{'is-invalid':errors.name}"/>
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
                                       v-bind:class="{'is-invalid':errors.name}"/>
                                <div v-if="(errors.name)" class="alert alert-warning">
                                    {{errors.name}}
                                </div>
                            </div>
                            <div class="form-group">
                                <label>password :</label>
                                <input v-model="person.password" class="form-control" name="person.password"
                                       v-bind:class="{'is-invalid':errors.year}" number/>
                                <div v-if="(errors.year)" class="alert alert-warning">
                                    {{errors.year}}
                                </div>
                            </div>

                            <div class="form-group">
                                <button v-on:click.prevent="register(person)" class="btn btn-primary mr-2">
                                    submit
                                </button>
                                <button v-on:click="setRegister(false)" class="btn btn-outline-primary">
                                    Login
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



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
                                                    <label for="datetimepicker3">Year: </label>
                                                    <div class='input-group date'>
                                                        <input id="datepicker" type='date' v-model="editCvActivity.year" name="editCvActivity.year" class="form-control"
                                                               v-bind:class="{'is-invalid':errors.name}"  v-model="editCvActivity.year" />
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
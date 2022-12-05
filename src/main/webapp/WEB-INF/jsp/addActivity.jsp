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
                                <input id="datepicker" type='date' v-model="cvActivities.year" name="cvActivities.year" class="form-control"
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
                                    Add section</button>
                                <button v-on:click.prevent="addCv(me.id,cvActivities)" class="btn btn-outline-primary">
                                    clear</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
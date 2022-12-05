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
                                            <h5 class="card-title"><span class="font-weight-light font-weight-bold">Title: </span>{{activity.title}}</h5>
                                            <h6 class="card-text text-muted"><span class="font-weight-light font-weight-bold">Year: </span>{{activity.year}}</h6>
                                            <p class="card-text text-muted"><span class="font-weight-light font-weight-bold">Description: </span>{{activity.description}}</p>
                                            <h6 class="card-subtitle mb-2 text-muted"><span class="font-weight-light font-weight-bold">Web: </span>{{activity.web}}</h6>
                                            <h6 class="card-subtitle mb-2 text-muted"><span class="font-weight-light font-weight-bold">Nature: </span> <span class="badge badge-secondary">{{activity.nature}}</span></h6>
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
                    <button  v-on:click="setAddCv(true)" type="button" class="btn btn-primary">add new section</button>
                </div>
            </div>
        </div>
    </div>
</div>

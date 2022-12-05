<div v-if="(isRegister == false)" class="container py-5">
    <div class="row">
        <div class="col-lg-6 mx-auto">


            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                        <form method="post" novalidate="true">
                            <h1 class="mt-4">Login</h1>


                            <div class="form-group">
                                <label>userName :</label>
                                <input v-model="person.userName" class="form-control" name="person.userName"
                                       v-bind:class="{'is-invalid':errors.name}"/>

                            </div>
                            <div class="form-group">
                                <label>password :</label>
                                <input type="password" v-model="person.password" class="form-control" name="person.password"
                                       v-bind:class="{'is-invalid':errors.year}" number/>

                            </div>

                            <div class="form-group">
                                <button v-on:click.prevent="login(person)" class="btn btn-primary mr-2">
                                    submit
                                </button>
                                <button v-on:click.prevent="setRegister(true)" class="btn btn-outline-primary">
                                    register
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




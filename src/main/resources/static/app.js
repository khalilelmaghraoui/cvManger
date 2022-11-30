

const myApp = {

    // Préparation des données
    data() {

        return {
            counter: 1,
            message: "Hello",
            list: [10, 20, 30],
            axios: null,
            cvs: [],
            activities: null,
            activitiesStatus:false,
            cv: null,
            user:null,
            editCvActivity: null,
            targetSection:null,
            errors: [],
            isAddCv: false,
            newCv: null,
            person: {},
            token: null,
            isRegister: null
        }
    },

    // Mise en place de l'application
    async mounted() {
        console.log("Mounted ");
        this.axios = await axios.create({
            baseURL: 'http://localhost:8080/',
            timeout: 1000,
            headers: {'Content-Type': 'application/json'},
        });



        this.getCvs();
    },

    methods: {
        // // Place pour les futures méthodes
        // incCounter: function(step) {
        //     console.log("increment counter");
        //     this.counter += step;
        //
        //     this.$refs.info.change(this.counter);
        // },
        //
        // getMovie: async function(id) {
        //     const resp = await axios.get('api/movies/' + id);
        //     return await resp.data;
        // },

        getCvs: function() {
            axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`;
            console.log(this.person);
            this.axios.get("api/cvs")
                .then(cvs => {
                    this.cvs = cvs.data;
                    for (let i = 0; i < this.cvs.length ; i++) {
                        this.activities = this.cvs[i];
                        console.log(this.activities);
                    }
                });
        },

        // deleteMovie: function(id) {
        //     this.axios.delete('api/movies/' + id)
        //         .then(r => {
        //             console.log("movie deleted");
        //             this.getMovies();
        //         });
        // },

        showCv: function(id) {
            this.token = window.localStorage.getItem("token");
            console.log(this.token);
            this.axios.get('api/person/'+ id + '/cv' , { 'headers': { 'Authorization': 'Bearer ' + this.token} })
                .then(r => {
                    console.log("cv fetched to show");
                    this.activities = r.data;
                    this.activitiesStatus=true;
                });

        },
        //
        editCV: async function(activity, id) {
            console.log("activity with id " + activity.id + " is set to be modified");
            this.editCvActivity = activity;
            console.log(this.editCvActivity);
            this.targetSection=id;
            console.log(this.targetSection)

        },
        //
        // populateMovies: function() {
        //     this.axios.patch('api/movies/')
        //         .then(r => {
        //             console.log("movies added");
        //             this.getMovies();
        //         });
        // },
        //
        // submitMovie: function(movie) {
        //     this.axios.put('api/movies/' + movie.id, movie)
        //         .then(errors => {
        //             this.errors = errors.data;
        //             this.getMovies();
        //         });
        // },
        //
        // clearEditable: function() {
        //     this.editable = null;
        // },
        //
        setAddCv: function(status) {
            console.log(this.isAddCv)
            this.isAddCv = status;
            this.newCv = {};
        },
        //
        addMovie: function(newCv) {
            this.axios.post('api/movies/', newCv)
                .then(errors => {
                    console.log("new movie added: ", newCv);
                    this.errors = errors.data;
                    this.getCvs();
                });
        },
        register: function(person) {
            person.roles= ["ROLE_ADMIN"];
            console.log(person);

            this.axios.post('/secu-users/signup', person)
                .then(res => {
                    console.log("done ", person);
                    this.token = res.data;

                }).then(res =>{
                window.localStorage.setItem("token", this.token);
                window.location.href = "/app";
            });
        },
        setRegister: function(status) {
            console.log(this.isAddCv)
            this.isRegister = status;
        },
        //
        // incrementCounter: function() {
        //     this.$refs.counter.increment();
        // }

    },

}

const app = Vue.createApp(myApp);
app.mount('#myApp');



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
            cvActivities: {},
            activitiesStatus:false,
            cv: {},
            user:null,
            editCvActivity: null,
            targetSection:null,
            errors: [],
            isAddCv: false,
            newCv: {},
            person: {},
            token: null,
            isRegister: null,
            personid:null,
            newPerson:{},
            isAddPerson:null,
            logged:window.localStorage.getItem("token"),
            isLogin:null,
            user:{},
            isRegister:false
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


        getCvs: function() {
            // axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`;
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
            // this.token = window.localStorage.getItem("token");
            // console.log(this.token);
            //{ 'headers': { 'Authorization': 'Bearer ' + this.token} }
            this.axios.get('api/person/'+ id + '/cv' )
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

        setAddCv: function(status) {
            console.log(this.isAddCv)
            this.isAddCv = status;
            this.newCv = {};
        },

        //
        addCv: function(personId,cvActivities) {
            personId=1;
            console.log("new movie added: ", cvActivities);
            this.axios.post("/api/person/"+personId+"/cv",cvActivities)
                .then(errors => {
                    console.log("new movie added: ", cvActivities);
                    this.errors = errors.data;
                    this.getCvs();
                });
        },
        setAddPerson: function(status) {
            console.log(this.isAddPerson)
            this.isAddPerson = status;
            this.newPerson = {};
        },
        addNewPerson: function(newPerson) {
            newPerson.roles = ["ROLE_ADMIN"];
           console.log("added Perosn ", newPerson);
            this.axios.post('/api/person/add', newPerson)
                .then(res => {
                    console.log("added Perosn ", newPerson);
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
                this.isRegister = false;
            });
        },
        setRegister: function(status) {
            console.log(this.isRegister)
            this.isRegister = status;
        },
        login: function(person) {
            console.log("done ", person);
            

            this.axios.post('/secu-users/login',person)
                .then(res => {
                    this.token = res.data;

                }).then(res =>{
                window.localStorage.setItem("token", this.token);
                this.logged = true;
                window.location.href = "/app";
            });
        },
        setLogin: function(status) {
            console.log(this.isAddCv)
            this.isRegister = status;
        },

    },

}

const app = Vue.createApp(myApp);
app.mount('#myApp');

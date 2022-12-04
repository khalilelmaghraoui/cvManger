

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
            token: window.localStorage.getItem("token"),
            isRegister: null,
            personid:null,
            newPerson:{},
            isAddPerson:null,
            logged:window.localStorage.getItem("token"),
            isLogin:null,
            user:{},
            isRegister:false,
            me:{}
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



        this.get();


    },

    methods: {


        get: function() {
            // axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`;
            console.log(document.URL.includes("/app"));
            if(this.token == null && document.URL.includes("/app")){
                window.location.href = "/auth";
            }

            if(this.token){
                this.getMyCv();
            }
            this.getCvs();


        },
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
        }, getMyCv: function() {
                console.log(this.person);
                console.log(this.token);

                this.axios.get("/secu-users/me", { 'headers': { 'Authorization': `Bearer ${this.token}` } } ).then(res =>{
                    this.me = res.data;
                    console.log( this.me);
                });
            },

        deleteActivity: function(id) {
            this.axios.delete('/api/activity/' + id, { 'headers': { 'Authorization': `Bearer ${this.token}` } } )
                .then(r => {
                    console.log("deleted");
                    this.showCv(this.me.id);
                });
        },

        showCv: function(id) {
            // this.token = window.localStorage.getItem("token");
            // console.log(this.token);
            //{ 'headers': { 'Authorization': 'Bearer ' + this.token} }
            this.axios.get('api/person/'+ id + '/cv')
                .then(r => {
                    console.log("cv fetched to show");
                    this.activities = r.data;
                    this.activitiesStatus=true;
                });

        },
        //
        editCV: async function(editCvActivity, id) {
            console.log("activity with id " + editCvActivity.id + " is set to be modified");
            this.editCvActivity = editCvActivity;
            console.log(this.editCvActivity);
            this.targetSection=id;
            console.log(this.targetSection)
            this.axios.post('/api/person/cv/' + id, editCvActivity,{ 'headers': { 'Authorization': `Bearer ${this.token}` } } )
                .then(r => {
                    console.log("deleted");
                    this.showCv(this.me.id);
                });

        },

        setAddCv: function(status) {
            console.log(this.isAddCv)
            this.isAddCv = status;
            this.newCv = {};
        },

        //
        addCv: function(personId,cvActivities) {
            console.log("new movie added: ", cvActivities);
            this.axios.post("/api/person/"+personId+"/cv",cvActivities, { 'headers': { 'Authorization': `Bearer ${this.token}` } })
                .then(errors => {
                    console.log("new movie added: ", cvActivities);
                    this.errors = errors.data;
                    this.showCv(this.me.id);
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
            this.axios.post('/api/person/add', newPerson, { 'headers': { 'Authorization': `Bearer ${this.token}` } })
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
            window.localStorage.setItem("token", this.token);

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
        logout: function(status) {
            console.log(this.isAddCv)
            this.token = null;
            window.localStorage.clear();
            window.location.href = "/home";
        },

    },

}

const app = Vue.createApp(myApp);
app.mount('#myApp');

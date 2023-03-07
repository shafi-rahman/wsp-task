<template>
    
    <div class="container mt-3">
    <div class="row text-white">
        <div class="col-sm-12 col-lg-8 col-xl-8 col-xxl-8 p-3">
            <div>
                <input class="form-control form-control-lg" type="text" v-model="keywords" placeholder="Search client information..." />
            </div>
            <div class="text-center mt-3" v-if="loaderIsActive"><h1><img src="../../../public/img/loader.gif" style="width: 50px;" /> Loading...</h1></div>
            <div class="list-group mt-1" v-if="results.length > 0">
                <a class="list-group-item list-group-item-action" v-for="result in results" :key="result.id" v-text="result.company_name" v-on:click="getClientInfo(result.id)"></a>
            </div>
            <div v-if="clientInfo != null" class="mt-3">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                    <button type="button" class="btn btn-danger" v-on:click="clear_all()">Clear</button>
                </div>
                <div class="card p-3">
                    
                    <div class="row g-0 mb-3">
                        <div class="col-md-4">
                            <img  :src="`img/upload/${clientInfo['client_info'][0]['company_logo']}`" class="img-fluid rounded-start">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title text-black" v-text="clientInfo['client_info'][0]['company_name']+' '+clientInfo['client_info'][0]['company_type']"></h5>
                                <p class="card-text"><small class="text-muted" v-text="clientInfo['client_info'][0]['created_at']"></small></p>
                                <p class="card-text text-black" v-text="clientInfo['client_info'][0]['company_description']"></p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">                        
                        <div class="row" v-if="clientInfo['address']">
                            <div class="col-sm-6 mb-3 mb-sm-3" v-for="company_address in clientInfo['address']">
                                <div class="card h-100">
                                <div class="card-body">
                                    <p class="card-text text-black mb-0" v-text="company_address['company_addres']['company_address']+', '+company_address['company_addres']['company_city']+' - '+company_address['company_addres']['company_contrary']"></p>
                                    <p class="card-text text-black mb-0" v-text="'Email: '+company_address['company_addres']['company_email']"></p>
                                    <p class="card-text text-black mb-3" v-text="'Phone: '+company_address['company_addres']['company_phone']"></p>
                                    
                                    <span class="card-text text-black" v-for="contact_person in company_address['contact_person']">
                                    <h6 class="card-title text-black mb-0 mt-2" v-text="contact_person['contact_person']+'('+contact_person['contact_person_post']+')'"></h6>
                                    <p class="card-text text-black mb-0" v-text="'Email: '+contact_person['contact_email']"></p>
                                    <p class="card-text text-black mb-0" v-text="' Phone: '+contact_person['contact_number']"></p>
                                    </span>
                                </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            
            </div>
        </div>
                
        <div class="col-sm-12 col-lg-4 col-xl-4 col-xxl-4"><img src="../../../public/img/img.svg" class="img-fluid mb-3 mb-lg-0" alt=""></div>
    </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            loaderIsActive: false,
            keywords: null,
            clientInfo: null,
            results: []
        };
    },

    watch: {
        keywords(after, before) {
            this.fetch();
        }
    },

    methods: {
        fetch() {
            if(this.keywords.trim()!=''){
                this.loaderIsActive = true;
            axios.get(window.url+'api/search_client', { params: { keywords: this.keywords } })
                .then(response => { this.results = response.data; this.loaderIsActive = false; } )
                .catch(error => { console.log(error); this.loaderIsActive = false; });
            } else {
                this.keywords = '';
                this.results = [];  
            }
        },
        getClientInfo(id){
            this.keywords = '';
            this.results = [];
            this.loaderIsActive = true;
            axios.get(window.url+'api/get_client_info', { params: { id: id } })
                .then(response => { 
                    this.clientInfo = response.data;
                    this.loaderIsActive = false;
                    console.log(this.clientInfo);
                    
                } )
                .catch(error => { console.log(error) });
        },
        clear_all(){
            this.keywords = "";
            this.results = [];
            this.clientInfo = null;
        }
    }
}
</script>
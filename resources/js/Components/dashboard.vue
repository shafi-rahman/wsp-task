<template>
<div class="container mt-3">
    <div class="row text-white">
        <div class="col-sm-12 col-lg-8 col-xl-8 col-xxl-8 p-3">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                <button type="button" class="btn btn-primary" v-on:click="add_client_info()">Create New</button>
            </div>
            <div id="delete_modal" v-if="showDeleteModale" style="z-index: 9999; position: fixed;">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-container">
                            <div class="modal-header">
                                <slot name="header">Warning!</slot>
                                <button type="button" class="btn-close" style="background-color: #ffffff; padding: 4px 4px;" data-bs-dismiss="modal" aria-label="Close" v-on:click="delete_modal_close()"></button>
                            </div>  

                            <div class="modal-body text-black">
                                Are you sure to delete this record?
                            </div>
                            <div class="pb-3 text-center">
                                <button type="button" class="btn btn-danger" v-if="clientInfo.client_id" v-on:click="delete_client_info()">Delete</button>&nbsp;
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div id="client_info_modal" v-if="showModale">

                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-container">
                        <div class="modal-header">
                            <slot name="header">Client Info</slot>
                            <button type="button" class="btn-close" style="background-color: #ffffff; padding: 4px 4px;" data-bs-dismiss="modal" aria-label="Close" v-on:click="client_info_modal_close()"></button>
                        </div>  

                        <div class="modal-body">
                            
                            <form>
                                <div class="mb-3 row">
                                    <label for="company_name" class="col-sm-3 col-form-label text-black">Company Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="company_name" v-model="clientInfo.company_name" placeholder="Company Name. e.g. Amazon">
                                        <label class="text-danger" v-if="clientInfoError.company_name">Company name is required</label>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="company_alias" class="col-sm-3 col-form-label text-black">Company Alias</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="company_alias" v-model="clientInfo.company_alias" placeholder="Company Alias. e.g. AZ">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="company_type" class="col-sm-3 col-form-label text-black">Company Type</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="company_type" v-model="clientInfo.company_type" placeholder="Company Type. e.g. Pvt.Ltd.">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="company_description" class="col-sm-3 col-form-label text-black">Company Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" placeholder="Company Description" v-model="clientInfo.company_description" id="company_description" style="height: 100px"></textarea>
                                    </div>
                                </div>

                                <hr class="border border-black border-2 opacity-50">
                                
                                <div class="mb-3 row">
                                    <label for="company_address" class="col-sm-3 col-form-label text-black">Company Address</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="company_address" v-model="clientInfo.company_address" placeholder="Address">
                                        <label class="text-danger" v-if="clientInfoError.company_address">Address is required</label>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="company_city" class="col-sm-3 col-form-label text-black">Location</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="company_city" v-model="clientInfo.company_city" placeholder="City">
                                        <label class="text-danger" v-if="clientInfoError.company_city">City is required</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="company_city" v-model="clientInfo.company_contrary" placeholder="Contrary">
                                        <label class="text-danger" v-if="clientInfoError.company_contrary">Contrary is required</label>
                                    </div>
                                </div>
                                
                                <hr class="border border-black border-2 opacity-50">
                                
                                <div class="mb-3 row">
                                    <label for="contact_person" class="col-sm-3 col-form-label text-black">Contact Person</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="contact_person" v-model="clientInfo.contact_person" placeholder="Name">
                                        <label class="text-danger" v-if="clientInfoError.contact_person">Contact person is required</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="contact_person" v-model="clientInfo.contact_person_post" placeholder="Post">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="contact_email" class="col-sm-3 col-form-label text-black">Contact Detais</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="contact_email" v-model="clientInfo.contact_email" placeholder="Email">
                                        <label class="text-danger" v-if="clientInfoError.contact_email">Email is required</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="contact_person" v-model="clientInfo.contact_number" placeholder="Number">
                                        <label class="text-danger" v-if="clientInfoError.contact_number">Number is required</label>
                                    </div>
                                </div>

                                <div class="mb-3 text-center">
                                    <button type="button" class="btn btn-primary" v-if="!clientInfo.client_id" v-on:click="store_client_info()">Store Info</button>&nbsp;
                                    <button type="button" class="btn btn-primary" v-if="clientInfo.client_id" v-on:click="update_client_info(clientInfo)">Update Info</button>&nbsp;
                                    <button type="button" class="btn btn-danger" v-if="clientInfo.client_id" v-on:click="remove_client_info(clientInfo)">Delete</button>&nbsp;
                                </div>
                            </form>

                        </div>
                        </div>
                    </div>
                </div>


            </div>
            <table class="table">
                <thead>
                    <tr class="text-white">
                        <th scope="col">#</th>
                        <th scope="col">Company Name</th>
                        <th scope="col">Company Alias</th>
                        <th scope="col">Company Type</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="text-white" v-if="results.length > 0" v-for="(result, index) in results" :key="result.id" >
                        <th>{{index+1}}</th>
                        <td>{{ result.company_name }}</td>
                        <td>{{ result.company_alias }}</td>
                        <td>{{ result.company_type }}</td>
                        <td><button type="button" class="btn btn-success" v-on:click="edit_client_info(result)">View Details</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="text-center mt-3" v-if="loaderIsActive"><h1><img src="../../../public/img/loader.gif" style="width: 50px;" /> Loading...</h1></div>
            
        </div>   
        <div class="col-sm-12 col-lg-4 col-xl-4 col-xxl-4"><img src="../../../public/img/img.svg" class="img-fluid mb-3 mb-lg-0" alt=""></div>
    </div>
</div>
</template>

<style>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 40rem;
  margin: 0px auto;
  padding: 0px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
  transition: all 0.3s ease;
  font-family: Helvetica, Arial, sans-serif;
}

.modal-header {
    background-color: #4a4970;
    padding: 15px 20px;
}

.modal-body {
    padding: 20px;
}

.modal-default-button {
  float: right;
}

/*
 * The following styles are auto-applied to elements with
 * transition="modal" when their visibility is toggled
 * by Vue.js.
 *
 * You can easily play with the modal transition by editing
 * these styles.
 */

.modal-enter-from, .modal-leave-to {
  opacity: 0;
}

.modal-enter-active .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

</style>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            loaderIsActive: false,
            showModale: false,
            showDeleteModale: false,
            clientInfo: {
                client_id: '',
                company_name: '',
                company_alias: '',
                company_type: '',
                company_description: '',
                company_address: '',
                company_city: '',
                company_contrary: '',
                contact_person: '',
                contact_person_post: '',
                contact_email: '',
                contact_number: ''
            },
            clientInfoError: {
                company_name: false,
                company_address: false,
                company_city: false,
                company_contrary: false,
                contact_person: false,
                contact_email: false,
                contact_number: false
            },
            results: []
        };
    },

    methods: {
        getClientList(){
            this.loaderIsActive = true;
            axios.get(window.url+'api/get_client_list')
                .then(response => { 
                    this.results = response.data;
                    this.loaderIsActive = false;
                    console.log(this.results);                    
                } )
                .catch(error => { console.log(error) });
        },
        add_client_info(){
            this.showModale = true; 
            this.clientInfo = {
                client_id: '',
                company_addres_id: '',
                company_contact_person_id: '',
                company_name: '',
                company_alias: '',
                company_type: '',
                company_description: '',
                company_address: '',
                company_city: '',
                company_contrary: '',
                contact_person: '',
                contact_person_post: '',
                contact_email: '',
                contact_number: ''
            },
            this.clientInfoError = {
                company_name: false,
                company_address: false,
                company_city: false,
                company_contrary: false,
                contact_person: false,
                contact_email: false,
                contact_number: false
            }
        },
        update_client_info(){
            this.clientInfo.company_name =='' ? this.clientInfoError.company_name=true : this.clientInfoError.company_name=false
            this.clientInfo.company_address =='' ? this.clientInfoError.company_address=true : this.clientInfoError.company_address=false
            this.clientInfo.company_city =='' ? this.clientInfoError.company_city=true : this.clientInfoError.company_city=false
            this.clientInfo.company_contrary =='' ? this.clientInfoError.company_contrary=true : this.clientInfoError.company_contrary=false
            this.clientInfo.contact_person =='' ? this.clientInfoError.contact_person=true : this.clientInfoError.contact_person=false
            this.clientInfo.contact_email =='' ? this.clientInfoError.contact_email=true : this.clientInfoError.contact_email=false
            this.clientInfo.contact_number =='' ? this.clientInfoError.contact_number=true : this.clientInfoError.contact_number=false

            if( this.clientInfo.company_name && this.clientInfo.company_address && this.clientInfo.company_city && this.clientInfo.company_contrary && this.clientInfo.contact_person && this.clientInfo.contact_email && this.clientInfo.contact_number ){
                axios.post(window.url+'api/update_client_info/'+this.clientInfo.client_id+'/'+this.clientInfo.company_addres_id+'/'+this.clientInfo.company_contact_person_id,  this.clientInfo)
                .then(response => { 
                    console.log(response.data);
                    if(response.data.success){
                        this.getClientList();
                        this.client_info_modal_close();
                    } })
                .catch(errors => { console.log(errors); });

            }
        },
        delete_client_info(){
            axios.post(window.url+'api/delete_client_info/'+this.clientInfo.client_id+'/'+this.clientInfo.company_addres_id+'/'+this.clientInfo.company_contact_person_id,  this.clientInfo)
                .then(response => { 
                    console.log(response.data);
                    if(response.data.success){
                        this.getClientList();
                        this.client_info_modal_close();
                        this.delete_modal_close();
                    } })
                .catch(errors => { console.log(errors); });
        },
        edit_client_info(clientInfo){
            this.showModale = true; 
            this.clientInfo = {
                client_id: clientInfo.client_id,                
                company_addres_id: clientInfo.company_addres_id,
                company_contact_person_id: clientInfo.company_contact_person_id,
                company_name: clientInfo.company_name,
                company_alias: clientInfo.company_alias,
                company_type: clientInfo.company_type,
                company_description: clientInfo.company_description,
                company_address: clientInfo.company_address,
                company_city: clientInfo.company_city,
                company_contrary: clientInfo.company_contrary,
                contact_person: clientInfo.contact_person,
                contact_person_post: clientInfo.contact_person_post,
                contact_email: clientInfo.contact_email,
                contact_number: clientInfo.contact_number,
            },
            this.clientInfoError = {
                company_name: false,
                company_address: false,
                company_city: false,
                company_contrary: false,
                contact_person: false,
                contact_email: false,
                contact_number: false
            }
            
        },
        store_client_info(){
            this.clientInfo.company_name =='' ? this.clientInfoError.company_name=true : this.clientInfoError.company_name=false
            this.clientInfo.company_address =='' ? this.clientInfoError.company_address=true : this.clientInfoError.company_address=false
            this.clientInfo.company_city =='' ? this.clientInfoError.company_city=true : this.clientInfoError.company_city=false
            this.clientInfo.company_contrary =='' ? this.clientInfoError.company_contrary=true : this.clientInfoError.company_contrary=false
            this.clientInfo.contact_person =='' ? this.clientInfoError.contact_person=true : this.clientInfoError.contact_person=false
            this.clientInfo.contact_email =='' ? this.clientInfoError.contact_email=true : this.clientInfoError.contact_email=false
            this.clientInfo.contact_number =='' ? this.clientInfoError.contact_number=true : this.clientInfoError.contact_number=false

            if( this.clientInfo.company_name && this.clientInfo.company_address && this.clientInfo.company_city && this.clientInfo.company_contrary && this.clientInfo.contact_person && this.clientInfo.contact_email && this.clientInfo.contact_number ){
                axios.post(window.url+'api/store_client_info', this.clientInfo)
                .then(response => { 
                    if(response.data.success){
                        this.getClientList();
                        this.client_info_modal_close();
                    } })
                .catch(errors => { console.log(errors); });

            }
        },
        client_info_modal_close(){
            this.showModale = false; 
        }, 
        remove_client_info(){
            this.showDeleteModale = true;
        },
        delete_modal_close(){
            this.showDeleteModale = false; 
        }
    },
    beforeMount() {
        this.getClientList()
    }
}
</script>
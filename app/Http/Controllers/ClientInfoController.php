<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ClientInfo;
use Illuminate\Support\Facades\DB;


class ClientInfoController extends Controller
{
    public function search_data(Request $request) {
        return response()->json( ClientInfo::where('company_name', 'LIKE','%'.$request->keywords.'%')->get() );
    }

    public function get_client_info(Request $request) {
        $clientInfo['client_info'] = ClientInfo::where('id', $request->id)->get();
        $company_addres = DB::table('company_addres')->where('client_info_id', $clientInfo['client_info'][0]['id'])->get();
        if(!empty($company_addres)){
            foreach($company_addres as $k=>$v){
              $clientInfo['address'][$k]['company_addres'] = $v;
              $clientInfo['address'][$k]['contact_person'] = DB::table('company_contact_person')->where('company_addres_id', $v->id)->get();
            }
        }
        return response()->json( $clientInfo );
    }

    public function get_client_list(){
        $data = DB::table('client_infos')
            ->join('company_addres', 'client_infos.id', '=', 'company_addres.client_info_id')
            ->join('company_contact_person', 'company_addres.id', '=', 'company_contact_person.company_addres_id')
            ->select('client_infos.id as client_id', 'client_infos.*', 'company_addres.id as company_addres_id', 'company_addres.*', 'company_contact_person.id as company_contact_person_id', 'company_contact_person.*')
            ->get();
        return response()->json( $data );
    }

    public function store_client_info(Request $request){
        $success = false;
        
        DB::beginTransaction();

        try {
            $id = ClientInfo::create([
                'company_name' => $request->company_name,
                'company_alias' => $request->company_alias,
                'company_type' => $request->company_type,
                'company_description' => $request->company_description
            ])->id;
    
            $aid = DB::table('company_addres')->insertGetId([
                'client_info_id' => $id,
                'company_address' => $request->company_address,
                'company_city' => $request->company_city,
                'company_contrary' => $request->company_contrary
            ]);
    
            DB::table('company_contact_person')->insert([
                'company_addres_id' => $aid,
                'contact_person' => $request->contact_person,
                'contact_person_post' => $request->contact_person_post,
                'contact_number' => $request->contact_number,
                'contact_email' => $request->contact_email
            ]);
            $success = true;
            DB::commit();
        } catch (\Throwable $e) {
            DB::rollback();
            $success = false;
    
            $id = 0;
            throw $e;

        }

        return response()->json( array('success' => $success, 'last_insert_id' => $id), 200 );
    }

    public function update_client_info(Request $request, $client_id, $company_addres_id, $company_contact_person_id){
        $success = false;

        // return response()->json( array('success' => $request, 'client_id'=>$client_id, 'company_addres_id'=>$company_addres_id, 'company_contact_person_id'=>$company_contact_person_id), 200 );
        
        DB::beginTransaction();

        try {
            ClientInfo::where('id', $client_id)->update([
                'company_name' => $request->company_name,
                'company_alias' => $request->company_alias,
                'company_type' => $request->company_type,
                'company_description' => $request->company_description
            ]);
    
            $aid = DB::table('company_addres')->where('id', $company_addres_id)->update([
                'company_address' => $request->company_address,
                'company_city' => $request->company_city,
                'company_contrary' => $request->company_contrary
            ]);
    
            DB::table('company_contact_person')->where('id', $company_contact_person_id)->update([
                'contact_person' => $request->contact_person,
                'contact_person_post' => $request->contact_person_post,
                'contact_number' => $request->contact_number,
                'contact_email' => $request->contact_email
            ]);
            $success = true;
            DB::commit();
        } catch (\Throwable $e) {
            DB::rollback();
            $success = false;
            $id = 0;
            throw $e;

        }

        return response()->json( array('success' => $success), 200 );
    }
    public function delete_client_info(Request $request, $client_id, $company_addres_id, $company_contact_person_id){
        $success = false;
        DB::beginTransaction();

        try {
            DB::table('client_infos')->where('id', $client_id)->delete();
            DB::table('company_addres')->where('id', $company_addres_id)->delete();
            DB::table('company_contact_person')->where('id', $company_contact_person_id)->delete();
            
            $success = true;
            DB::commit();
        } catch (\Throwable $e) {
            DB::rollback();
            $success = false;
            $id = 0;
            throw $e;

        }

        return response()->json( array('success' => $success), 200 );
    }
}

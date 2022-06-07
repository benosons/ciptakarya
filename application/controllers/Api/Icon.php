<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Icon extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()
	{
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
		parent::__construct();
		// $this->load->model('Model_auth');
		$this->load->model('Model_data');
		// $this->logs = $this->session->all_userdata();
		// $this->logged = $this->session->userdata('userLogged');
		// $this->kategori = $this->session->userdata('kategori');
		// $this->role = $this->session->userdata('role');
		// $this->name = $this->session->userdata('name');
		// $this->foto = $this->session->userdata('foto');
		// $this->content = array(
		// 	"base_url" => base_url(),
		// 	"logs" => $this->session->all_userdata(),
		// 	"role" => $this->role,
		// 	"name" => $this->name,
		// 	"foto" => $this->foto
		// );
	}

    public function get()
    {
        $id = $_GET['id'];
        if ($id) {
            $icon = $this->Model_data->getalldata('data_icon',['id'=>$id]);
            foreach($icon as $key => $value){
                $files = $this->Model_data->getfile($value->id, 'icon');
                $fl = [];
                foreach ($files as $key => $value) {
                    $path = $_SERVER['HTTP_HOST'].'/ciptakarya/'.$value->path.'/'.$value->filename;
                    array_push($fl, $path);
                }
                if(!empty($fl)){
                    $icon[$key]->files = $fl[0];
                }
            }
            if (!empty($icon)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $icon
                );
                echo json_encode($result);
            }else{
                $result = array(
                    'status' => 500,
                    'message' => 'Data tidak ditemukan !'
                );
                echo json_encode($result);
            }
        }else{
            $offset = $_GET['offset'];
            $limit = $_GET['limit'];
            $type = $_GET['type'];
            $where = array();
            if ($type) {
                $where['create_by'] = $type;
                $icon = $this->Model_data->getalldata('data_icon',$where,$limit,$offset);
            }else{
                $icon = $this->Model_data->getalldata('data_icon',NULL,$limit,$offset);
            }
            foreach($icon as $key => $value){
                $files = $this->Model_data->getfile($value->id, 'icon');
                $fl = [];
                foreach ($files as $key => $value) {
                    $path = $_SERVER['HTTP_HOST'].'/ciptakarya/'.$value->path.'/'.$value->filename;
                    array_push($fl, $path);
                }
                if(!empty($fl)){
                    $icon[$key]->files = $fl[0];
                }
            }
            $totalRows = $this->Model_data->getcountdata('data_icon');
            if (!empty($icon)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $icon,
                    'totalRows' => $totalRows
                );
                echo json_encode($result);
            }else{
                $result = array(
                    'status' => 500,
                    'message' => 'Data tidak ditemukan !'
                );
                echo json_encode($result);
            }
        }
    }
}

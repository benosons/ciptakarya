<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Banner extends CI_Controller {

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
            $banner = $this->Model_data->getalldata('data_banner',['id'=>$id]);
            
            if (!empty($banner)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $banner
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
            $param = $_GET['param'];
            $where = array();
            if ($type) {
                $where['create_by'] = $type;
                $where['param'] = $param;
                $banner = $this->Model_data->getalldata('data_banner',$where,$limit,$offset);
            }else{
                $banner = $this->Model_data->getalldata('data_banner',NULL,$limit,$offset);
            }
            foreach ($banner as $key => $value) {
                $files = $this->Model_data->getfile($value->id, 'banner');
                $fl = [];
                foreach ($files as $key => $value) {
                    $path = $_SERVER['HTTP_HOST'].'/ciptakarya/.'.$value->path.'/'.$value->filename;
                    array_push($fl, $path);
                }
                if(!empty($fl)){
                    $banner[$key]->files = $fl;
                }
            }
            $totalRows = $this->Model_data->getcountdata('data_banner');
            if (!empty($banner)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $banner,
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

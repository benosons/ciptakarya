<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Bukuprofil extends CI_Controller
{

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
        if ($method == "OPTIONS") {
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
            $bukuprofil = $this->Model_data->getalldata('data_buku_profil', ['id' => $id]);
            foreach ($bukuprofil as $key => $value) {
                $files = $this->Model_data->getfile($value->id, 'laporan');
                if (!empty($files)) {
                    $bukuprofil[$key]->files = $files;
                }
            }
            if (!empty($bukuprofil)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $bukuprofil
                );
                echo json_encode($result);
            } else {
                $result = array(
                    'status' => 500,
                    'message' => 'Data tidak ditemukan !'
                );
                echo json_encode($result);
            }
        } else {


            $offset = $_GET['offset'];
            $limit = $_GET['limit'];
            $satker = $_GET['satker'];
            $kategori = $_GET['kategori'];
            $where = array();
            if ($satker) {
                $where['create_by'] = $satker;
            }

            if ($kategori) {
                $where['kategori'] = $kategori;
            }

            if (!empty($where)) {
                $bukuprofil = $this->Model_data->getalldata('data_buku_profil', $where, $limit, $offset);
            } else {
                $bukuprofil = $this->Model_data->getalldata('data_buku_profil', NULL, $limit, $offset);
            }
            foreach ($bukuprofil as $key => $value) {
                $files = $this->Model_data->getfile($value->id, 'laporan');
                $fl = [];
                if (isset($value->kategori)) {
                    $kat = $this->Model_data->getwhere("*", "kategori_laporan", "id = '$value->kategori'");
                    $bukuprofil[$key]->kategori_name = $kat[0]->nama;
                }
                foreach ($files as $key => $value) {
                    $path = $_SERVER['HTTP_HOST'] . '/ciptakarya/' . $value->path . '/' . $value->filename;
                    array_push($fl, $path);
                }
                if (!empty($fl)) {
                    $bukuprofil[$key]->files = $fl[0];
                }
            }
            $totalRows = $this->Model_data->getcountdata('data_buku_profil');
            if (!empty($bukuprofil)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $bukuprofil,
                    'totalRows' => $totalRows
                );
                echo json_encode($result);
            } else {
                $result = array(
                    'status' => 500,
                    'message' => 'Data tidak ditemukan !'
                );
                echo json_encode($result);
            }
        }
    }
    public function getkategori()
    {
        $id = $_GET['id'];
        if ($id) {
            $kategori = $this->Model_data->getalldata('kategori_profile', ['id' => $id]);
            if (!empty($kategori)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $kategori
                );
                echo json_encode($result);
            } else {
                $result = array(
                    'status' => 500,
                    'message' => 'Data tidak ditemukan !'
                );
                echo json_encode($result);
            }
        } else {
            $offset = $_GET['offset'];
            $limit = $_GET['limit'];
            $kategori = $this->Model_data->getalldata('kategori_profile', NULL, $limit, $offset);
            $totalRows = $this->Model_data->getcountdata('kategori_profile');
            if (!empty($kategori)) {
                $result = array(
                    'status' => 200,
                    'message' => 'Data Berhasil ditemukan !',
                    'data' => $kategori,
                    'totalRows' => $totalRows
                );
                echo json_encode($result);
            } else {
                $result = array(
                    'status' => 500,
                    'message' => 'Data tidak ditemukan !'
                );
                echo json_encode($result);
            }
        }
    }
}

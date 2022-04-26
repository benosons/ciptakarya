<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jsondata extends CI_Controller {

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
		parent::__construct();
		$this->load->model('Model_data');
		$this->load->model('Model_sys');
		$this->logs = $this->session->all_userdata();
		$this->logged = $this->session->userdata('userLogged');
		$this->kategori = $this->session->userdata('kategori');
		$this->role = $this->session->userdata('role');
		$this->username = $this->session->userdata('username');
		$this->kotaKab = $this->session->userdata('kotaKab');
		$this->name = $this->session->userdata('name');
		$this->foto = $this->session->userdata('foto');
		$this->id 	= $this->session->userdata('id');
		$this->notelp 	= $this->session->userdata('notelp');
		$this->email 	= $this->session->userdata('email');
		$this->content = array(
			"base_url" => base_url(),
			"logs" => $this->session->all_userdata(),
			"username" => $this->username,
			"role" => $this->role,
			"name" => $this->name,
			"foto" => $this->foto,
			"kategori" => $this->kategori,
			"notelp" => $this->notelp,
			"email" => $this->email,
			"id" => $this->id
		);

		$this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		$this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");

	}


	public function savepengajuan()
	{
		$params = (object)$this->input->post();
		// // remove the part that we don't need from the provided image and decode it
		// $data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));

		// $filepath = "assets/dokumen/gambar/user/".$params->username.".png"; // or image.jpg
		// chmod($filepath,0777);
		// file_put_contents($filepath,$data);
		// $params->foto = $filepath;

		$params->create_by	 = $this->session->userdata('id');
		$params->update_by	 = $this->session->userdata('id');
		$params->create_date = date("Y-m-d H:i:s");
		$params->update_date = date("Y-m-d H:i:s");
		$params->status 	 = 1;
		$data = $params;


		$result = $this->Model_data->savepengajuan($data);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function getdata()
	{
		try
		{
				
				$post = (object)$this->input->post();
				$param =  $post->param;
				$type =  $post->type;
				
				$result = $this->Model_data->getdata($param, $this->session->userdata('id'),  $this->session->userdata('role'));
				foreach ($result as $key => $value) {
					$files = $this->Model_data->getfile($value->id, $type);
					if(!empty($files)){
						$result[$key]->files = $files;
					}
					// if(!file_exists(base_url().$value->img)){
					// 	$result[$key]->img = base_url().'assets/img/users/default.jpg';
					// }
					if(isset($value->create_by)){
						$user = $this->Model_data->getwhere("*", "muser", "id = '$value->create_by'");
						$result[$key]->username = $user[0]->name;
					}
					
				}
					if($result){
						$response = [
							'status'   => 'sukses',
							'code'     => '1',
							'data' 		 => $result
						];
					}else{
						$response = [
						    'status'   => 'gagal',
						    'code'     => '0',
						    'data'     => $result,
						];
					}

				header('Content-Type: application/json');
				echo json_encode($response);
				exit;
			}
		catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function getdatausers()
	{
		try
		{
				
				$post = (object)$this->input->post();
				$param =  $post->param;
				
				$result = $this->Model_sys->getdatausers($param);
				foreach ($result as $key => $value) {
					if(!file_exists($value->img)){
						$result[$key]->img = base_url().'assets/img/users/default.jpg';
					}
					
				}
					if($result){
						$response = [
							'status'   => 'sukses',
							'code'     => '1',
							'data' 		 => $result
						];
					}else{
						$response = [
						    'status'   => 'gagal',
						    'code'     => '0',
						    'data'     => 'tidak ada data',
						];
					}

				header('Content-Type: application/json');
				echo json_encode($response);
				exit;
			}
		catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function updateUser()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		if($params->img){
			$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
			$filepath = "assets/dokumen/gambar/user/".$params->username.".png"; // or image.jpg
			chmod($filepath,0777);
			file_put_contents($filepath,$data);
			$params->foto = $filepath;
		}

		$data = $this->Model_sys->update($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function deleteUser()
	{

		$params = (object)$this->input->post();
		$this->Model_sys->delete($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deleteberita()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deleteberita($params);
		$this->Model_data->deletefile($params);
		unlink($params->path);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deleteposter()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deleteposter($params);
		$this->Model_data->deletefile($params);
		unlink($params->path);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}
	public function deletebanner()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletebanner($params);
		$this->Model_data->deletefile($params);
		unlink($params->path);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deletetext()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletetext($params);
		$this->Model_data->deletefile($params);
		unlink($params->path);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deletebuku()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletebuku($params);
		$data1 = new stdClass;
		$data1->id_file = $params->id_file1;
		$this->Model_data->deletefile($data1);
		unlink($params->path1);
		$data2 = new stdClass;
		$data2->id_file = $params->id_file2;
		$this->Model_data->deletefile($data2);
		unlink($params->path2);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deletelaporan()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletelaporan($params);
		$data1 = new stdClass;
		$data1->id_file = $params->id_file1;
		$this->Model_data->deletefile($data1);
		unlink($params->path1);
		$data2 = new stdClass;
		$data2->id_file = $params->id_file2;
		$this->Model_data->deletefile($data2);
		unlink($params->path2);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deletefoto()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletefoto($params);
		$this->Model_data->deletefile($params);
		unlink($params->path);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deletekategori()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletekategori($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deletevideo()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deletevideo($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function deleteagenda()
	{

		$params = (object)$this->input->post();
		
		$this->Model_data->deleteagenda($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));
	}

	public function updatedatatext()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_at = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedatatext($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/file/text';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				$data_file = [
						'id' => $params->idfile,
						'type' => 'banner',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatedatabuku()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedatabuku($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/file/buku';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				if (i == 0) {
					$data_file = [
						'id' => $params->idfile2,
						'type' => 'buku',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
				}else if(i == 1){
					$data_file = [
						'id' => $params->idfile2,
						'type' => 'buku',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
				}
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatedatalaporan()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedatalaporan($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/file/laporan';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				if (i == 0) {
					$data_file = [
						'id' => $params->idfile2,
						'type' => 'laporan',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
				}else if(i == 1){
					$data_file = [
						'id' => $params->idfile2,
						'type' => 'laporan',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
				}
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatedatabanner()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedatabanner($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/galeri/banner';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				$data_file = [
						'id' => $params->idfile,
						'type' => 'banner',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function updatedatagrafis()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedatagrafis($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/galeri/infografis';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				$data_file = [
						'id' => $params->idfile,
						'type' => 'banner',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatedataberita()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedataberita($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/berita';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				$data_file = [
						'id' => $params->idfile,
						'type' => 'berita',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function updatedataposter()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatedataposter($params);

		if(!empty($_FILES)){
			$files = $_FILES['files'];
			$count = count($_FILES['files']['name']);
			$public		= FCPATH.'public';
			$tipe		= './assets/upload/galeri/poster';
			$date 		= date('Y/m/d');
		
			for ($i=0; $i < $count; $i++) { 

				$name = $files['name'][$i];
				$file = $files['tmp_name'][$i];
				$type = $files['type'][$i];
				$size = $files['size'][$i];
				
				$path = $tipe.'/'.$date;
				if (!is_dir($path)) {
					mkdir($path, 0777, TRUE);
				}

				
				move_uploaded_file($file, $path.'/'.$name);

				$data_file = [
						'id' => $params->idfile,
						'type' => 'poster',
						'path' => $path,
						'size' => $size,
						'extension' => $type,
						'filename' => $name,
						'create_date' => date("Y-m-d H:i:s"),
						'update_date' => date("Y-m-d H:i:s")
					];
					$this->Model_data->updatefile($data_file);
				}
		}

		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function hitungAll(){

		$update = $this->Model_sys->hitungAll();
		header('Content-Type: application/json');
		echo json_encode($update);
	}

	public function listdatabanner()
	{
		if ($this->logged && $this->role == '10')
		{
			$params = $columns = $totalRecords = $data = array();
			$params = $_REQUEST;
			$postData = $this->input->post('param');

			$query = $this->Model_sys->listbanner($postData);

			$x = 0;
			$i=0;
			foreach ($query as $proses) {
				$x++;
				$row = array();
				$row['id'] = (!empty($proses->id) ? $proses->id : "NULL");
				$row['judul'] = (!empty($proses->judul) ? $proses->judul : "NULL");
				$row['deskripsi'] = (!empty($proses->deskripsi) ? $proses->deskripsi : "NULL");
				$row['foto'] = (!empty($proses->foto) ? $proses->foto : "assets/dokumen/gambar/user/default.jpg");
				$row['status'] = (!empty($proses->status) ? $proses->status : "NULL");
				$row['create_by'] = (!empty($proses->create_by) ? $proses->create_by : "NULL");
				$row['create_date'] = (!empty($proses->create_date) ? $proses->create_date : "NULL");
				$row['update_date'] = (!empty($proses->update_date) ? $proses->update_date : "NULL");

				$data[] = $row;
			}
			header('Content-Type: application/json');
			echo json_encode($data);
		}else{
			redirect("dashboard");
		}

	}

	public function updatefoto()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatefoto($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updateberita()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updateberita($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function updateposter()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updateposter($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function updatevideo()
	{

		$params = (object)$this->input->post();
		$params->update_by	 = $this->session->userdata('id');
		$params->update_date = date("Y-m-d H:i:s");
		$data = $this->Model_data->updatevideo($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function listdatabanneruser()
	{

			$params = $columns = $totalRecords = $data = array();
			$params = $_REQUEST;
			$postData = $this->input->post('param');

			$query = $this->Model_sys->listbanner(1);

			$x = 0;
			$i=0;
			foreach ($query as $proses) {
				$x++;
				$row = array();
				$row['id'] = (!empty($proses->id) ? $proses->id : "NULL");
				$row['judul'] = (!empty($proses->judul) ? $proses->judul : "NULL");
				$row['deskripsi'] = (!empty($proses->deskripsi) ? $proses->deskripsi : "NULL");
				$row['foto'] = (!empty($proses->foto) ? $proses->foto : "assets/dokumen/gambar/user/default.jpg");
				$row['status'] = (!empty($proses->status) ? $proses->status : "NULL");
				$row['create_by'] = (!empty($proses->create_by) ? $proses->create_by : "NULL");
				$row['create_date'] = (!empty($proses->create_date) ? $proses->create_date : "NULL");
				$row['update_date'] = (!empty($proses->update_date) ? $proses->update_date : "NULL");

				$data[] = $row;
			}
			header('Content-Type: application/json');
			echo json_encode($data);

	}

	public function loadsetting()
	{

			$params = $columns = $totalRecords = $data = array();
			$params = $_REQUEST;
			$postData = $this->input->post('param');

			$query = $this->Model_sys->loadsetting(1);

			$x = 0;
			$i=0;
			foreach ($query as $proses) {
				$x++;
				$row = array();

				$row['id'] = (!empty($proses->id) ? $proses->id : "NULL");
				$row['logo'] = (!empty($proses->logo) ? $proses->logo : "assets/dokumen/gambar/user/default.jpg");
				$row['nama'] = (!empty($proses->nama) ? $proses->nama : "NULL");
				$row['deskripsi'] = (!empty($proses->deskripsi) ? $proses->deskripsi : "NULL");
				$row['alamat'] = (!empty($proses->alamat) ? $proses->alamat : "NULL");
				$row['email'] = (!empty($proses->email) ? $proses->email : "NULL");
				$row['notlp'] = (!empty($proses->notlp) ? $proses->notlp : "NULL");
				$row['instagram'] = (!empty($proses->instagram) ? $proses->instagram : "NULL");
				$row['twitter'] = (!empty($proses->twitter) ? $proses->twitter : "NULL");
				$row['facebook'] = (!empty($proses->facebook) ? $proses->facebook : "NULL");
				$row['copyright'] = (!empty($proses->copyright) ? $proses->copyright : "NULL");

				$data[] = $row;
			}
			header('Content-Type: application/json');
			echo json_encode($data);

	}

	public function simpansetting()
	{

		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/user/".$params->username.".png"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }

		$data = $this->Model_sys->updatesetting($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function savebanner()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));

		$filepath = "assets/dokumen/gambar/banner/".str_replace(" ","_",$params->judul).".jpg"; // or image.jpg
		chmod($filepath,0777);
		file_put_contents($filepath,$data);
		$params->foto = $filepath;

		$data = $this->Model_sys->savebanner($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	public function updategrafis()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/banner/".$params->username.".jpg"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }
		$params->update_by = $this->session->userdata('id');
		$params->update_date = date('Y-m-d H:i:s');

		$data = $this->Model_data->updategrafis($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updateagenda()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/banner/".$params->username.".jpg"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }\
		$params->update_by = $this->session->userdata('id');
		$params->update_date = date('Y-m-d H:i:s');

		$data = $this->Model_data->updateagenda($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatetext()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/banner/".$params->username.".jpg"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }
		$params->update_by = $this->session->userdata('id');
		$params->update_date = date('Y-m-d H:i:s');

		$data = $this->Model_data->updatetext($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatebanner()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/banner/".$params->username.".jpg"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }
		$params->update_by = $this->session->userdata('id');
		$params->update_date = date('Y-m-d H:i:s');

		$data = $this->Model_data->updatebanner($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatebuku()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/banner/".$params->username.".jpg"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }
		$params->update_by = $this->session->userdata('id');
		$params->update_date = date('Y-m-d H:i:s');

		$data = $this->Model_data->updatebuku($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}
	public function updatelaporan()
	{
		$params = (object)$this->input->post();
		// remove the part that we don't need from the provided image and decode it
		// if($params->img){
		// 	$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
		// 	$filepath = "assets/dokumen/gambar/banner/".$params->username.".jpg"; // or image.jpg
		// 	chmod($filepath,0777);
		// 	file_put_contents($filepath,$data);
		// 	$params->foto = $filepath;
		// }
		$params->update_by = $this->session->userdata('id');
		$params->update_date = date('Y-m-d H:i:s');

		$data = $this->Model_data->updatelaporan($params);
		header('Content-Type: application/json');
		echo json_encode(array("status" => TRUE));

	}

	// public function deletebanner()
	// {

	// 	$params = (object)$this->input->post();
	// 	$path = $params->path;

	// 	$files = glob($path.'*'); // get all file names
	// 	foreach($files as $file){ // iterate files
	// 	  if(is_file($file))
	// 	    unlink($file); // delete file
	// 	    //echo $file.'file deleted';
	// 	}
		
	// 	$this->Model_sys->deletebanner($params);
	// 	header('Content-Type: application/json');
	// 	echo json_encode(array("status" => TRUE));
	// }

	public function updateprofile()
	{

		$params = (object)$this->input->post();
		$check = $this->db->get_where("muser", array("username" => $params->username,"password" => md5($params->validasi)));
		if($check->num_rows() > 0){
			if($params->img){
				$data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $params->img));
				$filepath = "assets/dokumen/gambar/user/".$params->username.".png"; // or image.jpg
				chmod($filepath,0777);
				file_put_contents($filepath,$data);
				$params->foto = $filepath;
			}

			$data = $this->Model_sys->updateprofile($params);
			header('Content-Type: application/json');
			echo json_encode(array("status" => TRUE));
		}else{
			header('Content-Type: application/json');
			echo json_encode(array("status" => FALSE));
		}

	}

	public function savedataberita(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_berita', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/berita';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'berita',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}

	public function savedataprofile(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_profile', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/profile';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'profile',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function savedataagenda(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_agenda', $params);

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
			];
			header('Content-Type: application/json');
			echo json_encode($response);
			exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function updatedataagenda(){
		try
		{

			$params = (object)$this->input->post();
			$params->update_by	 = $this->session->userdata('id');
			$params->update_date = date("Y-m-d H:i:s");
			
			$result = $this->Model_data->updatedataagenda($params);

			echo json_encode(array("status" => TRUE));
			exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}

	public function savedatabalai(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_balai', $params);

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
			];
			header('Content-Type: application/json');
			echo json_encode($response);
			exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}

	public function savedatabuku(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_buku_profil', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/file/buku';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'buku',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function savedatalaporan(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_laporan', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/file/laporan';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'laporan',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function savedatabanner(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_banner', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/galeri/banner';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'banner',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function savedatatext(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_text', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/file/text';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'text',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function savedatagrafis(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_grafis', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/galeri/infografis';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'grafis',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function savedataposter(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_poster', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/galeri/poster';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'poster',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}

	public function savedatafoto(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;

			$params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			
			$id = $this->Model_data->createdata('data_foto', $params);
			
			if($id){
				if(!empty($_FILES)){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/galeri/foto';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'foto',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'caption' => $caption,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}

	public function saveglobal(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;
			$table = $params->table;
			$params->create_by	 = $this->session->userdata('id');
			// $params->update_by	 = $this->session->userdata('id');
			$params->create_date = date("Y-m-d H:i:s");
			// $params->update_date = date("Y-m-d H:i:s");
			unset($params->table);
			$id = $this->Model_data->createdata($table, $params);
			
			if(!empty($_FILES)){
				if($id){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/berita';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'berita',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}
	public function updateglobal(){
		try
		{

			$params = (object)$this->input->post();
			$id = $params->id;
			$table = $params->table;
			// $params->create_by	 = $this->session->userdata('id');
			$params->update_by	 = $this->session->userdata('id');
			// $params->create_date = date("Y-m-d H:i:s");
			$params->update_date = date("Y-m-d H:i:s");
			unset($params->table);
			$id = $this->Model_data->updatedata($table, $params);
			
			if(!empty($_FILES)){
				if($id){
					$files = $_FILES['files'];
					$count = count($_FILES['files']['name']);
					$public		= FCPATH.'public';
					$tipe		= './assets/upload/berita';
					$date 		= date('Y/m/d');
				
					for ($i=0; $i < $count; $i++) { 

						$name = $files['name'][$i];
						$file = $files['tmp_name'][$i];
						$type = $files['type'][$i];
						$size = $files['size'][$i];
						$size = $files['size'][$i];
						$caption = $params->caption[$i];

						$path = $tipe.'/'.$date;
						if (!is_dir($path)) {
							mkdir($path, 0777, TRUE);
						}
						move_uploaded_file($file, $path.'/'.$name);

						$data_file = [
								'id_parent' => $id,
								'type' => 'berita',
								'path' => $path,
								'size' => $size,
								'extension' => $type,
								'filename' => $name,
								'create_date' => date("Y-m-d H:i:s"),
								'update_date' => date("Y-m-d H:i:s")
							];
							$this->Model_data->createdata('data_file', $data_file);
						}
				}
			}

			$response = [
				'status'   => 'sukses',
				'code'     => '0',
				'data' 	   => 'terkirim'
		];
		header('Content-Type: application/json');
		echo json_encode($response);
		exit;

		}
		catch (\Exception $e)
		{
			die($e->getMessage());
		}
		

	}

	public function getkategoriprofil()
	{
		$result = $this->Model_data->getkategori('kategori_profile');
		echo json_encode($result);
	}
	public function getkategorilaporan()
	{
		$result = $this->Model_data->getkategori('kategori_laporan');
		echo json_encode($result);
	}

	// public function getkategoriprofils()
	// {
	// 	$result = $this->Model_data->getkategori('kategori_profile');
	// 	echo json_encode($result);
	// }

}

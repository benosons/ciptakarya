<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Views extends CI_Controller {

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
		$this->load->model('Model_auth');
		$this->logs = $this->session->all_userdata();
		$this->logged = $this->session->userdata('userLogged');
		$this->kategori = $this->session->userdata('kategori');
		$this->username = $this->session->userdata('username');
		$this->name = $this->session->userdata('name');
		$this->role = $this->session->userdata('role');
		$this->foto = $this->session->userdata('foto');
		$this->id = $this->session->userdata('id');
		$this->content = array(
			"base_url" => base_url(),
			"logs" => $this->session->all_userdata(),
			"id" => $this->id,
			"username" => $this->username,
			"role" => $this->role,
			"name" => $this->name,
			"foto" => $this->foto
		);

	}


	public function login()
	{

		if ($this->logged)
		{

			if($this->role == '10' || $this->role == '20'){
				redirect("dashboard");
			}else{
				redirect("/");
			}
		}else{
			$this->twig->display("admin/login/index-login.html", $this->content);
		}

	}

	public function dashboard()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/index.js';
				$this->twig->display('admin/index.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function berita()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/berita.js';
				$this->twig->display('admin/menu/berita.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function poster()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/poster.js';
				$this->twig->display('admin/menu/poster.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function foto()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/foto.js';
				$this->twig->display('admin/menu/foto.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function video()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/video.js';
				$this->twig->display('admin/menu/video.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function profile()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/profile.js';
				$this->twig->display('admin/menu/profile.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function infobalai()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/infobalai.js';
				$this->twig->display('admin/menu/infobalai.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function kontak()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/kontak.js';
				$this->twig->display('admin/menu/kontak.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function banner()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/banner.js';
				$this->twig->display('admin/menu/banner.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function runningtext()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/runningtext.js';
				$this->twig->display('admin/menu/runningtext.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function bukuprofile()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/bukuprofile.js';
				$this->twig->display('admin/menu/bukuprofile.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function infografis()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/infografis.js';
				$this->twig->display('admin/menu/infografis.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}
	

	public function agenda()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/agenda.js';
				$this->twig->display('admin/menu/agenda.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}

	public function produklaporan()
	{
		if ( $this->logged)
		{
			if( $this->role == '10' || $this->role == '20' || $this->role == '30'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/menu/produklaporan.js';
				$this->twig->display('admin/menu/produklaporan.html', $this->content);
			}else{
				redirect("/");
			}
		}else{
			redirect("logout");
		}
	}
	
	public function listusers()
	{
		if ($this->logged) {
			if($this->role == '10'){
				$this->content['script'] = $this->data['base_url'].'assets/js/action/admin/users/listuser.js';
				$this->twig->display('admin/users/listuser.html', $this->content);
			}else{
				redirect("dashboard");
			}
		}else{
			redirect("logout");
		}
	}

}

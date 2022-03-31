<?php
class Model_data extends CI_Model {

    var $table = 'muser';
    var $column = array('username','kategori','kotaKab'); //set column field database for datatable searchable just firstname , lastname , address are searchable
    var $column_search = array('username','kategori','kotaKab');
    var $order = array('id' => 'desc'); // default order

    function __construct(){
        parent::__construct();
    }

    public function getdata($param)
    {
        $query = $this->db->query("select * from $param order by id asc")->result();
        return $query;
    }

    public function getfile($id, $type)
    {
        $query = $this->db->query("select * from data_file where id_parent = '$id' and type = '$type' order by id asc")->result();
        return $query;
    }

    public function createdata($table, $params = NULL)
    {
        $this->db->insert($table, $params);
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }

    public function deleteberita($id)
    {
        // $idx = $this->db->escape_str($id);
        $this->db->where('id', $id->id);
        $this->db->delete('data_berita');
    }

    public function deleteposter($id)
    {
        // $idx = $this->db->escape_str($id);
        $this->db->where('id', $id->id);
        $this->db->delete('data_poster');
    }
    public function deletebanner($id)
    {
        // $idx = $this->db->escape_str($id);
        $this->db->where('id', $id->id);
        $this->db->delete('data_banner');
    }
    public function deletetext($id)
    {
        // $idx = $this->db->escape_str($id);
        $this->db->where('id', $id->id);
        $this->db->delete('data_text');
    }

    public function deletefoto($id)
    {
        // $idx = $this->db->escape_str($id);
        $this->db->where('id', $id->id);
        $this->db->delete('data_foto');
    }

    public function deletefile($id)
    {
        // $idx = $this->db->escape_str($id);
        $this->db->where('id', $id->id_file);
        $this->db->delete('data_file');
    }

    public function updatedataberita($params = NULL)
    {
        $valid = true;
       
        $this->db->set('judul', $params->judul);
        $this->db->set('intro', $params->intro);
        $this->db->set('bagian', $params->bagian);
        $this->db->set('date', $params->date);
        $this->db->set('tag', $params->tag);
        $this->db->set('isi', $params->isi);
        $this->db->set('stat', $params->stat);
        $this->db->set('update_by', $params->update_by);
        $this->db->set('update_date', $params->update_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_berita');
        
        return $valid;

    }
    public function updatedatagrafis($params = NULL)
    {
        $valid = true;
       
        $this->db->set('judul', $params->judul);
        $this->db->set('tahun', $params->tahun);
        $this->db->set('status', $params->status);
        $this->db->set('updated_by', $params->updated_by);
        $this->db->set('updated_at', $params->updated_at);
        $this->db->where('id', $params->id);
        $this->db->update('data_grafis');
        
        return $valid;

    }
    public function updatedatatext($params = NULL)
    {
        $valid = true;
       
        $this->db->set('judul', $params->judul);
        $this->db->set('tipe', $params->tipe);
        $this->db->set('isi', $params->isi);
        $this->db->set('date', $params->date);
        $this->db->set('status', $params->status);
        $this->db->set('update_by', $params->updated_by);
        $this->db->set('update_date', $params->updated_at);
        $this->db->where('id', $params->id);
        $this->db->update('data_text');
        
        return $valid;

    }
    public function updatedatabanner($params = NULL)
    {
        $valid = true;
       
        $this->db->set('judul', $params->judul);
        $this->db->set('tipe', $params->tipe);
        $this->db->set('keterangan', $params->keterangan);
        $this->db->set('status', $params->status);
        $this->db->set('updated_by', $params->updated_by);
        $this->db->set('updated_at', $params->updated_at);
        $this->db->where('id', $params->id);
        $this->db->update('data_banner');
        
        return $valid;

    }
    public function updatedataagenda($params = NULL)
    {
        $valid = true;
       
        $this->db->set('deskripsi', $params->deskripsi);
        $this->db->set('tanggal', $params->tanggal);
        $this->db->set('status', $params->status);
        $this->db->set('updated_by', $params->updated_by);
        $this->db->set('updated_at', $params->updated_at);
        $this->db->where('id', $params->id);
        $this->db->update('data_agenda');
        
        return $valid;

    }

    public function updatedataposter($params = NULL)
    {
        $valid = true;
       
        $this->db->set('judul', $params->judul);
        $this->db->set('bulan', $params->bulan);
        $this->db->set('tahun', $params->tahun);

        $this->db->set('status', $params->status);
        $this->db->set('update_by', $params->update_by);
        $this->db->set('update_date', $params->update_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_poster');
        
        return $valid;

    }

    public function updatefile($params = NULL)
    {
        $valid = true;
        
        $this->db->set('type', $params['type']);
        $this->db->set('path', $params['path']);
        $this->db->set('size', $params['size']);
        $this->db->set('extension', $params['extension']);
        $this->db->set('filename', $params['filename']);
        $this->db->set('update_date', $params['update_date']);
        $this->db->where('id', $params['id']);
        $this->db->update('data_file');
        
        return $valid;

    }

    public function updateagenda($params = NULL)
    {
        $valid = true;
       
        $this->db->set('status', $params->status);
        $this->db->set('updated_by', $params->updated_by);
        $this->db->set('updated_at', $params->updated_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_agenda');
        
        return $valid;

    }
    public function updateberita($params = NULL)
    {
        $valid = true;
       
        $this->db->set('stat', $params->stat);
        $this->db->set('update_by', $params->update_by);
        $this->db->set('update_date', $params->update_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_berita');
        
        return $valid;

    }
    public function updategrafis($params = NULL)
    {
        $valid = true;
       
        $this->db->set('status', $params->status);
        $this->db->set('updated_by', $params->updated_by);
        $this->db->set('updated_at', $params->updated_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_grafis');
        
        return $valid;

    }
    public function updatebanner($params = NULL)
    {
        $valid = true;
       
        $this->db->set('status', $params->status);
        $this->db->set('updated_by', $params->update_by);
        $this->db->set('updated_at', $params->update_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_banner');
        
        return $valid;

    }
    public function updatetext($params = NULL)
    {
        $valid = true;
       
        $this->db->set('status', $params->status);
        $this->db->set('update_by', $params->updated_by);
        $this->db->set('update_date', $params->updated_at);
        $this->db->where('id', $params->id);
        $this->db->update('data_text');
        
        return $valid;

    }

    public function updateposter($params = NULL)
    {
        $valid = true;
       
        $this->db->set('status', $params->stat);
        $this->db->set('update_by', $params->update_by);
        $this->db->set('update_date', $params->update_date);
        $this->db->where('id', $params->id);
        $this->db->update('data_poster');
        
        return $valid;

    }

    public function getwhere($field, $from, $where)
    {
        $query = $this->db->query("select $field from $from where $where order by id asc")->result();
        return $query;
    }

}

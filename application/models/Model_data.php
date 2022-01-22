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

}

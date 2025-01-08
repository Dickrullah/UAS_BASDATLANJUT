<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Post_model extends CI_Model
{
    public function get_all_posts()
    {
        return $this->db->get('tbl_posts')->result_array();
    }

    public function get_post($id)
    {
        return $this->db->get_where('tbl_posts', ['id' => $id])->row_array();
    }

    public function insert_post($data)
    {
        $this->db->insert('tbl_posts', $data);
    }

    public function update_post($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update('tbl_posts', $data);
    }

    public function delete_post($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('tbl_posts');
    }
}

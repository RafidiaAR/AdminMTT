<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_model extends CI_Model {
	public function Transaction(){
    return $this->db->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail')
                    ->join('product_order', 'product_order.id = product_order_detail.order_id')
                    ->get('product_order_detail')
                    ->result();
    }
    public function Transaction_Side(){
    return $this->db->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail')
                    ->join('product_order', 'product_order.id = product_order_detail.order_id')
                    ->get('product_order_detail')
                    ->result();
    }
    public function Count_Transaction($where,$limit,$offset){
        $this->db->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail')
                    ->join('product_order', 'product_order.id = product_order_detail.order_id')
                    ->where($where)
                    ->order_by('product_order.id','ASC')
                    ->get('product_order_detail')
                    ->result();
     }
    public function Count_Merchant()
    {
    	$this->db->select('*')
                 ->from('user_merchant')
                 ->where('is_merchant',1)
                 ->where('id !=', 1)                  
                 ->order_by('id','ASC');
        return $this->db->count_all_results();
    }
    public function Count_Buyer()
    {
        $this->db->select('*')
                 ->from('user_merchant')
                 ->where('is_merchant',0)                    
                 ->order_by('id','ASC');
        return $this->db->count_all_results();
    }
    public function Merchant()
    {
    	return $this->db->select('*')
    					->from('user_merchant')
    					->get()
    					->result();
    }
    public function GetDataOrder($where,$limit,$offset){
    return $this->db->select('*, product_order_detail.id as id_detail')   
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->join('user_merchant','product_order_detail.merchant_id = user_merchant.id')
                    ->where($where)
                    ->order_by('product_order.id','ASC')
                    ->limit($limit,$offset)
                    ->get()
                    ->result();
    }
    public function GetDataMerchants()
    {
        return $this->db->select('*')
                    ->from('user_merchant')
                    ->order_by('username','ASC')
                    ->get()
                    ->result();
    }
    public function GetDataMerchant($limit,$offset)
    {
        return $this->db->select('*')
                        ->from('user_merchant')
                        ->where('is_merchant',1)
                        ->where('id !=', 1)
                        ->order_by('id','ASC')
                        ->limit($limit,$offset)
                        ->get()
                        ->result();
    }
    public function GetDataBuyer($limit,$offset)
    {
        return $this->db->select('*')
                        ->from('user_merchant')
                        ->where('is_merchant',0)
                        ->order_by('id','ASC')
                        ->limit($limit,$offset)
                        ->get()
                        ->result();
    }
    public function Count_Product()
    {
    	$this->db->select('*')
    			 ->from('product')
    			 ->order_by('id','ASC');
    	return $this->db->count_all_results();
    }
    public function Product()
    {
        /*return $this->db->select('*, product.name as product_name, user_merchant.name as merchant_name, product.id as pro_id')
                    ->where($where)
                    ->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->get('product')
                    ->result();*/

        return $this->db->select('*, category.id as cat_id, product.name as product_name,product.id as proid')
                 ->join('category','product.category_id = category.id')
                 ->get('product')
                 ->result();
    }
    
    public function GetDataProduct($where)
    {
        return $this->db->select('*, category.id as cat_id, product.name as product_name,product.id as proid, category.name as cat_name')
                 ->where($where)
                 ->join('category','product.category_id = category.id')
                 ->join('user_merchant','product.merchant_id = user_merchant.id')
                 ->get('product')
                 ->row();
    }
    public function GetDataTransaction($where)
    {
        return $this->db->select('*, product_order_detail.id as id_detail')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    /*->join('product','product_order_detail.product_id = product.id')*/
                    ->where($where)
                    ->order_by('product_order.id','ASC')
                    ->get('product_order')
                    ->row();
    }
     public function GetData($where, $table)
    {
      return $this->db->where($where)->get($table)->row();
    }

    public function Order($where){
    return $this->db->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail')
                    ->where($where)
                    ->join('product_order', 'product_order.id = product_order_detail.order_id')
                    ->get('product_order_detail')
                    ->result();
    
    }
    public function Total_Records_Transaction($where)
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where($where)
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
    }
    public function Trans_Masuk(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where('product_order_detail.status','Proses Ditujukan Ke Merchant')
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
    }
    public function Trans_Kirim(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where('product_order_detail.status','Proses Kirim')
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
    }
    public function Trans_Selesai(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where('product_order_detail.status','Selesai')
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
    }
    public function Trans_Batal(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where('product_order_detail.status','Order Dibatalkan')
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
    }
    public function Del_User($id){
        $this->db->where('id',$id)
                 ->delete('user_merchant');
      
        if ($this->db->affected_rows() > 0) {
            return "true";
        } else {
            return "false";
        }
    }

}

/* End of file Admin_model.php */
/* Location: ./application/models/Admin_model.php */
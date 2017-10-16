<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model {

    public function notification(){
      $user_id = $this->session->userdata('logged_id');
      return $this->db->where('for_id',$user_id)
              ->order_by('id_notification')
               ->or_where('for_id','0920')
              ->or_where('for_id','0922')
              // ->limit(5,0)
              ->get('notification')
              ->result();
    }
    public function unseen_notification(){
      $user_id = $this->session->userdata('logged_id');
      return $this->db->where('for_id',$user_id)
     

              ->where('status','0')
              ->order_by('id_notification')
              ->get('notification')
              ->result();
    }
    public function edit_slide($foto){
        $code = $this->input->post('type');
        $this->db->where(['code'=>$code])->update('config', array(
           
            'value'     => $foto['file_name'],
        ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
        }
    public function nullNotification(){
        $userid = $this->session->userdata('logged_id');
        $this->db->where('for_id',$userid)

                 ->where('status','0')
                 ->update('notification', array('status' => '1'));


        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
	public function add_product($foto){
        if($this->session->userdata('level') == 1 )
        {
            $this->db->insert('product', array(
            'merchant_id'   => $this->input->post('merchant_id'),
            /*'id'              => $this->input->post('id_produk'),*/
            'name'          => $this->input->post('product'),
            'image'         => $foto['file_name'],
            'price'         => $this->input->post('harga'),
            'stock'         => $this->input->post('stock'),
            'description'   => $this->input->post('description'),
            'category_id'   => $this->input->post('category'),
            /*'type'          => $this->input->post('type'),*/
            'fee'           => $this->input->post('harga'),
            'status'        => $this->input->post('status'),
            'created_at'    => $this->input->post('created_at'),
            'last_update'    => $this->input->post('created_at')
        ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
        }
        if($this->session->userdata('leveluser') == 0 || $this->session->userdata('leveluser') == NULL)
        {
            $this->db->insert('product', array(
            'merchant_id'   => $this->input->post('merchant_id'),
            /*'id'              => $this->input->post('id_produk'),*/
            'name'          => $this->input->post('product'),
            'image'         => $foto['file_name'],
            'price'         => $this->input->post('harga'),
            'stock'         => $this->input->post('stock'),
            'description'   => $this->input->post('description'),
            'category_id'   => $this->input->post('category'),
            /*'type'          => $this->input->post('type'),*/
            'fee'           => $this->input->post('adminfee'),
            'status'        => $this->input->post('status'),
            'created_at'    => $this->input->post('created_at'),
            'last_update'    => $this->input->post('created_at')
        ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }

        }
    }
    public function add_broadcast(){

            $this->db->insert('notification', array(
            'from_id'   => $this->session->userdata('logged_id'),
            'for_id'   => $this->input->post('for_id'),
            'subject'   => $this->input->post('subject'),
            'text'   => $this->input->post('text'),
            'type_notification'   => 'Broadcast',
        ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
        }
    
    public function GetDataPending($where)
    {
        return $this->db->select('*, product.id as id_product, product.name as product_name')
                    ->where($where)
                    ->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->get('product')
                    ->result();
    }
    public function edit_product(){
        $id = $this->input->post('id_produk');
        $this->db->where(['id'=>$id])->update('product', array(
            'name'           => $this->input->post('product'),
            'price'          => $this->input->post('harga'),
            'stock'          => $this->input->post('stock'),
            'description'    => $this->input->post('description'),
            'last_update'    => $this->input->post('last_update')
          ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    public function UpdateBill(){
        $id = $this->input->post('id_bill');
        $this->db->where(['id'=>$id])->update('bill', array(
            'status'         => 'Penagihan Selesai',
            'last_update'    => $this->input->post('last_update')
          ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function product($where){
    return $this->db->select('*, product.name as product_name, user_merchant.name as merchant_name, product.id as pro_id, product_order_detail.merchant_id as merchant_detail')
                    ->where($where)
                    ->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->join('product_order_detail','product_order_detail.product_id = product.id')
                    ->group_by('product_order_detail.product_id')
                    ->get('product')
                    ->result();
    }
    public function GetDataProduct($where)
    {
        return $this->db->select('*, product.name as product_name, user_merchant.name as merchant_name, product.id as pro_id')
                    ->where($where)
                    ->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->get('product')
                    ->result();
    }
    public function CheckoutTransfer($where){
    return $this->db->select('*, product.name as product_name, user_merchant.name as merchant_name, product.id as pro_id, bill.merchant_id as merchant_detail, bill.id as id_bill')
                    ->where($where)
                    ->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->join('bill','bill.product_id = product.id')
                    ->group_by('bill.product_id')
                    ->get('product')
                    ->result();
    }
    public function AdminProduct($where){
    return $this->db->select('*, product.name as product_name, product.id as pro_id, product_order_detail.merchant_id as merchant_detail, product_order_detail.status as detail_status')
                    
                    //->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->join('product_order_detail','product_order_detail.product_id = product.id')
                    ->where($where)
                    ->group_by('product_order_detail.product_id')
                    ->get('product')
                    ->result();
    }
    public function order($where){
    return $this->db->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail')
                    ->where($where)
                    ->join('product_order', 'product_order.id = product_order_detail.order_id')
                    ->get('product_order_detail')
                    ->result();
    }
    public function orderin($where,$limit,$offset){
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
    public function Bill($where,$limit,$offset){
    return $this->db->select('*, bill.id as id_bill, bill.status as bill_status')
                    ->from('product_order')
                    ->join('bill', 'product_order.id = bill.order_id')
                    ->join('user_merchant','bill.merchant_id = user_merchant.id')
                    ->where($where)
                    ->order_by('product_order.id','ASC')
                    ->limit($limit,$offset)
                    ->get()
                    ->result();
    }
    public function CountBillSent($where)
    {
        $this->db->select('*, bill.id as id_bill, bill.status as bill_status')
                    ->from('product_order')
                    ->join('bill', 'product_order.id = bill.order_id')
                    ->join('user_merchant','bill.merchant_id = user_merchant.id')
                    ->where($where)
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
    }
    public function total_record_transaction($where)
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where($where)
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
        //return $this->db->count_all('product_order','product_order_detail');
    }
     public function Total_Tagihan($where)
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('bill', 'product_order.id = bill.order_id')
                    ->where($where)
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
        //return $this->db->count_all('product_order','product_order_detail');
    }
    public function GetDataOrderIn($limit,$start,$where)
    {   
        return $this->db->limit($limit,$start)
                        ->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail')
                        ->where($where)
                        ->join('product_order', 'product_order.id = product_order_detail.order_id')
                        ->get('product_order_detail')
                        ->result();
    }
    public function stock($where){
    return $this->db->select('*, product.id as id_product,product_order_detail.id as id_detail, product.merchant_id as id_merchant')
                    ->where($where)
                    ->join('product', 'product.id = product_order_detail.product_id')
                    ->get('product_order_detail')
                    ->result();
    }
    public function Get_Feedback($where)
    {
       return $this->db->select('*, product_order.id as id_order, product_order_detail.id as id_detail,product_order.status as status_order,product_order_detail.status as status_detail, product_order_detail.last_update as tgl_update')
                    ->where($where)
                    ->join('product_order', 'product_order.id = product_order_detail.order_id')
                    ->get('product_order_detail')
                    ->result();
    }

    public function delete($where, $table)
    {
        $query = $this->db->where($where)->delete($table);
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    public function del_product($id){
        $this->db->where('id',$id)
                 ->delete('Product');
      
        if ($this->db->affected_rows() > 0) {
            return "true";
        } else {
            return "false";
        }
    }
    public function acc_order($product_id,$amount,$last_update,$order_id,$stats){
        $stock = $this->GetData(['id'=>$product_id], 'product')->stock;
        $newstock = $stock - $amount;
        $this->db->where(['id'=>$product_id])->update('product', array(
            'stock'         => $newstock,
            'last_update'   => $last_update
          ));

        $this->db->where(['product_order_detail.id'=>$order_id])->update('product_order_detail', array(
            'status'    =>$stats
          ));
        
        
        if ($this->db->affected_rows() > 0) {
            $prorder_id = $this->GetDataa(['id'=>$order_id],'product_order_detail')->row('order_id');
            $ctm_id = $this->GetDataa(['id'=>$prorder_id],'product_order')->row('user_id');

            $this->db->insert('notification', array(
                'from_id'               => $this->session->userdata('logged_id'),
                'for_id'                => $ctm_id,
                'subject'               => '@'.$this->GetDataa(['id'=>$this->session->userdata('logged_id')],'user_merchant')->row('username'),
                'text'                  => ' telah menerima order produk '.$this->GetDataa(['id'=>$product_id],'product')->row('name'),
                'product_id'            => $product_id,
                'type_notification'     => 'order_process',
            ));
           
           if ($this->db->affected_rows() > 0) {
            return "true";
        } else {
            return "false";
        } 
        } else {
            return "false";
        }       
    }
    public function send_comment($product_id,$comment){
        $id = $this->session->userdata('logged_id');
        $this->db->insert('discussion', array(
            'level'        => '1',
            'id_user'      => $id,
            'product_id'   => $product_id,
            'merchant_id'  => $id,
            'comment'      => $comment,
            ));

        
        if ($this->db->affected_rows() > 0) {
             $check_inarray = array();
        $id_getnotif = array();
        $id_validnotif = array();
        $id_getnotif = $this->GetDataa(['product_id'=>$product_id],'discussion')->result();


        if (!empty($id_getnotif)) {
                
            foreach ($id_getnotif as $getnotif) {
                if (!in_array($getnotif->id_user, $id_validnotif)){
                    if ($this->session->userdata('logged_id') != $getnotif->id_user) {
                        $id_validnotif[] = $getnotif->id_user;
                    }
            
        }
        }
            
        }

        $insert_notif = array();
        $username = $this->GetDataa(['id'=>$this->session->userdata('logged_id')],'user_merchant')->row('username');
        $product_name = $this->GetDataa(['id'=>$product_id],'product')->row('name');
        for($i = 0; $i < count($id_validnotif); $i++)
        {
            $insert_notif[] = array(
                
                'from_id'               => $this->session->userdata('logged_id'),
                'for_id'                => $id_validnotif[$i],
                'subject'               => '@'.$username,
                'text'                  => ' menambahkan komentar di produk '.$product_name,
                'product_id'            => $product_id,
                'comment'               => $comment,
                'type_notification'     => 'diskusi',
                
            );
        }
         $this->db->insert_batch('notification', $insert_notif);

           
           if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        } 
        } else {
            return FALSE;
        }       
    }
    public function Change_Status($id,$status){
        $this->db->where(['product_order_detail.id'=>$id])->update('product_order_detail', array(
            'status'    =>$status
          ));
        if ($this->db->affected_rows() > 0) {
            return "true";
        } else {
            return "false";
        }       
    }
    public function Change_StatusBill($id,$status){
        $this->db->where(['bill.id'=>$id])->update('bill', array(
            'status'    =>$status
          ));
        if ($this->db->affected_rows() > 0) {
            return "true";
        } else {
            return "false";
        }       
    }
    public function Change_Bill($id,$status,$order_id,$pro_id,$pro_name,$mer_id,$mer_name,$mer_phone,$mer_email,$statusnew,$amount,$price,$date){
        $this->db->where(['product_order_detail.id'=>$id])->update('product_order_detail', array(
            'status'    =>$status
          ));

        $this->db->insert('bill', array(
            'id'                => $id,
            'order_id'          => $order_id,
            'product_id'        => $pro_id,
            'product_name'      => $pro_name,
            'merchant_id'       => $mer_id,
            'merchant_name'     => $mer_name,
            'merchant_phone'    => $mer_phone,
            'merchant_email'    => $mer_email,
            'status'            => $statusnew,
            'amount'            => $amount,
            'price_item'        => $price,
            'created_at'        => $date,
            'last_update'       => $date,
            ));
        if ($this->db->affected_rows() > 0) {
            return "true";
        } else {
            return "false";
        }       
    }

    public function GetDiscussDetail($where){
        return $this->db->select('*, discussion.merchant_id as merchant_discuss, product.merchant_id as product_merchant, discussion.created_at as discussion_created, product.id as product_id, user_merchant.id as user_id, product.name as product_name, user_merchant.name as user_name')
                        ->where($where)
                        ->join('product', 'product.id = discussion.product_id')
                        ->join('user_merchant', 'user_merchant.id = discussion.id_user')
                        ->get('discussion')
                        ->result();
    }
    public function GetDiscussList($where){
        // return $this->db->select('*, discussion.merchant_id as merchant_discuss, product.merchant_id as product_merchant, discussion.created_at as discussion_created, count(comment) as count_comment')
        //             ->where($where)
        //             ->join('product', 'product.id = discussion.product_id')
        //             ->get('discussion')
        //             ->result();
        return $this->db->select('*, discussion.merchant_id as merchant_discuss, product.merchant_id as product_merchant, discussion.created_at as discussion_created')
                        ->where($where)
                        ->join('discussion', 'product.id = discussion.product_id')
                        ->group_by('product_id')
                        ->get('product')
                        ->result();
    }
    public function GetDisucssCount(){
        return $this->db->select('count(comment)')
                        // ->where($where)
                        ->join('product', 'product.id = discussion.product_id')
                        ->get('discussion')
                        ->result();
    }
    public function CountProductMerchant($where)
    {
        $this->db->select('*')
                 ->from('product')
                 ->where($where);
        return $this->db->count_all_results();
    }
    public function Count_OrderMerchant()
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'product_order_detail.status' => 'Proses ditujukan ke Merchant'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
        //return $this->db->count_all('product_order','product_order_detail');
    }
    public function Count_OrderSent()
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'product_order_detail.status' => 'Proses Kirim'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
        //return $this->db->count_all('product_order','product_order_detail');
    }
    public function Count_Penagihan(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('bill', 'product_order.id = bill.order_id')
                    ->join('user_merchant','bill.merchant_id = user_merchant.id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'bill.status' => 'Belum Ditagihkan'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();            
    }
    public function Count_ProsesPenagihan(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('bill', 'product_order.id = bill.order_id')
                    ->join('user_merchant','bill.merchant_id = user_merchant.id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'bill.status' => 'Tagihkan Ke Admin'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();            
    }
    public function Count_PenagihanSelesai(){
        $this->db->select('*')
                    ->from('product_order')
                    ->join('bill', 'product_order.id = bill.order_id')
                    ->join('user_merchant','bill.merchant_id = user_merchant.id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'bill.status' => 'Penagihan Selesai'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();            
    }
    public function Count_OrderFinish()
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'product_order_detail.status' => 'Selesai'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
        //return $this->db->count_all('product_order','product_order_detail');
    }
    public function Count_OrderCancel()
    {
        $this->db->select('*')
                    ->from('product_order')
                    ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
                    ->where(array('merchant_id' => $this->session->userdata('logged_id'),'product_order_detail.status' => 'Order Dibatalkan'))
                    ->order_by('product_order.id','ASC');
        return $this->db->count_all_results();
        //return $this->db->count_all('product_order','product_order_detail');
    }
    public function GetLaporanProduct($where)
    {
        return $this->db->select('*, sum(amount) as totaljual')
                        ->from('product_order_detail')
                        ->where($where)
                        ->order_by('product_id','ASC')
                        ->group_by('product_id')
                        ->get()
                        ->result();
    }
    public function Getproduct($where)
    {
        return $this->db->select('*, product.id as id_product, product.name as product_name')
                    ->where($where)
                    ->join('user_merchant', 'product.merchant_id = user_merchant.id')
                    ->get('product')
                    ->row();
    }
     public function GetMiniStatus()
    {
      $user_id = $this->session->userdata('logged_id');
      return $this->db->select('*, product_order.id as product_order_id, product_order_detail.id as product_order_detail_id, product_order.status as status_order, product_order_detail.status as status_order_detail')
            ->from('product_order')
            ->where('product_order_detail.merchant_id',$user_id)
            ->where('product_order_detail.status','Proses Kirim')
            ->or_where('product_order_detail.merchant_id',$user_id)
            ->where('product_order_detail.status','Pesanan ditujukan ke Merchant')
            ->join('product_order_detail', 'product_order.id = product_order_detail.order_id')
            ->order_by('product_order_detail.last_update', 'DESC')
            ->get()
            ->result();
            
    }

    public function GetAllData($table)
    {
      return $this->db->get($table)->result();
    }
    public function GetListData($where, $table)
    {
      return $this->db->where($where)->get($table)->result();
    }
    public function GetData($where, $table)
    {
      return $this->db->where($where)->get($table)->row();
    }
    public function GetDataa($where, $table)
    {
      return $this->db->where($where)->get($table);
    }
    public function GetLastId($table, $field) {
        return $this->db->order_by($field, 'desc')->get($table)->row($field);
    }

}

/* End of file Product.php */
/* Location: ./application/models/Product.php */
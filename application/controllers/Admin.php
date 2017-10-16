<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Admin_model');
		$this->load->model('Product_model');
		$this->load->model('User_model');
	}
public function index()
{
	if ($this->session->userdata('logged_in') == TRUE){
		if($this->session->userdata('leveluser') == 1){
                $leveluser = 'Administrator';
           	}
        else{
            $leveluser = 'Merchant';
        	}
       	$id             = $this->session->userdata('logged_id');
        $record         = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
        $products         = $this->Product_model->product(array("product.merchant_id" => $id, "product_order_detail.status" => 'Selesai') , 'product_order_detail');
        $A_Product         = $this->Product_model->AdminProduct(array("product_order_detail.status" => 'Selesai'),'product_order_detail');
        $masuk            = "Pesanan ditujukan ke Merchant";
        $produk         = count($this->Product_model->GetListData(['merchant_id'=>$id], 'Product'));
        $totaltrans        = count($this->Product_model->Order(array("merchant_id" => $id), 'product_order_detail'));
        $totalmerchant    = count($this->Product_model->GetAllData('User_merchant'));
       	$trans             = count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            /*Admin Controller Start*/
        $A_AmountTransaction     = count($this->Admin_model->Transaction());
            $A_AmountMerchant         = $this->Admin_model->Count_Merchant() - 1;
            $A_AmountProduct        = $this->Admin_model->Count_Product();
            /*Admin Controller End*/
            $result         = $this->Product_model->GetLaporanProduct(array("product_order_detail.merchant_id"=> $id, "product_order_detail.status" => 'Selesai'));
            $results         = $this->Product_model->GetLaporanProduct(array("product_order_detail.status" => 'Selesai'));
            $A_allamount     = array();
            foreach ($results as $data) {
                $A_allamount[$data->product_id] = $data->totaljual;
            }
            $allamount = array();
            foreach ($result as $data) {
                $allamount[$data->product_id]= $data->totaljual;
            }
            $bill     = array('bill.status' => 'Tagihkan Ke Admin');
            $end     = array('bill.status' => 'Penagihan Selesai');

            $data = [
                'Confirm'        => $this->Admin_model->Trans_Masuk(),
                'Sent'            => $this->Admin_model->Trans_Kirim(),
                'Finish'        => $this->Admin_model->Trans_Selesai(),
                'Cancel'        => $this->Admin_model->Trans_Batal(),
                'CMerchant'        => $this->Admin_model->Count_Merchant(),
                'CBuyer'        => $this->Admin_model->Count_Buyer(),
                'Penagihan'      => $this->Product_model->Count_Penagihan(),
                'totalmerchant' => $totalmerchant,
                'jmlh_produk'     => $produk,
                'totaltrans'    => $totaltrans, 
                'id'             => $record->id, 
                'username'         => $record->username, 
                'email'         => $record->email, 
                'phone'         => $record->phone,
                'trans'            => $trans,
                'main_view'     => 'dashboard',
                'nameAccess'    => $leveluser,
                'product'        => $products,
                'allamount'        => $allamount,
                'A_allamount'    => $A_allamount,
                /*Admin Data Start*/
                'A_Product'              => $A_Product,
                'A_AmountTransaction' => $A_AmountTransaction,
                'A_AmountMerchant'      => $A_AmountMerchant,
                'A_AmountProduct'      =>  $this->Admin_model->Count_Product(),
                /*Admin Data End*/
                'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
                'PenagihanEnd'     => $this->Product_model->CountBillSent($end),
                ];
            $this->load->view('template', $data);
        }
        else {
            redirect('Auth');
        }
    }

	public function Delete_User(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id 	= $this->input->post('id');
        $result = $this->Admin_model->Del_User($id);
        echo $result;
		}
		else{
			redirect('Auth');
		}
	}

	public function List_Merchant($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{ 
                $leveluser = 'Administrator'; 
            }else
            { 
                $leveluser = 'Merchant'; 
            } 
            
            $id         = $this->session->userdata('logged_id'); 
            $limit      = 10; 
            if(!is_null($offset)){ 
                $offset = $this->uri->segment(3); 
            }
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/List_Merchant';
			$config['total_rows'] = $this->Admin_model->Count_Merchant();
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);

			$masuk		= "Pesanan ditujukan ke Merchant";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$merchant 	= $this->Admin_model->Merchant();
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data = [
				'Confirm'		=> $this->Admin_model->Trans_Masuk(),
				'Sent'			=> $this->Admin_model->Trans_Kirim(),
				'Finish'		=> $this->Admin_model->Trans_Selesai(),
				'Cancel'		=> $this->Admin_model->Trans_Batal(),
				'CMerchant'		=> $this->Admin_model->Count_Merchant(),
				'CBuyer'		=> $this->Admin_model->Count_Buyer(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ListMerchant'	=> $this->Admin_model->GetDataMerchant($limit,$offset),
				'username'		=> $record->username,
				'trans'			=> $trans,
				'main_view'		=> 'List_Merchant',
				'nameAccess'	=> $leveluser,
				'Merchant'		=> $merchant,
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'PenagihanMasuk'	=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 		=> $this->Product_model->CountBillSent($end),

			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function add_product()
	{
		if ($this->session->userdata('logged_in') == true) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			$id 		= $this->session->userdata('logged_id');
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$record2 	= $this->Product_model->GetAllData('Category');
			$merchant 	= $this->Admin_model->GetDataMerchants();
			$int 		= (int) $this->Product_model->GetLastId('Product', 'id');
            $newid 		= $int + 1;
            $masuk		= "Pesanan ditujukan ke Merchant";
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data = [
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'trans'			=> $trans,
				'main_view'		=> 'A_AddProduct',
				'merchant_id'	=> $record->id,
				'username'		=> $record->username,
				'id_product'	=> $newid,
				'category'		=> $record2,
				'Merchant'		=> $merchant,
				'nameAccess'	=> $leveluser,
				'CMerchant'		=> $this->Admin_model->Count_Merchant(),
				'CBuyer'		=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'PenagihanMasuk'	=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 		=> $this->Product_model->CountBillSent($end),

			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth/login');
		}
	}
	public function Tambah_product()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('merchant_id', 'Merchant ID', 'trim|required');
				/*$this->form_validation->set_rules('id_produk', 'ID Product', 'trim|required');*/
				$this->form_validation->set_rules('product', 'Nama Product', 'trim|required');
				$this->form_validation->set_rules('harga', 'Harga', 'trim|required');
				$this->form_validation->set_rules('stock', 'Stock', 'trim|required');
				$this->form_validation->set_rules('description', 'Description', 'trim|required');
				$this->form_validation->set_rules('category', 'Category', 'trim|required');
				$this->form_validation->set_rules('status', 'Status', 'trim|required');
				$this->form_validation->set_rules('created_at', 'Created', 'trim|required');
				/*$this->form_validation->set_rules('adminfee', 'AdminFee', 'trim|required');*/
				$bill = array('bill.status' => 'Tagihkan Ke Admin');
				$end = array('bill.status' => 'Penagihan Selesai');
				$A_AmountMerchant 		= $this->Admin_model->Count_Merchant() - 1;
				$A_AmountProduct		= $this->Admin_model->Count_Product();
				$A_AmountTransaction 	= count($this->Admin_model->Transaction());

				if ($this->form_validation->run() == TRUE) {
					$config['upload_path'] = './assets/images/';
					$config['allowed_types'] = 'gif|jpg|png|jpeg';
					$config['max_size'] = '2000';
					$this->load->library('upload', $config);
					if ($this->upload->do_upload('foto')) {
						if ($this->Product_model->add_product($this->upload->data()) == TRUE) {
							$id 		= $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int 		= (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid 		= $int + 1;
							$data = [
								'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
								'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'main_view'		=> 'A_AddProduct',
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> 'Tambah Produk Berhasil',
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
								'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
								'CBuyer'			=> $this->Admin_model->Count_Buyer(),
								
							];
							$this->load->view('template', $data);
						}
						else {
							$id = $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int 		= (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid 		= $int + 1;
							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
								'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
								'main_view'		=> 'A_AddProduct',
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> 'Tambah Produk Gagal',
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
								'CBuyer'			=> $this->Admin_model->Count_Buyer(),
								'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),

							];
							$this->load->view('template', $data);
						}
					}
					else {
							$id = $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int 		= (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid 		= $int + 1;
							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
								'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
								'main_view'		=> 'A_AddProduct',
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> $this->upload->display_errors(),
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
								'CBuyer'			=> $this->Admin_model->Count_Buyer(),
								'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
							];
							$this->load->view('template', $data);
					}
				}
				else {
							$id 		= $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int 		= (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid 		= $int + 1;
							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'main_view'		=> 'A_addproduct',
								'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
								'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> validation_errors(),
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
								'CBuyer'			=> $this->Admin_model->Count_Buyer(),
								'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
							];
							$this->load->view('template', $data);
				}
			}
			else {
				$data['main_view'] = 'dashboard';
				$this->load->view('template', $data);
			}
		}
		else {
			redirect('Auth');
		}
	}
	public function List_Buyer($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{ 
                $leveluser = 'Administrator'; 
            }else
            { 
                $leveluser = 'Merchant'; 
            } 
            $id         = $this->session->userdata('logged_id'); 
            $limit      = 10; 
            if(!is_null($offset)){ 
                $offset = $this->uri->segment(3); 
            }
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/List_Buyer';
			$config['total_rows'] = $this->Admin_model->Count_Buyer();
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			$masuk		= "Pesanan ditujukan ke Merchant";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$merchant 	= $this->Admin_model->Merchant();
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data = [
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'Penagihan' => $this->Product_model->Count_Penagihan(),
				'Cancel'	=> $this->Product_model->Count_OrderCancel(),
				'ListMerchant'	=> $this->Admin_model->GetDataBuyer($limit,$offset),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=> 'List_Buyer',
				'nameAccess'=> $leveluser,
				'Merchant'	=> $merchant,
				'CMerchant'	=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function Product_List()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			
			$id 		= $this->session->userdata('logged_id');
			$masuk		= "Menunggu Pembayaran";
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$products 	= $this->Admin_model->Product();
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data = [
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CProduct'	=> $this->Admin_model->Count_Buyer(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				'trans'		=> $trans,
				'product' 	=> $products, 
				'id' 		=> $record->id, 
				'username' 	=> $record->username, 
				'main_view' => 'Product_list',
				'nameAccess'=> $leveluser,
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function CariMerchant(){
		$id 	= $this->input->post('id');
        $data 	= $this->Admin_model->GetData(array('id' => $id), 'user_merchant');
        echo $data->id."|".$data->username."|".$data->phone."|".$data->email."|".$data->address."|".$data->last_update;
	}
	public function Transaction_Success($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			
			$id 		= $this->session->userdata('logged_id');
			$limit 		= 10;
			$where 		= array('product_order_detail.status' => 'Selesai');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Success';
			$config['total_rows'] = $this->Admin_model->Total_Records_Transaction($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction= $this->Admin_model->Order(array("product_order_detail.status" => $berhasil));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				//'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'A_OrderFinish',
				'nameAccess'=> $leveluser,
				'A_Transaction' => $this->Admin_model->GetDataOrder($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}

	public function Transaction_Masuk($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			
			$id 		= $this->session->userdata('logged_id');
			$limit = 10;
			$where = array('product_order_detail.status' => 'Proses Ditujukan Ke Merchant');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Masuk';
			$config['total_rows'] = $this->Admin_model->Total_Records_Transaction($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction = $this->Admin_model->Order(array("product_order_detail.status" => $masuk));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'A_OrderIn',
				'nameAccess'=> $leveluser,
				'A_Transaction' => $this->Admin_model->GetDataOrder($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function Transaction_Batal($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 		= $this->session->userdata('logged_id');
			$limit = 10;
			$where = array('product_order_detail.status' => 'Order Dibatalkan');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Batal';
			$config['total_rows'] = $this->Admin_model->Total_Records_Transaction($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction = $this->Admin_model->Order(array("product_order_detail.status" => $batal));
			$bill = array('bill.status' => 'Tagihkan Ke Admin');
			$end = array('bill.status' => 'Penagihan Selesai');

			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'Penagihan'  		=> $this->Product_model->Count_Penagihan(),
				'transaksi'			=> $this->Product_model->orderin($where,$limit,$offset),
				'PenagihanMasuk'	=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 		=> $this->Product_model->CountBillSent($end),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'A_OrderCancel',
				'nameAccess'=> $leveluser,
				'A_Transaction' => $this->Admin_model->GetDataOrder($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function Transaction_Kirim($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 		= $this->session->userdata('logged_id');
			$limit = 10;
			$where = array('product_order_detail.status' => 'Proses Kirim');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Batal';
			$config['total_rows'] = $this->Admin_model->Total_Records_Transaction($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction = $this->Admin_model->Order(array("product_order_detail.status" => $pengiriman));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'transaksi'			=> $this->Product_model->orderin($where,$limit,$offset),
				'PenagihanMasuk'	=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 		=> $this->Product_model->CountBillSent($end),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'A_OrderSent',
				'nameAccess'=> $leveluser,
				'A_Transaction' => $this->Admin_model->GetDataOrder($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function CariProduk(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id 	= $this->input->post('id');
			$data 	= $this->Admin_model->GetDataProduct(array('product.id' => $id));
			echo $data->proid."|".$data->product_name."|".$data->username."|".$data->cat_name."|".$data->status."|".$data->description."|".$data->price."|".$data->stock;
		}
		else{
			redirect('Auth');
		}

	}
	public function CariTransaction(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id 	= $this->input->post('id');
			$data 	= $this->Admin_model->GetDataTransaction(array('product_order_detail.id' => $id));
			echo $data->id_detail."|".$data->product_name."|".$data->amount."|".$data->code."|".$data->product_id;
		}
		else{
			redirect('Auth');
		}
	}
	public function Update_Product()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			$id = $this->uri->segment(3);
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('id_produk', 'ID Product', 'trim|required');
				$this->form_validation->set_rules('product', 'Nama Product', 'trim|required');
				$this->form_validation->set_rules('harga', 'Harga', 'trim|required');
				$this->form_validation->set_rules('stock', 'Stock', 'trim|required');
				$this->form_validation->set_rules('description', 'Description', 'trim|required');
				if ($this->form_validation->run() == TRUE) {
					if ($this->Product_model->edit_product() == TRUE) {
						redirect('Admin/Product_List');
					}
					else {
						$data['notif'] = 'Update gagal';
						$data['main_view'] = 'edit_Product';
						$this->load->view('template', $data);
					}
				}
				else {
					$data['notif'] = validation_errors();
					$data['main_view'] = 'edit_Product';
					$this->load->view('template', $data);
				}
			}
			else {
				$data['main_view'] = 'edit_Product';
				$this->load->view('template', $data);
			}
		}
		else {
			redirect('Auth');
		}
	}
	public function Transfer()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			$id = $this->uri->segment(3);
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('id_bill', 'ID Bill', 'trim|required');
				$this->form_validation->set_rules('nomor', 'Nomor T-Cash', 'trim|required');
				$this->form_validation->set_rules('pin', 'PIN T-Cash', 'trim|required');
				$this->form_validation->set_rules('last_update', 'Date', 'trim|required');
				if ($this->form_validation->run() == TRUE) {
					if ($this->Product_model->UpdateBill() == TRUE) {
						redirect('Admin/Penagihan');
					}
					else {
						$data['notif'] = 'Update gagal';
						$data['main_view'] = 'Penagihan';
						$this->load->view('template', $data);
					}
				}
				else {
					$data['notif'] = validation_errors();
					$data['main_view'] = 'Penagihan';
					$this->load->view('template', $data);
				}
			}
			else {
				$data['main_view'] = 'Penagihan';
				$this->load->view('template', $data);
			}
		}
		else {
			redirect('Auth');
		}
	}
	public function discussion()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			if($this->session->userdata('leveluser') == 1){
							$leveluser = 'Administrator';
						}else{
							$leveluser = 'Merchant';
						}
						$masuk 			="Pesanan ditujukan ke Merchant";
						$id 			= $this->session->userdata('logged_id');
						$list_discuss 	= $this->Product_model->GetDiscussList(array("product.merchant_id" => $id));
						$record 		= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
						$trans 			= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
						$bill 			= array('bill.status' => 'Tagihkan Ke Admin');
						$end 			= array('bill.status' => 'Penagihan Selesai');

							$data=
						[	
							'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
							'Sent'			=> $this->Product_model->Count_OrderSent(),
							'Finish'		=> $this->Product_model->Count_OrderFinish(),
							'Cancel'		=> $this->Product_model->Count_OrderCancel(),
							'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
							'CBuyer'			=> $this->Admin_model->Count_Buyer(),
							'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
							'PenagihanMasuk'	=> $this->Product_model->CountBillSent($bill),
							'PenagihanEnd' 		=> $this->Product_model->CountBillSent($end),
							'list_discuss'		=> $list_discuss,
							'username'			=> $record->username,
							'trans'				=> $trans,
							'main_view'			=>	'Discussion',
							'nameAccess'		=> $leveluser,
							
						];
						$this->load->view('template', $data);
		}
		else{
			redirect('Auth');
		}
		
	}
	public function Edit_Product()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 	= $this->session->userdata('logged_id');
			$aw 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$id 	= $this->uri->segment(3);
			$masuk	= 'Pesanan ditujukan ke Merchant';
			$record = $this->Product_model->GetData(array("id" => $id) , 'Product');
			//$record = $this->Product_model->GetData(array("id" => $id) , 'Product');
			$trans	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$bill 	= array('bill.status' => 'Tagihkan Ke Admin');
			$end 	= array('bill.status' => 'Penagihan Selesai');

			$data = [
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'trans'     => $trans,
				'main_view' => 'Admin_EditProduct', 
				'CMerchant'	=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'	=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				'username' 	=> $aw->username, 
				'id' 		=> $record->id, 
				'nama' 		=> $record->name, 
				'stock' 	=> $record->stock, 
				'harga' 	=> $record->price, 
				'category' 	=> $record->category_id, 
				'deskripsi' => $record->description, 
				'foto' 		=> $record->image,
				'nameAccess'=> $leveluser
				];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function Checkout()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 		= $this->session->userdata('logged_id');
			$masuk		= "Pesanan ditujukan ke Merchant";
			$Selesai 	= "Selesai";
			$feedback	= $this->Product_model->Get_Feedback(array("merchant_id" => $id, "product_order_detail.status" => $Selesai), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$id_detail	= $this->uri->segment(3);
			$cek 		= $this->Product_model->CheckoutTransfer(array("bill.id" => $id_detail));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data 				= 
			[
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'CMerchant'		=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'		=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
				'username'		=> $record->username,
				'C_Detail'		=> $cek,
				'trans'			=> $trans,
				'feedback'		=> $feedback,
				'main_view'		=> 'checkout',
				'nameAccess'	=> $leveluser
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}

	}
	public function Penagihan($offset = NULL)
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			if($this->session->userdata('leveluser') == 1){
							$leveluser = 'Administrator';
						}else{
							$leveluser = 'Merchant';
						}
						$masuk		= "Pesanan ditujukan ke Merchant";
						$pengiriman	= "Proses Kirim";

						$berhasil	= "Selesai";
						$selesai 	= "Selesai";
						$id 		= $this->session->userdata('logged_id');
						$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
						$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
						$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
						$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
						$limit 		= 10;
						$where 		= array('bill.status' => 'Tagihkan Ke Admin');
						$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
						$end 		= array('bill.status' => 'Penagihan Selesai');


						if(!is_null($offset))
						{
							$offset = $this->uri->segment(3);
						}
						$this->load->library('Pagination');
						$config['uri_segment'] = 3;
						$config['base_url'] = base_url().'index.php/progress/OrderFinish';
						$config['total_rows'] = $this->Product_model->Total_Tagihan($where);
						$config['per_page'] = $limit;
						$config['num_links'] = 3;
						$config['full_tag_open'] = "<ul class='pagination'>";
						$config['full_tag_close'] = "</ul>";
						$config['num_tag_open'] = '<li>';
						$config['num_tag_close'] = '</li>';
						$config['cur_tag_open'] = "<li class='active'><a href='#'>";
						$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
						$config['next_tag_open'] = "<li>";
						$config['next_tagl_close'] = "</li>";
						$config['prev_tag_open'] = "<li>";
						$config['prev_tagl_close'] = "</li>";
						$config['first_tag_open'] = "<li>";
						$config['first_tagl_close'] = "</li>";
						$config['last_tag_open'] = "<li>";
						$config['last_tagl_close'] = "</li>";
						$this->pagination->initialize($config);
					$data = 
					[
					'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
					'Sent'			=> $this->Product_model->Count_OrderSent(),
					'Finish'		=> $this->Product_model->Count_OrderFinish(),
					'Cancel'		=> $this->Product_model->Count_OrderCancel(),
					'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
					'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
					'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
					'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
					'PenagihanEnd' => $this->Product_model->CountBillSent($end),
					'transaksi'	=> $this->Product_model->Bill($where,$limit,$offset),
					'main_view' => 'Penagihan',
					'trans'		=> $trans,
					'username'	=> $record->username,
					'success'	=> $success,
					'nameAccess'	=> $leveluser,
					'head'		=> 'Order Selesai',
					'CMerchant'	=> $this->Admin_model->Count_Merchant() - 1, 
					'CBuyer'	=> $this->Admin_model->Count_Buyer(),
					'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
					];
					$this->load->view('template',$data);
		}
		else{
			redirect('Auth');
		}
			
	}
	
	public function Penagihan_Selesai($offset = NULL)
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$masuk		= "Pesanan ditujukan ke Merchant";
			$pengiriman	= "Proses Kirim";

			$berhasil	= "Selesai";
			$selesai 	= "Selesai";
			$id 		= $this->session->userdata('logged_id');
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit 		= 10;
			$where 		= array('bill.status' => 'Penagihan Selesai');
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/progress/OrderFinish';
			$config['total_rows'] = $this->Product_model->Total_Tagihan($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
		$data = 
		[
		'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
		'Sent'			=> $this->Product_model->Count_OrderSent(),
		'Finish'		=> $this->Product_model->Count_OrderFinish(),
		'Cancel'		=> $this->Product_model->Count_OrderCancel(),
		'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
		'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
		'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
		'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
		'PenagihanEnd' => $this->Product_model->CountBillSent($end),
		'transaksi'	=> $this->Product_model->Bill($where,$limit,$offset),
		'CMerchant'	=> $this->Admin_model->Count_Merchant() - 1, 
		'CBuyer'	=> $this->Admin_model->Count_Buyer(),
		'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
		'C_Product' => $Count_Product,
		'main_view' => 'PenagihanSelesai',
		'trans'		=> $trans,
		'username'	=> $record->username,
		'success'	=> $success,
		'nameAccess'	=> $leveluser,
		'head'		=> 'Order Selesai'
		];
		$this->load->view('template',$data);
		}
		else{
			redirect('Auth');
		}
	}
	public function cariProsesKirim()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
				$id = $this->input->post('id');
        $data = $this->Admin_model->GetDataProsesKirim(array('product_order_detail.id' => $id));
        echo $data->id_detail."|".$data->order_id."|".$data->product_id."|".$data->product_name."|".$data->merchant_id."|".$data->username."|".
        	 $data->phone."|".$data->email."|".$data->amount."|".$data->price_item."|".$data->code;

		}
		else{
			redirect('Auth');
		}
		
	}
	public function Broadcast()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 				= $this->session->userdata('logged_id');
			$masuk				= "Pesanan ditujukan ke Merchant";
			$Selesai 			= "Selesai";
			$feedback	 		= $this->Product_model->Get_Feedback(array("merchant_id" => $id, "product_order_detail.status" => $Selesai), 'product_order_detail');
			$trans	 			= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$record 			= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$bill = array('bill.status' => 'Tagihkan Ke Admin');
			$end = array('bill.status' => 'Penagihan Selesai');
			$data 				= 
			[
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
				'CMerchant'		=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'		=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'=>  $this->Admin_model->Count_Product(),
				'C_Product' => $Count_Product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'feedback'	=> $feedback,
				'main_view'	=> 'Broadcast',
				'nameAccess'	=> $leveluser
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}

	public function config(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 				= $this->session->userdata('logged_id');
			
			$id 				= $this->session->userdata('logged_id');
			$masuk				= "Pesanan ditujukan ke Merchant";
			$Selesai 			= "Selesai";
			$feedback	 		= $this->Product_model->Get_Feedback(array("merchant_id" => $id, "product_order_detail.status" => $Selesai), 'product_order_detail');
			$trans	 			= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$record 			= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$bill = array('bill.status' => 'Tagihkan Ke Admin');
			$end = array('bill.status' => 'Penagihan Selesai');
		$data = 
			[
			'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' 	=> $this->Product_model->CountBillSent($end),
				'CMerchant'		=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'		=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'=>  $this->Admin_model->Count_Product(),
				'C_Product' => $Count_Product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'feedback'	=> $feedback,
				
				'nameAccess'	=> $leveluser,
			'slide1' => $this->Product_model->GetDataa(array("code" => "SLIDE1") , 'config')->row('value'),
			'slide2' => $this->Product_model->GetDataa(array("code" => "SLIDE2") , 'config')->row('value'),
			'slide3' => $this->Product_model->GetDataa(array("code" => "SLIDE3") , 'config')->row('value'),
			'main_view' => 'config',
		];
			$this->load->view('template', $data);
		}
		else{
			redirect('Auth');
		}

	}
	public function changeslide(){
			if ($this->session->userdata('logged_in') == true) {
      
            // $this->form_validation->set_rules('last_update', 'Data Tanggal', 'trim|required');

                $config['upload_path'] = './assets/images';
                $config['allowed_types'] = 'jpg|png';
                $config['max_size']  = '2000';
                
                $this->load->library('upload', $config);
                $this->upload->initialize($config);
                if ($this->upload->do_upload('fotoslide')){
            
                  if ($this->Product_model->edit_slide($this->upload->data()) == TRUE) {
                        // jika sukses
                        $this->session->set_flashdata('notif', 'Selamat, Edit slide anda berhasil');
                        redirect('Admin/Config');
                    } else {
                        $this->session->set_flashdata('notif', 'Maaf, Edit Slide anda gagal');
                        redirect('Admin/Config');
                    }
            
        }
            else {
            	$notif = $this->upload->display_errors();
                $this->session->set_flashdata('notif',  $notif);
                        redirect('Admin/Config');
             } 
            
    }else {
        redirect('Admin');
    }
	}
	
	public function DetailTagihan()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id= $this->uri->segment(3);
		$where = array('bill.id' => $id);
		$payment = $this->Admin_model->DataPrintBill($where);
		$data = 
		[
			'list_payment' => $payment,
		];
		$this->load->view('Print',$data);
		}
		else{
			redirect('Auth');
		}
		
	}
	public function Broadcast_in()
	{
		if ($this->input->post('submit')) {
		# code...
		}
		$this->form_validation->set_rules('for_id', 'Penerima', 'trim|required');
		$this->form_validation->set_rules('subject', 'Subject', 'trim|required');
		$this->form_validation->set_rules('text', 'Message', 'trim|required');				
		if ($this->session->userdata('logged_in') == TRUE) {
			if ($this->form_validation->run() == TRUE) {
				if ($this->Product_model->add_broadcast() == TRUE) {
					$this->session->set_flashdata('notif', 'Selamat, proses broadcast anda berhasil');
				redirect('Admin/Broadcast');
				}else {
					$this->session->set_flashdata('notif', 'Maaf, proses broadcast anda gagal');
					redirect('Admin/Broadcast');
				}
			}
			else{
				$this->session->set_flashdata('notif', validation_errors());
       			redirect('Admin/Broadcast');
       		}
	} else{
		redirect('Admin','refresh');
	}
	}
	public function DetailTransaction()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id= $this->uri->segment(3);
		$where = array('product_order_detail.id' => $id);
		$payment = $this->Admin_model->DataPrintTransaction($where);
		$data = 
		[
			'list_payment' => $payment,
		];
		$this->load->view('Print',$data);
		}
		else{
			redirect('Auth');
		}

	}
	public function DetailLaporan()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id= $this->uri->segment(3);
		$where = array('product_order_detail.order_id' => $id);
		$laporan = $this->Admin_model->GetLaporan($where);
		$data= 
		[
			'list_laporan' =>$laporan,
		];
		$this->load->view('DetailLaporan', $data);
		}
		else{
			redirect('Auth');
		}
		
	}
	public function DetilLaporan()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id= $this->uri->segment(3);
		$where = array('product_order_detail.order_id' => $id);
		$laporan = $this->Admin_model->GetLaporan($where);
		$data= 
		[
			'list_laporan' =>$laporan,
		];
		$this->load->view('DetilLaporan', $data);
		}
		else{
			redirect('Auth');
		}
		
	}
	public function BroadcastBill()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$this->load->view('Broadcast', $data);
		}
		else{
			redirect('Auth');
		}
		
	}
	
	public function ProductPending($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			
			$id 		= $this->session->userdata('logged_id');
			$limit = 10;
			$where = array('approve' => 0);
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Masuk';
			$config['total_rows'] = $this->Admin_model->Count_Pending($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction = $this->Admin_model->Order(array("product_order_detail.status" => $masuk));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				//'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'Product_Pending',
				'nameAccess'=> $leveluser,
				'A_Transaction' => $this->Admin_model->GetProductPending($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function CariPending()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id 	= $this->input->post('id');
        $data 	= $this->Admin_model->GetPending(array('Product.id' => $id));
        echo $data->id_product."|".$data->product_name."|".$data->stock."|".$data->username."|".$data->username;
		}
		else{
			redirect('Auth');
		}
		
	}
	public function ChangePending()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id 			= $this->input->post('id');
		$approve			= $this->input->post('approve');
		$result 		= $this->Admin_model->ChangePending($id,$approve);
		echo $result;
		}
		else{
			redirect('Auth');
		}
		
	}
	public function Laporan($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			
			$id 		= $this->session->userdata('logged_id');
			$limit 		= 10;
			$where 		= array('product_order_detail.status' => 'Selesai');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Success';
			$config['total_rows'] = $this->Admin_model->Total_Records_Transaction($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction= $this->Admin_model->Order(array("product_order_detail.status" => $berhasil));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');

			$result 		= $this->Admin_model->DataLaporan(array("product_order_detail.status" => 'Selesai'));
			$deliv 	= array();
			foreach ($result as $data) {
				$deliv[$data->id_order] = $data->fee_delivery;
			}

			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				//'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'Laporan',
				'deliv'		=> $deliv,
				'nameAccess'=> $leveluser,
				'A_Transaction' => $this->Admin_model->GetDataLaporan($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function LaporanbyTrans($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1)
			{
				$leveluser = 'Administrator';
			}else
			{
				$leveluser = 'Merchant';
			}
			
			$id 		= $this->session->userdata('logged_id');
			$limit 		= 10;
			$where 		= array('product_order_detail.status' => 'Selesai');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/Admin/Transaction_Success';
			$config['total_rows'] = $this->Admin_model->Total_Records_Transaction($where);
			$config['per_page'] = $limit;
			$config['num_links'] = 3;
			$config['full_tag_open'] = "<ul class='pagination'>";
			$config['full_tag_close'] = "</ul>";
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['cur_tag_open'] = "<li class='active'><a href='#'>";
			$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$config['next_tag_open'] = "<li>";
			$config['next_tagl_close'] = "</li>";
			$config['prev_tag_open'] = "<li>";
			$config['prev_tagl_close'] = "</li>";
			$config['first_tag_open'] = "<li>";
			$config['first_tagl_close'] = "</li>";
			$config['last_tag_open'] = "<li>";
			$config['last_tagl_close'] = "</li>";
			$this->pagination->initialize($config);
			//$b = $this->Product_model->feedback(array("merchant_id" => $id),'product_order_detail');

			
			$batal		= "Order Dibatalkan";
			$berhasil	= "Selesai";
			$pengiriman	= "Proses Kirim";
			$masuk		= "Pesanan ditujukan ke Merchant";
			$wher		= "merchant_id = "+$id+",product_order_detail.status = "+$masuk+",product_order_detail";
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$stock 		= $this->Product_model->Stock(array("product_order_detail.merchant_id" => $id), 'product_order_detail');
			$product 	= $this->Product_model->Order(array("merchant_id" => $id), 'product_order');
			$failed 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $batal), 'product_order_detail');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$wait	 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail');
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$count 		= count($wait);
			$A_Transaction= $this->Admin_model->Order(array("product_order_detail.status" => $berhasil));
			$bill 		= array('bill.status' => 'Tagihkan Ke Admin');
			$end 		= array('bill.status' => 'Penagihan Selesai');
			
			$data=
			[
				'Confirm'	=> $this->Admin_model->Trans_Masuk(),
				'Sent'		=> $this->Admin_model->Trans_Kirim(),
				'Finish'	=> $this->Admin_model->Trans_Selesai(),
				'Cancel'	=> $this->Admin_model->Trans_Batal(),
				'CMerchant'			=> $this->Admin_model->Count_Merchant() - 1, 
				'CBuyer'			=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	=>  $this->Admin_model->Count_Product(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				//'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'LaporanbyTrans',
				'nameAccess'=> $leveluser,
				
				'A_Transaction' => $this->Admin_model->GetDataLaporanByOrder($where,$limit,$offset),
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
}

/* End of file Admin.php */
/* Location: ./application/controllers/Admin.php */
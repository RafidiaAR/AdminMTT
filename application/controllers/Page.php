<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Page extends CI_Controller

{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Product_model');
		$this->load->model('User_model');
		$this->load->model('Admin_model');
	}

	public function test()
	{
		$id = $this->session->userdata('logged_id');
		$result = $this->Product_model->GetLaporanProduct($id);
			$allamount = array();
			foreach ($result as $data) {
				$allamount[$data->product_id]= $data->amount;
		}
		echo implode($allamount, ',');
	}

	public function index()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id = $this->session->userdata('logged_id');
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$produk = count($this->Product_model->GetListData(['merchant_id'=>$id], 'Product'));
			$masuk		= "Pesanan ditujukan ke Merchant";
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$totaltrans	= count($this->Product_model->Order(array("merchant_id" => $id), 'product_order_detail'));
			$totalmerchant = count($this->Product_model->GetAllData('User_merchant'));
			$products = $this->Product_model->product(array("product_order_detail.merchant_id" => $id, "product_order_detail.status" => 'Selesai') , 'product_order_detail');
			$A_Product = $this->Product_model->AdminProduct(array("product_order_detail.status" => 'Selesai'),'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			/*Admin Controller Start*/
			$A_AmountTransaction 	= count($this->Admin_model->Transaction());
			$A_AmountMerchant 		= $this->Admin_model->Count_Merchant() - 1;
			$A_AmountProduct		= $this->Admin_model->Count_Product();
			/*Admin Controller End*/
			$result = $this->Product_model->GetLaporanProduct(array("product_order_detail.merchant_id"=> $id, "product_order_detail.status" => 'Selesai'));
			$results = $this->Product_model->GetLaporanProduct(array("product_order_detail.status" => 'Selesai'));
			$A_allamount = array();
			foreach ($results as $data) {
				$A_allamount[$data->product_id] = $data->totaljual;
			}
			$allamount = array();
			foreach ($result as $data) {
				$allamount[$data->product_id]= $data->totaljual;
			}


			$data = [
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'CMerchant'	=> $this->Admin_model->Count_Merchant(),
				'CBuyer'	=> $this->Admin_model->Count_Buyer(),
				'totalmerchant' => $totalmerchant,
				'jmlh_produk' 	=> $produk,
				'totaltrans'	=> $totaltrans, 
				'id' 			=> $record->id, 
				'username' 		=> $record->username, 
				'email' 		=> $record->email, 
				'phone' 		=> $record->phone,
				'trans'			=> $trans,
				'main_view' 	=> 'dashboard',
				'nameAccess'	=> $leveluser,
				'product'		=> $products,
				'allamount'		=> $allamount,
				'C_Product' => $Count_Product,
				/*Admin Data Start*/
				'A_allamount'	=> $A_allamount,
				'A_Product'			  => $A_Product,
				'A_AmountTransaction' => $A_AmountTransaction,
				'A_AmountMerchant'	  => $A_AmountMerchant,
				'A_AmountProduct'	  =>  $this->Admin_model->Count_Product()
				/*Admin Data End*/
				];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}

	public function add_product()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('merchant_id', 'Merchant ID', 'trim|required');
				$this->form_validation->set_rules('id_produk', 'ID Product', 'trim|required');
				$this->form_validation->set_rules('product', 'Nama Product', 'trim|required');
				$this->form_validation->set_rules('harga', 'Harga', 'trim|required');
				$this->form_validation->set_rules('stock', 'Stock', 'trim|required');
				$this->form_validation->set_rules('description', 'Description', 'trim|required');
				$this->form_validation->set_rules('category', 'Category', 'trim|required');
				$this->form_validation->set_rules('type', 'Type', 'trim|required');
				$this->form_validation->set_rules('status', 'Status', 'trim|required');
				$this->form_validation->set_rules('created_at', 'Created', 'trim|required');
				$A_AmountTransaction 	= count($this->Admin_model->Transaction());
				$A_AmountMerchant 		= $this->Admin_model->Count_Merchant() - 1;
				$A_AmountProduct		= $this->Admin_model->Count_Product();
				$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
				if ($this->form_validation->run() == TRUE) {
					$config['upload_path'] = './assets/images/';
					$config['allowed_types'] = 'gif|jpg|png|jpeg';
					$config['max_size'] = '2000';
					$this->load->library('upload', $config);
					if ($this->upload->do_upload('foto')) {
						if ($this->Product_model->add_product($this->upload->data()) == TRUE) {
							$id = $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int = (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid = $int + 1;

							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'main_view'		=> 'add_product',
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> 'Tambah Produk Berhasil',
								'C_Product' => $Count_Product,
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
								
							];
							$this->load->view('template', $data);
						}
						else {
							$id = $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int = (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid = $int + 1;
							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'main_view'		=> 'add_product',
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> 'Tambah Produk Gagal',
								'C_Product' => $Count_Product,
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),	
								
							];
							$this->load->view('template', $data);
						}
					}
					else {
							$id = $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int = (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid = $int + 1;
							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'main_view'		=> 'add_product',
								'C_Product' => $Count_Product,
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> $this->upload->display_errors(),
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
							];
							$this->load->view('template', $data);
					}
				}
				else {
							$id = $this->session->userdata('logged_id');
							$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
							$record2 	= $this->Product_model->GetAllData('Category');
							$int = (int) $this->Product_model->GetLastId('Product', 'id');
							$masuk		= "Pesanan ditujukan ke Merchant";
							$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
            				$newid = $int + 1;
							$data = [
								'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
								'Sent'			=> $this->Product_model->Count_OrderSent(),
								'Finish'		=> $this->Product_model->Count_OrderFinish(),
								'Cancel'		=> $this->Product_model->Count_OrderCancel(),
								'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
								'C_Product' => $Count_Product,
								'main_view'		=> 'add_product',
								'merchant_id'	=> $record->id,
								'username'		=> $record->username,
								'id_product'	=> $newid,
								'category'		=> $record2,
								'notif'			=> validation_errors(),
								'trans'			=> $trans,
								'nameAccess'	=> $leveluser,
								'A_AmountTransaction' => $A_AmountTransaction,
								'A_AmountMerchant'	  => $A_AmountMerchant,
								'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
								'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
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

	public function update_product()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			$id = $this->uri->segment(3);
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('id_produk', 'ID Product', 'trim|required');
				$this->form_validation->set_rules('product', 'Nama Product', 'trim|required');
				$this->form_validation->set_rules('harga', 'Harga', 'trim|required');
				$this->form_validation->set_rules('stock', 'Stock', 'trim|required');
				$this->form_validation->set_rules('description', 'Description', 'trim|required');
				$this->form_validation->set_rules('last_update', 'Last Update', 'trim|required');
				if ($this->form_validation->run() == TRUE) {
					if ($this->Product_model->edit_product() == TRUE) {
						if($this->session->userdata('leveluser') == 0 || $this->session->userdata('leveluser') == NULL ){
							redirect('Page/product_list');	
						}if($this->session->userdata('leveluser') == 1)
						{
							redirect('Admin/Product_List');
						}
						
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

	public	function update_profile()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			$id = $this->session->userdata('logged_id');
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('merchant_id', 'Merchant ID', 'trim|required');
				$this->form_validation->set_rules('username', 'Username', 'trim|required');
				$this->form_validation->set_rules('email', 'Email', 'trim|required');
				$this->form_validation->set_rules('phone', 'Phone', 'trim|required');
				if ($this->form_validation->run() == TRUE) {
					if ($this->User_model->edit_profile() == TRUE) {
						redirect('Page');
					}
					else {
						$data['notif'] = 'Update gagal';
						$data['main_view'] = 'Dashboard';
						$this->load->view('template', $data);
					}
				}
				else {
					$data['notif'] = validation_errors();
					$data['main_view'] = 'dashboard';
					$this->load->view('template', $data);
				}
			}
			else {
				$data['main_view'] = 'profile';
				$this->load->view('template', $data);
			}
		}
		else {
			redirect('Auth');
		}
	}

	public	function product_list()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id = $this->session->userdata('logged_id');
			$masuk		= "Menunggu Pembayaran";
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$products = $this->Product_model->product(array("product.merchant_id" => $id) , 'product');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));

			$data = [
				'Confirm'	=> $this->Product_model->Count_OrderMerchant(),
				'Sent'		=> $this->Product_model->Count_OrderSent(),
				'Finish'	=> $this->Product_model->Count_OrderFinish(),
				'Cancel'	=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'trans'		=> $trans,
				'C_Product' => $Count_Product,
				'product' 	=> $products, 
				'id' 		=> $record->id, 
				'username' 	=> $record->username, 
				'main_view' => 'product_list',
				'nameAccess'=> $leveluser
				];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public	function edit_Product()
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{	
				$leveluser = 'Merchant';
			}
			$id = $this->session->userdata('logged_id');
			$aw = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$id = $this->uri->segment(3);
			$masuk		= 'Pesanan ditujukan ke Merchant';
			$record = $this->Product_model->GetData(array("id" => $id) , 'Product');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$data = [
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'C_Product' => $Count_Product,
				'trans'     => $trans,
				'main_view' => 'edit_Product', 
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
	public function Delete_Product(){
		$id 	= $this->input->post('id');
        $result = $this->Product_model->del_product($id);
        echo $result;
	}
	public function Update_Order()
	{
		$order_id 		= $this->input->post('order_id');
		$stats 			= $this->input->post('status');
		$product_id 	= $this->input->post('product_id');
		$amount 		= $this->input->post('amount');
		$last_update 	= $this->input->post('last_update');
		$result 		= $this->Product_model->acc_order($product_id,$amount,$last_update,$order_id,$stats);
        echo $result;
	}
	
	public function SendComment()
	{
		
		if ($this->session->userdata('logged_in') == TRUE) {
			$id = $this->uri->segment(3);
			if ($this->input->post('submit')) {
				$this->form_validation->set_rules('comment', 'Komentar Diskusi', 'required');
				$this->form_validation->set_rules('product_id', 'ID Product', 'trim|required');
				
				if ($this->form_validation->run() == TRUE) {
					$comment 		= $this->input->post('comment');
					$product_id 	= $this->input->post('product_id');

					if ($this->Product_model->send_comment($product_id,$comment) == TRUE) {
						redirect('progress/discussion_detail/'.$product_id);
					}
					else {
						redirect('progress/discussion_detail/'.$product_id);
					}
				}
				else {
					redirect('progress/discussion_detail/'.$product_id);
				}
			}
			else {
				redirect('progress/discussion_detail/'.$product_id);
			}
		}
		else {
			redirect('Auth');
		}
	}

	public function Change_Status()
	{
		$id 			= $this->input->post('id');
		$status			= $this->input->post('status');
		$result 		= $this->Product_model->Change_Status($id,$status);
		echo $result;
	}
	public function Change_StatusBill()
	{
		$id 			= $this->input->post('id');
		$status			= $this->input->post('status');
		$result 		= $this->Product_model->Change_StatusBill($id,$status);
		echo $result;
	}
	public function Change_Bill()
	{
		$id 			= $this->input->post('id');
		$status			= $this->input->post('status');
		$order_id 		= $this->input->post('order_id');
		$pro_id 		= $this->input->post('product_id');
		$pro_name 		= $this->input->post('product_name');
		$mer_id 		= $this->input->post('merchant_id');
		$mer_name 		= $this->input->post('merchant_name');
		$mer_phone 		= $this->input->post('merchant_phone');
		$mer_email 		= $this->input->post('merchant_email');
		$statusnew 		= $this->input->post('statusbill');
		$amount 		= $this->input->post('amount');
		$price 			= $this->input->post('price');
		$date 			= $this->input->post('date');
		$result 		= $this->Product_model->Change_Bill($id,$status,$order_id,$pro_id,$pro_name,$mer_id,$mer_name,$mer_phone,$mer_email,$statusnew,$amount,$price,$date);
		echo $result;
	}
	
}

/* End of file page.php */
/* Location: ./application/controllers/page.php */


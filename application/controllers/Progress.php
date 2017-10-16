	<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Progress extends CI_Controller

{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('User_model');
		$this->load->model('Product_model');
		$this->load->library('pagination');
		$this->load->model('Admin_model');
	}

	public 	function index()
	{
		if ($this->session->userdata('logged_in') == true) {
			redirect('Page');
		}
		else {
			redirect('Auth/login');
		}
	}
	public function unseen_notification(){
<<<<<<< HEAD
		if($this->session->userdata('logged_in') == TRUE)
		{
			$view = $this->input->post('view');
=======
		$view = $this->input->post('view');
>>>>>>> origin/master
		if ($view == 'view') {
			$output = '';
			$result=$this->Product_model->notification();
			$count = count($this->Product_model->unseen_notification());
		
			if(!empty($result)){
				
				$output .= '<li>
                        <div class="notification_header">
                          <h3>You have '.$count.' new notification</h3>
                        </div>
                      </li>';
				foreach ($result as $notification) {

					if ($notification->type_notification == 'diskusi') {
						$link = base_url().'progress/discussion_detail/'.$notification->product_id;
					}
					else if ($notification->type_notification == 'order_waiting') {
						$link = base_url().'Admin/Transaction_Masuk';
					}
					else if ($notification->type_notification == 'order_process') {
						$link = base_url().'Admin/Transaction_Kirim';
					}
					else if ($notification->type_notification == 'order_finish') {
						$link = base_url().'Admin/Transaction_Success';
					}
					else if ($notification->type_notification == 'order_cancel') {
						$link = base_url().'Admin/Transaction_Batal';
					}
					else if ($notification->type_notification == 'Broadcast') {
						$link = '';
					}
					 if ($notification->type_notification == 'Broadcast') {
						$sign = '(Broadcast)';
					}
					else{
						$sign = '';	
					}

				$output .= '
				<a href="'.$link.'" target="_blank">
				 
				<li>
				 
                         <div class="notification_desc">
                        <p><span>'.$notification->subject.'</span>'.$notification->text.'</p>
                        <p><span>'.$notification->created_at.'</span>'.$sign.'</p>
                        </div>
                        <div class="clearfix"></div>  
                      
                     </li> 
                      </a>
			
               
				';	

				}
				$output .= '<li>
                        <div class="notification_bottom">
                          <a href="'.base_url().'Progress/notification">Lihat Semua Notifikasi</a>
                        </div> 
                      </li>';
			}
			else{
				$output .= '<li><a href="#">
                         <div class="notification_desc">
                        <p>Tidak ada notifikasi terbaru</p>
                        </div>
                        <div class="clearfix"></div>  
                       </a>
                     </li> 
                     <li>
                        <div class="notification_bottom">
                          <a href="'.base_url().'Progress/notification">Lihat Semua Notifikasi</a>
                        </div> 
                      </li>';
				}
			// $data = array(
			// 	'notification' => $output,
			// 	'amountNotifikasi' => $count
			// );
			echo $output.'|'.$count;

		}
		else if($view == 'notification_null'){
				$result	= $this->Product_model->nullNotification();
					if ($result == TRUE) {
						$count = '';
					}
					else{
						$count = count($this->Product_model->unseen_notification());
					}
			echo $count;
		}
<<<<<<< HEAD
		}
		else{
			redirect('Auth');
		}

		
	}
	public function mini_status(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			$view = $this->input->post('view');
=======
		
	}
	public function mini_status(){
		$view = $this->input->post('view');
>>>>>>> origin/master
		if ($view == 'view') {
			$output = '';
			$count = 0;	
			$result=$this->Product_model->GetMiniStatus();
			if(!empty($result)){

					
				$count = 0;	
				foreach ($result as $notification) {

				
					if ($notification->status_order_detail == 'Proses Kirim') {
						$link = base_url().'Admin/Transaction_Kirim';
					}
					else if ($notification->status_order_detail == 'Pesanan ditujukan ke Merchant') {
						$link = base_url().'Admin/Transaction_Masuk';
					}

					if ($notification->status_order_detail == 'Proses Kirim') {
						$text = '  menunggu pengiriman order '.$notification->product_name.' oleh anda';
					}
					else if ($notification->status_order_detail == 'Pesanan ditujukan ke Merchant') {
					$text = '  telah memesan '.$notification->product_name.'. Cepat terima order !';
					}
					
				if ($notification->status_order_detail == 'Pesanan ditujukan ke Merchant') {
					$count++;
				}
				else if ($notification->status_order_detail == 'Proses Kirim') {
					$count++;
				}
				
				$output .= '
				<a href="'.$link.'" target="_blank">
				 
				<li>
				 
                         <div class="notification_desc">
                        <p><span>'.$notification->buyer.'</span>'.$text.'</p>
                        <p><span>'.gmdate('Y-m-d H:i:s', $notification->created_at/1000).'</span></p>
                        </div>
                        <div class="clearfix"></div>  
                      
                     </li> 
                      </a>
			
               
				';		
				
				
				}
				if ($output != '') {
					$output .= ' <li>
                        <div class="notification_bottom">
                          <a href="'.base_url().'Admin/Transaction_Masuk">Lihat Semua Order</a>
                        </div> 
                      </li>';
				}
				else{
					$output .= '<li><a href="#">
                         <div class="notification_desc">
                        <p>Tidak ada order terbaru</p>
                        </div>
                        <div class="clearfix"></div>  
                       </a>
                     </li> 
                     <li>
                        <div class="notification_bottom">
                          <a href="'.base_url().'Admin/Transaction_Success">Lihat Semua Order</a>
                        </div> 
                      </li>';
				}
				
			}
			else{
				$output .= '<li><a href="#">
                         <div class="notification_desc">
                        <p>Tidak ada order terbaru</p>
                        </div>
                        <div class="clearfix"></div>  
                       </a>
                     </li> 
                     <li>
                        <div class="notification_bottom">
                          <a href="'.base_url().'Admin/Transaction_Success">Lihat Semua Order</a>
                        </div> 
                      </li>';
				
				}
			// $data = array(
			// 	'notification' => $output,
			// 	'amountNotifikasi' => $count
			// );
			echo $output.'|'.$count;

		}
<<<<<<< HEAD
		}
		else{
			redirect('Auth');
		}
=======
		
		
>>>>>>> origin/master
	}
	public function add_product()
	{
		if ($this->session->userdata('logged_in') == true) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id = $this->session->userdata('logged_id');
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$record2 	= $this->Product_model->GetAllData('Category');
			$int = (int) $this->Product_model->GetLastId('Product', 'id');
            $newid = $int + 1;
            $masuk		= "Pesanan ditujukan ke Merchant";
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$data = [
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'C_Product' => $Count_Product,
				'trans'			=> $trans,
				'main_view'		=> 'add_product',
				'merchant_id'	=> $record->id,
				'username'		=> $record->username,
				'id_product'	=> $newid,
				'category'		=> $record2,
				'nameAccess'	=> $leveluser,
				'CMerchant'	=> $this->Admin_model->Count_Merchant(),
				'CBuyer'	=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),

			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth/login');
		}
	}
	public function List_merchant()
	{
		if($this->session->userdata('logged_in') == TRUE)
		{

		}else{

		}
	}
	public function profile(){
		if ($this->session->userdata('logged_in') == true) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id = $this->session->userdata('logged_id');

			$masuk		= "Pesanan ditujukan ke Merchant";
			$record = $this->Product_model->GetData(array("id" => $id) , 'User_merchant');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$bill = array('bill.status' => 'Tagihkan Ke Admin');
			$end = array('bill.status' => 'Penagihan Selesai');
			$data = [
				'PenagihanMasuk'=> $this->Product_model->CountBillSent($bill),
				'PenagihanEnd' => $this->Product_model->CountBillSent($end),
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'CMerchant'	=> $this->Admin_model->Count_Merchant(),
				'CBuyer'	=> $this->Admin_model->Count_Buyer(),
				'A_AmountProduct'	  =>  $this->Admin_model->Count_Product(),
				'C_Product' => $Count_Product,
				'trans'		=> $trans,	
				'main_view' => 'edit_Product', 
				'id' 		=> $record->id, 
				'username' 	=> $record->username, 
				'email' 	=> $record->email, 
				'phone' 	=> $record->phone,
				'almt'		=> $record->address,
				'nik'		=> $record->nik_tsel,
				'nameAccess'	=> $leveluser
				];

			$data['main_view'] = 'profile';
			$this->load->view('template',$data);
		}
		else {
			redirect('Auth/login');
		}
	}

	public	function transaction($offset = NULL)
	{
		if ($this->session->userdata('logged_in') == TRUE) {
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$id 		= $this->session->userdata('logged_id');
			$limit = 10;
			$where = array('merchant_id' => $this->session->userdata('logged_id'),
                           'product_order_detail.status' => 'Proses Ditujukan ke Merchant');
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/progress/transaction';
			$config['total_rows'] = $this->Product_model->total_record_transaction($where);
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
			$masuk		= "Proses Ditujukan ke Merchant";
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
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$data=
			[
				'Confirm'	=> $this->Product_model->Count_OrderMerchant(),
				'Sent'		=> $this->Product_model->Count_OrderSent(),
				'Finish'	=> $this->Product_model->Count_OrderFinish(),
				'Cancel'	=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
				'C_Product' => $Count_Product,
			//	'feedback'	=> $b,
				'stock'		=> $stock,
				'wait'		=> $wait,
				'sent'		=> $sent,
				'success'	=> $success,
				'fail'		=> $failed,
				'order'		=> $product,
				'username'	=> $record->username,
				'trans'		=> $trans,
				'main_view'	=>	'transaction',
				'nameAccess'=> $leveluser,
			];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}

	public function discussion(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$masuk ="Pesanan ditujukan ke Merchant";
			$id = $this->session->userdata('logged_id');
			$list_discuss = $this->Product_model->GetDiscussList(array("product.merchant_id" => $id));
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$trans = count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
				$data=
			[	
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'C_Product' => $Count_Product,
				'list_discuss'	=> $list_discuss,
				'username'		=> $record->username,
				'trans'			=> $trans,
				'main_view'	=>	'Discussion',
				'nameAccess'	=> $leveluser

			];
			$this->load->view('template', $data);
		}
		else{
			redirect('Auth');
		}
		
	}
	public function discussion_detail(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			if($this->session->userdata('leveluser') == 1){
				$leveluser = 'Administrator';
			}else{
				$leveluser = 'Merchant';
			}
			$masuk 			="Pesanan ditujukan ke Merchant";
			$id 			= $this->session->userdata('logged_id');
			$product_id 	= $this->uri->segment(3);
			$product_name 	= $this->Product_model->GetData(array("id" => $product_id) , 'product');
			$detail_discuss = $this->Product_model->GetDiscussDetail(array("discussion.product_id" => $product_id));
			$record 		= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$trans 			= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
				$data=
			[	
				'Confirm'		=> $this->Product_model->Count_OrderMerchant(),
				'Sent'			=> $this->Product_model->Count_OrderSent(),
				'Finish'		=> $this->Product_model->Count_OrderFinish(),
				'Cancel'		=> $this->Product_model->Count_OrderCancel(),
				'Penagihan'  	=> $this->Product_model->Count_Penagihan(),
				'ProsesPenagihan'=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'=> $this->Product_model->Count_PenagihanSelesai(),
				'C_Product' => $Count_Product,
				'product'		=> $product_name,
				'detail_discuss'	=> $detail_discuss,
				'username'		=> $record->username,
				'trans'			=> $trans,
				'main_view'	=>	'Discussion_detail',
				'nameAccess'	=> $leveluser
			];
			$this->load->view('template', $data);
<<<<<<< HEAD
		}
		else{
			redirect('Auth');
		}
		
=======
>>>>>>> origin/master
	}

	
	public function OrderSent($offset = NULL)
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
			$id 		= $this->session->userdata('logged_id');
			$record 	= $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit 		= 10;
			$where 		= array('merchant_id' => $id,
                           'product_order_detail.status' => $pengiriman);
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/progress/OrderSent';
			$config['total_rows'] = $this->Product_model->total_record_transaction($where);
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
		'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
		'C_Product' => $Count_Product,
		'main_view' => 'OrderSent',
		'trans'		=> $trans,
		'username'	=> $record->username,
		'sent'		=> $sent,
		'nameAccess'	=> $leveluser
		];
		$this->load->view('template',$data);
		}
		else{
			redirect('Auth');
		}
			
	}
	public function OrderFinish($offset = NULL)
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
			$id = $this->session->userdata('logged_id');
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit = 10;
			$where = array('merchant_id' => $id,
                           'product_order_detail.status' => $selesai);
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/progress/OrderFinish';
			$config['total_rows'] = $this->Product_model->total_record_transaction($where);
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
		'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
		'C_Product' => $Count_Product,
		'main_view' => 'OrderFinish',
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
	public function OrderCancel($offset = NULL)
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
			$cancel 	= "Order Dibatalkan";
			$id = $this->session->userdata('logged_id');
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit = 10;
			$where = array('merchant_id' => $id,
                           'product_order_detail.status' => $cancel);
			if(!is_null($offset))
			{
				$offset = $this->uri->segment(3);
			}
			$this->load->library('Pagination');
			$config['uri_segment'] = 3;
			$config['base_url'] = base_url().'index.php/progress/OrderCancel';
			$config['total_rows'] = $this->Product_model->total_record_transaction($where);
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
		'transaksi'	=> $this->Product_model->orderin($where,$limit,$offset),
		'C_Product' => $Count_Product,
		'main_view' => 'OrderFinish',
		'trans'		=> $trans,
		'username'	=> $record->username,
		'success'	=> $success,
		'nameAccess'	=> $leveluser,
		'head'		=> 'Order Dibatalkan'
		];
		$this->load->view('template',$data);
		}
		else{
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
			$id = $this->session->userdata('logged_id');
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit = 10;
			$where = array('bill.merchant_id' => $id,
                           'bill.status' => 'Belum Ditagihkan');
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
		'transaksi'	=> $this->Product_model->Bill($where,$limit,$offset),
		'C_Product' => $Count_Product,
		'main_view' => 'Penagihan',
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
	public function Proses_Penagihan($offset = NULL)
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
			$id = $this->session->userdata('logged_id');
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit = 10;
			$where = array('bill.merchant_id' => $id,
                           'bill.status' => 'Tagihkan Ke Admin');
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
		'transaksi'	=> $this->Product_model->Bill($where,$limit,$offset),
		'C_Product' => $Count_Product,
		'main_view' => 'PenagihanProses',
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
			$id = $this->session->userdata('logged_id');
			$record = $this->Product_model->GetData(array("id" => $id) , 'user_merchant');
			$success 	= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $berhasil), 'product_order_detail');
			$trans	 	= count($this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $masuk), 'product_order_detail'));
			$sent 		= $this->Product_model->Order(array("merchant_id" => $id, "product_order_detail.status" => $pengiriman), 'product_order_detail');
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));
			$limit = 10;
			$where = array('bill.merchant_id' => $id,
                           'bill.status' => 'Penagihan Selesai');
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
		'transaksi'	=> $this->Product_model->Bill($where,$limit,$offset),
		'C_Product' => $Count_Product,
		'main_view' => 'PenagihanSelesai',
		'trans'		=> $trans,
		'username'	=> $record->username,
		'success'	=> $success,
		'nameAccess'=> $leveluser,
		'head'		=> 'Order Selesai'
		];
		$this->load->view('template',$data);
		}
		else{
			redirect('Auth');
		}
			
	}
	public function CariProduk(){
		if($this->session->userdata('logged_in') == TRUE)
		{
			$id = $this->input->post('id');
        $data = $this->Product_model->GetData(array('id' => $id), 'product');
        echo $data->id."|".$data->name."|".$data->stock."|".$data->price."|".$data->description."|".$data->status."|".$data->last_update."|".$data->image;
		}
		else{
			redirect('Auth');
		}
		
	}
	public function ProductPending()
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
			$pending = $this->Product_model->GetDataPending(array("product.merchant_id" => $id,"approve" => 0));
			$Count_Product = $this->Product_model->CountProductMerchant(array("product.merchant_id" => $id));

			$data = [
				'Confirm'	=> $this->Product_model->Count_OrderMerchant(),
				'Sent'		=> $this->Product_model->Count_OrderSent(),
				'Finish'	=> $this->Product_model->Count_OrderFinish(),
				'Cancel'	=> $this->Product_model->Count_OrderCancel(),
				'Penagihan' => $this->Product_model->Count_Penagihan(),
				'trans'		=> $trans,
				'C_Product' => $Count_Product,
				'pending' 	=> $pending, 
				'id' 		=> $record->id, 
				'username' 	=> $record->username, 
				'main_view' => 'Product_Pending',
				'nameAccess'=> $leveluser,
				'ProsesPenagihan'	=> $this->Product_model->Count_ProsesPenagihan(),
				'PenagihanSelesai'	=> $this->Product_model->Count_PenagihanSelesai(),
				
				];
			$this->load->view('template', $data);
		}
		else {
			redirect('Auth');
		}
	}
	public function GetProduk(){
		if($this->session->userdata('logged_in') == TRUE)
			{
				$id 	= $this->input->post('id');
        		$data 	= $this->Product_model->GetProduct(array('product.id' => $id));
        			echo $data->id_product."|".$data->product_name."|".$data->username;
			}
		else{
			redirect('Auth');
		}
		
	}
}

/* End of file auth.php */
/* Location: ./application/controllers/auth.php */

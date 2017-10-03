<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('User_model');
		//Do your magic here
	}

	public function index()
	{
		if ($this->session->userdata('logged_in') == true) {
            redirect('Page');
        } else {
            redirect('Auth/login');
        }
	}
	public function login()
	{
		if ($this->session->userdata('logged_in') == true) {
            redirect('Page');
        }
        else {
        	 if ($this->input->post('submit')) {
                $this->form_validation->set_rules('email', 'Email', 'trim|required');
                $this->form_validation->set_rules('password', 'Password', 'trim|required');
                if($this->form_validation->run() == TRUE){
                	if($this->User_model->Check_User() == TRUE){
                        if($this->session->userdata('leveluser') == 1){
                            redirect('Admin');    
                        }else{
                            redirect('Page');
                        }
                       
                		
                	}else{
                		$data['notif'] = 'Login gagal';
                		$this->load->view('Login',$data);
                	}
                }else{
                	$data['notif'] = validation_errors();
					$this->load->view('Login', $data);
                }
       		}else{
       			$this->load->view('Login');
       		}
		}
	}

	public function Register(){
		if ($this->session->userdata('logged_in') == true) {
            redirect('Page');
        } else{
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('username', 'Username', 'trim|required');
            $this->form_validation->set_rules('email', 'Email', 'trim|required');
            $this->form_validation->set_rules('telp', 'Nomor Telepon', 'trim|required');
            $this->form_validation->set_rules('password1', 'Password', 'trim|required');
            $this->form_validation->set_rules('password2', 'Password2', 'trim|required');

            if ($this->form_validation->run() == TRUE ) {
                $password = $this->input->post('password1');
                $password2 = $this->input->post('password2');

                if ($password == $password2) {
                    if ($this->User_model->Add_user() == TRUE) {
                        // jika sukses
                        redirect('Auth/Login');
                    } else {
                        $data['notif'] = 'Login gagal';
						$this->load->view('SignUp', $data);
                    }
                } else {
                    $data['notif'] = "Password didn't match";
					$this->load->view('SignUp', $data);
                }
            } else {
                // jika gagal
                $data['notif'] = validation_errors();
				$this->load->view('SignUp', $data);
            }
        } else {
        	/*$data['notif'] = validation_errors();*/
			$this->load->view('SignUp', $data);
        }
    }
    
		
	}
 	public function Logout() {
        $this->session->sess_destroy();
        redirect('Auth');
    }
	public function signup()
	{
		$this->load->view('signup');
	}

}

/* End of file auth.php */
/* Location: ./application/controllers/auth.php */
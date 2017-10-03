<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		//Do your magic here
	}
	public function Check_User()
	{
		$email 		= $this->input->post('email');
        $password 	= $this->input->post('password');
        $level 		= $this->GetUser(['email'=>$email])->row('is_merchant');
        $id 		= $this->GetUser(['email'=>$email])->row('id');
        $nama 		= $this->GetUser(['email'=>$email])->row('name');
        $leveluser  = $this->GetUser(['email'=>$email])->row('level');

        $query = $this->db->where('email', $email)->where('password', md5($password)) ->where('is_merchant', 1)->get('user_merchant');
        /*$query2 = $this->db->where('username', $email)->where('password', md5($password)) ->where('is_merchant', 1)->get('user_merchant');
        $query3 = $this->db->where('email_tsel', $email)->where('password', md5($password)) ->where('is_merchant', 1)->get('user_merchant');*/
        if ($query->num_rows() > 0) {
            $data = [
                'logged_id'     => 5,
                'logged_name'   => $nama,
                'level'     	=> $level,
                'logged_in'     => TRUE,
                'leveluser'     => $leveluser,
            ];
            $this->session->set_userdata($data);
            return TRUE;
        }
        /*else if ($query2->num_rows() > 0) {
            $data = [
                'logged_id'     => 5,
                'logged_name'   => $nama,
                'level'         => $level,
                'logged_in'     => TRUE,
                'leveluser'     => $leveluser,
            ];
            $this->session->set_userdata($data);
            return TRUE;
        }
        else if ($query3->num_rows() > 0) {
            $data = [
                'logged_id'     => 5,
                'logged_name'   => $nama,
                'level'         => $level,
                'logged_in'     => TRUE,
                'leveluser'     => $leveluser,
            ];
            $this->session->set_userdata($data);
            return TRUE;
        }*/
         else {
            return FALSE;
        }
	}
	public function Add_user()
	{
        $query = $this->db->insert('user_merchant', array(
            'username'  => $this->input->post('username'),
            'phone'     => $this->input->post('telp'),
            'email'  	=> $this->input->post('email'),
            'password'  => md5($this->input->post('password1'))
        ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
	}
    public function edit_profile(){
        $id = $this->input->post('merchant_id');
        $this->db->where(['id'=>$id])->update('user_merchant', array(
            'username'       => $this->input->post('username'),
            'phone'          => $this->input->post('phone'),
            'email'          => $this->input->post('email')
          ));
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
	public function GetUser($where){
		 return $this->db->where($where)->get('user_merchant');
	}
    public function GetData($where, $table)
    {
      return $this->db->where($where)->get($table)->row();
    }

}

/* End of file User_model.php */
/* Location: ./application/models/User_model.php */
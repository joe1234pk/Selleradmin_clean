<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends CI_Controller {

	/**
	 * author:dmh describe:ע���̼ҵ�¼
	 * 
	 */
	public function index()
	{
		//ע����¼
		$this->load->helper('url');
		$this->load->library('session');
		$this->session->sess_destroy();
		redirect('/login');
	}
}

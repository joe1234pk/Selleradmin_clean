<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/** 
 * author:dmh describe:���������� - �̼��Զ�����
 *
 */
class CI_Waimai_Seller {
		
	/**
	 * CI Singleton
	 *
	 * @var	object
	 */
	protected $CI;
	
	public $str_shop_type_list;
	
	public $str_shop_item_category_list;

	// --------------------------------------------------------------------

	/**
	 * Constructor
	 *
	 * @param	array	$config
	 * @return	void
	 */
	public function __construct()
	{
		$this->CI =& get_instance();
	}

	// --------------------------------------------------------------------

	/**
	 * author:dmh describe:����̼��Ƿ��¼
	 */
	public function check_login()
	{
		$this->CI->load->library('session');
		$this->CI->load->helper('url');
		$seller_id = $this->CI->session->seller_id;
		if ($seller_id)
		{
			return $seller_id;
		}else
		{
		 	redirect('/login');
		}
	}
	
	/**
	 * author:dmh describe:select�����б������ѡ��
	 * @param $v ��ǰֵ;$length �����б�ѡ����
	 */
	public function set_form_selected($v,$length)
	{
		$str_selected = '';
		for($i=0;$i <= $length;$i++)
		{
				if ($v == $i)
				{
						$str_selected = ' selected';
						break;
				}
		}
		return $str_selected;		
	}

	// --------------------------------------------------------------------
	
	/**
	 * author:dmh describe:�̼����������б�
	 * @param $v ��ǰselectedֵ
	 */
	public function make_form_select_shoptype($v)
	{
		$strHtml = '';
		$strvalue = '';
		$query = $this->CI->db->query("SELECT * FROM ".$this->CI->db->dbprefix('seller_category')." WHERE parent_id=0");
		$row = $query->row();
		foreach ($query->result_array() as $row)
		{
				if ($strvalue == '')
				{
						$strvalue = $row['id'];
				}else
				{
						$strvalue .= ','.$row['id'];
				}
				$strHtml .= '<option value="'.$row['id'].'"';
				if ($row['id'] == $v) $strHtml .= ' selected';
				$strHtml .= '>'.$row['name'].'</option>';
		}
		$this->str_shop_type_list = $strvalue;
		return $strHtml;		
	}

	// --------------------------------------------------------------------
	
	/**
	 * author:dmh describe:�����̼�����ѡ��
	 * @param $seller_id ��ǰ�̼ҵ�ID
	 */
	public function make_form_seller_category($seller_id,$post_category)
	{
		$strHTML = '';
		if (empty($post_category))
		{
				$arr = $this->get_seller_category($seller_id);
				$arr = array_column($arr, 'category_id');
		}else
		{
				$arr = $post_category;
		}
		$query = $this->CI->db->query("SELECT * FROM ".$this->CI->db->dbprefix('seller_category')." WHERE 1=1");
		$row = $query->row();
		foreach ($query->result_array() as $row)
		{				
				$strHTML .= '<label class="checkbox-inline"><input type="checkbox" calss="checkbox" name="data[category_id][]" id="category" value="'.$row['id'].'"';
				if (in_array($row['id'],$arr)) $strHTML .= ' checked';
				$strHTML .= '> '.$row['name'].'</label>';
		}
		return $strHTML;		
	}

	// --------------------------------------------------------------------
	
	/**
	 * author:dmh describe:��ȡ�̼����
	 * @param $seller_id ��ǰ�̼ҵ�ID
	 */
	public function get_seller_category($seller_id)
	{
		$query = $this->CI->db->query("SELECT category_id FROM ".$this->CI->db->dbprefix('seller_seller_category')." WHERE seller_id=".$seller_id);
		$result = $query->result_array();
		return $result;		
	}

	// --------------------------------------------------------------------
	
	/**
	 * author:dmh describe:�ϴ�ͼƬ
	 * @param
	 */
	public function do_upload_shop_image($userfile,$upload_path,$allowed_types,$max_size,$max_width,$max_height)
	{
		$web_path = '';		
		$config['upload_path']      = $this->CI->config->item('upload_root_path').$upload_path.'/';
    $config['allowed_types']    = $allowed_types;
    $config['max_size']     = $max_size;
    $config['max_width']        = $max_width;
    $config['max_height']       = $max_height;
    $config['file_ext_tolower'] = true;
    $config['encrypt_name'] = true;
    if(!is_dir($config['upload_path']))
		{
		  if(!mkdir($config['upload_path'],0777,true)) exit('Invalid file path.');
		}
    $this->CI->load->library('upload', $config);
   	$this->CI->upload->initialize($config);
   	//var_dump($this->CI->upload->do_upload($userfile));
    if (!$this->CI->upload->do_upload($userfile))
    {
    		$error = array('error' =>  $this->CI->upload->display_errors());
    		//var_dump($error);
    		$web_path = '';
    }else
    {
       	$data = array('upload_data' =>  $this->CI->upload->data());
       	$web_path = $config['upload_path'].$data['upload_data']['file_name'];
       	$web_path = str_replace($this->CI->config->item('upload_root_path'),'',$web_path);
       	
    }
    return $web_path;
	}

	// --------------------------------------------------------------------

	/**
	* author:dmh describe:������Ʒ���������б�
	* @param $v ��ǰselectedֵ
	*/
	public function make_form_select_shop_item_category($v)
	{
		$strHtml = '';
		$strvalue = '';
		$seller_id = $this->CI->session->seller_id;
		$query = $this->CI->db->query("SELECT * FROM ".$this->CI->db->dbprefix('item_category')." WHERE seller_id='$seller_id' and (parent_id=0 or isnull(parent_id)) ORDER BY parent_id ASC");
		$row = $query->row();
		foreach ($query->result_array() as $row)
		{
				if ($strvalue == '')
				{
						$strvalue = $row['id'];
				}else
				{
						$strvalue .= ','.$row['id'];
				}
				$strHtml .= '<option value="'.$row['id'].'"';
				if ($row['id'] == $v) $strHtml .= ' selected';
				$strHtml .= '>'.$row['name'].'</option>';
		}
		$this->str_shop_item_category_list = $strvalue;
		return $strHtml;		
	}

	// --------------------------------------------------------------------
	
	/**
	* author:dmh describe:���ز�������״̬
	* @param $status ����״ֵ̬
	*/
	public function order_status($status)
	{
		$this->CI->lang->load('order');
		$str_status = '';
		switch($status)
		{
			case 'NEW':
				$str_status = lang('order_status_0');
			break;
			case 'WAIT':
				$str_status = lang('order_status_1');
			break;
			case 'DELIVERY':
				$str_status = lang('order_status_2');
			break;
			case 'COMPLETE':
				$str_status = lang('order_status_5');
			break;
			case 'DONE':
				$str_status = lang('order_status_3');
			break;
			case 'CANCEL':
				$str_status = lang('order_status_4');
			break;
		}
		return $str_status;
	}

	// --------------------------------------------------------------------
	
	/**
	* author:dmh describe:�������ͷ�ʽ�ı�ֵ
	* @param $value �������
	*/
	public function order_delivery_type($value)
	{
		$this->CI->lang->load('view_order');
		$str = '';
		switch($value)
		{
			case 'SELF':
				$str = lang('view_order_delivery_type_1');
			break;
			case 'PANDA':
				$str = lang('view_order_delivery_type_2');
			break;
		}
		return $str;
	}
	
	// --------------------------------------------------------------------
    //Joe ���ظ������� PAYPAL, ����֧�� ��δѡ�� 2017/06/14
   public function order_pay_type($value)
   {
   	  $this->CI->lang->load('order');
      $str = '';
      switch($value)
		{
			case 'OFFLINE':
				$str = lang('order_pay_type_offline');
			break;
			case 'OTHER':
				$str = lang('order_pay_type_other');
			break;
			case 'PAYPAL':
				$str = lang('order_pay_type_paypal');
			break;
			case 'BALANCE':
				$str = lang('order_pay_type_balance');
			break;
		}
		return $str;

   }

   //End
// --------------------------------------------------------------------

//Joe 22/06/2017
//To get form of rest days
	public function make_rest_days_form($seller_id)
	{
       
   		$main_str = '';
  		$rests = $this ->get_seller_rest_date($seller_id);
   		$rest_days = array();
   		$rest_dates = array();
   		foreach($rests as $rest)
   		{
     		if($rest['type'] == 'WEEK')
     			$rest_days[] =$rest['value'];
     		if($rest['type'] == 'DEFAULT')
     			$rest_dates[] =$rest['value'];
  	 	}
      	$rest_dates[] = '2017-06-25';
      	$rest_dates[] = '2017-07-04';
    	$main_str .= $this -> regular_day_options($rest_days);
     	//$main_str .= $this -> holiday_day_options($rest_dates,date('Y-m-d'),date('Y-m-d',strtotime("+6 days")));
     	//$main_str .= $this -> holiday_day_options($rest_dates,date('Y-m-d',strtotime("+7 days")),date('Y-m-d',strtotime("+13 days")));
    	return $main_str;
	}
 	
 	public function holiday_day_options($rest_dates,$start_date,$end_date)
  	{
  		$this->CI->load->helper('date');
  		$week_days = array(
      					'Sun' =>0,
      					'Mon' =>1,
      					'Tue' =>2,
      					'Wed' =>3,
      					'Thur' =>4,
      					'Fri' =>5,
      					'Sat' =>6,
    				);
  		$str = '';
  		$period_range = date_range($start_date , $end_date);
   		$str .= '<div>';
   		foreach($period_range as $date)
  		{
	 		$str .= '<input type="checkbox" class="" id="restDates" name="data[rest_dates][]" value='.$date;  //<label class="checkbox-inline"></label>
    		if($this->is_rest_day($rest_dates,$date))
   			{
   				$str .=' checked';
   			} 
    		$str .= '>'.array_search(date('w', strtotime($date)),$week_days);	
        	$str .= '<div>'.$date.'</div>';
  		}
  		$str .= '</div>';
  		return $str;
	}

	public function regular_day_options($rest_days)
	{
  		$str = '';
  		$week_days = array(
    					'Sun' =>0,
    					'Mon' =>1,
    					'Tue' =>2,
    					'Wed' =>3,
    					'Thur' =>4,
    					'Fri' =>5,
    					'Sat' =>6,
			    	);

  		$str .= '<div>';
  		foreach($week_days as $k_d=>$v)
  		{
			$str .= '<label class="checkbox-inline"><input type="checkbox" class="" id="restDays" name="data[rest_days][]" value='.$v;
    		if($this->is_rest_day($rest_days,$v))
   			{
   				$str .=' checked';
   			} 
   			$str .= '>'.$k_d;	
     		$str .= '</label>';
  		}	
  		$str .= '</div>';

  		return $str;
	}

	function is_rest_day($rest_day,$day)
	{
    	if(in_array($day,$rest_day)) return 1;
    	return 0;
	}
	
	function get_seller_rest_date($seller_id)
 	{
    	$query = $this->CI->db->query("SELECT id, type, value FROM ".$this->CI->db->dbprefix('seller_restdate')." WHERE seller_id=".$seller_id);
		$row = $query->result_array();

		return $row;
	}
//End
// --------------------------------------------------------------------

}

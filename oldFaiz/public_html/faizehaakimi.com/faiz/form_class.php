<?php

/**
 * @author [ismail mohemad   ]
 * @copyright [empcland@gmail.com]
 */
 class frm_class{
    
    var $mod_property;
    var  $mode;
    var  $data;
    function _render_properties(){
		global $my_db,$my_gen;
        $fclass="form_row";
        

	if($this->mode=='edit'){
      // $data=$my_gen->get_other($this->data);
    
     //print_R($_SESSION['post']);
  
     $data =$this->data;
      
  
	}
		foreach ($this->mod_property as $fild){
			if($fild['required']){
					$req='required';
				}else{
					$req='';
				}
                
                  $fclass="form_row";
               
              
			switch ($fild['type']){
				
				
				case 'input':
				case 'date':
				case 'time':
				$input_html='<input  class="txt form_text  '.$req.'" name="'.$fild['name'].'" id="'.$fild['name'].'" value="'.$data[$fild['name']].'" value="'.$fild['value'].'"  class="'.$req.' '.$fild['class'].'" type="input" />';
			    
                  //$input_html='<input  class="txt form_text" name="'.$fild['name'].'" id="'.$fild['name'].'" value="'.$data[$fild['name']].'"  class="'.$req.' '.$fild['class'].'" type="input" />';
            
            
            	break; 
                
               
                	case 'Line':
                     
                     $fclass="Line_u";
					$input_html='<div class=" txt form_text Line"><h2>'.$fild['name'].'</h2></div>';
				break;
                
                
                
                
                
                
                	case 'color':
					$input_html='<input  class="txt form_text color_p" name="'.$fild['name'].'" id="'.$fild['name'].'" value="'.$data[$fild['name']].'" value="'.$fild['value'].'"  class="'.$req.' '.$fild['class'].'" type="input" />';
				break;
                
                	case 'label':
			
					$input_html='<input READONLY style="background: transparent;text-align:center;" class="form_text" name="'.$fild['name'].'" value="'.$fild['value'].'"  id="'.$fild['name'].'" value="'.$data[$fild['name']].'" class="'.$req.' '.$fild['class'].'" type="input" />';
				break;
                
                
                	case 'hidden':
			
					$input_html='<input type="hidden" name="'.$fild['name'].'" value="'.$fild['value'].'"  id="'.$fild['name'].'"  class="'.$req.' '.$fild['class'].'"  />';
				break;
                
				case 'password':
					$input_html='<input class="form_text" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'" type="password" />';
				break;
                
                	
				case 'checkbox':
					if($data[$fild['name']]==1){
						$checked=' checked';	
					}else{
						$checked='';	
					}
					$input_html='<input name="'.$fild['name'].'" id="'.$fild['name'].'" value="1" class="'.$req.' '.$fild['class'].'" type="checkbox" '.$checked.' /><input name="'.$fild['name'].'_check_" value="1" type="hidden" />';
				break;
				case 'textarea':
                $fclass="form_row_texterea";
					$input_html='<textarea class="form_texteara" style="width:500px;height:300px;" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'">'.$data[$fild['name']].'</textarea>';
				break;
				case 'richeditor':
                $fclass="form_row";
					$input_html='<textarea class="form_texteara" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'">'.$data[$fild['name']].'</textarea>';
				break;
				case 'select':
		
            
               
                	$input_html='<select  class="form_text" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'">';
				
             
                $input_html.=$this->_get_select_data($fild,$data[$fild['name']],$fild['select_data'],$data[$fild['name']]);
					$input_html.='</select>';
				break;
                
                
                	case 'list':
                    
                   
					$input_html='<select  multiple="multiple" class="form_text" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'">';
					$input_html.=$this->_get_select_data($fild,$data[$fild['name']]);
					$input_html.='</select>';
				break;
               
                
                
                
                
				case 'autocomplete':
					$input_html='<input class="form_text" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'" />';
					
					
					$input_html.="<script language=\"javascript\">
					window.onload = function ()
            		{
               			 data_".$fild['name']." = [".$this->_get_ac_data($fild,$data[$fild['name']])."].sort();
        
            	    	AutoComplete_Create('".$fild['name']."', data_".$fild['name'].");
            }
					</script>";
				break;
				
			
				case 'radio':
					$input_html='<select name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'">';
					$input_html.=$this->_get_radio_data($fild,$data[$fild['name']]);
					$input_html='</select>';
				break;		
				case 'upload':
				case 'pic':
					$input_html='';
					if($data[$fild['name']]){
						if($fild['type']=='pic'){
							$input_html='<br /><a  href="uploads/'.$data[$fild['name']].'"><img  class="form_pic" src="uploads/'.$data[$fild['name']].'"></a>';
						}else{
							$input_html='<a href="uploads/'.$data[$fild['name']].'">'.$data[$fild['name']].'</a>';
						}
						$req='';
					}
					$input_html.='<br /><input class="form_file" name="'.$fild['name'].'" id="'.$fild['name'].'" class="'.$req.' '.$fild['class'].'" type="file" />';
				break;		
		}
			
            
            
            
					if($fild['type']!='hidden'){
					   $html.='<div style="'.$fild['style'].'" class="'.$fclass.'">';
                          
                          	if($fild['type']=='Line'){
                          	 
                             
                          
                           $html.='<div class="field-label"><label for="'.$fild['name'].'"></label></div>';
		
        	}else{
        	   
                $html.='<div class="field-label"><label for="'.$fild['name'].'">'.$fild['title'].':</label></div>';
		
               
               
        	}
        
        
        
        
        	}
               			
                        
                      $html.='<div class="field-widget" >'.$input_html.'</div>';
						if($fild['type']!='hidden'){$html.=	'</div>';}
		}
	
        
        
        
		return $html;
	
	
	}
   
   
   	function get_properties(){
   	return $this->_render_properties(); 
    
    }
    
    
    
    
    
    
    
function _get_select_data($fild,$value,$fldtype="",$fldval=""){
	   
     
       
		global $my_db,$config;
		$html.='<option></option>';
		if(!$fild['select_title_fild']){
			$fild['select_title_fild']='title';
		}
		if(!$fild['select_id_fild']){
			$fild['select_id_fild']='id';
		}
		if($fild['select_data']){
			$data=$fild['select_data'];
			}else{
		if($fild['select_query']){
			$data=$my_db->get_data_query($fild['select_query']);
            
		}else{
			$data=$my_db->get_data($fild['select_data_table'],'','id <>0 ');
	

   
    	}
		}
        
        
        
		foreach ($data as $k=>$row){
		  
        $ggg="folder";
 
          if ($k === $ggg )
          {
            
            

$dhandle = opendir($row);
$files = array();
if ($dhandle) {
   while (false !== ($fname = readdir($dhandle))) {
      
      if (($fname != '.') && ($fname != '..') &&
          ($fname != basename($_SERVER['PHP_SELF']))) {   
            
          $files[] = (is_dir( "./$fname" )) ? "{$fname}" : $fname;
      }
   }
   closedir($dhandle);
}

foreach( $files as $fname )
{
    
    	if($fldval==$fname){
				$selected=' selected';
			}else{
				$selected='';
			}
            
   $html.= "<option $selected >{$fname}</option>\n";
}

        
}else if($k =='xml'&&$row=="template:class"){

  global $template_site_url;
$doc = new DOMDocument();
$xmlf= $template_site_url."tmp_data.xml";
$xml = simplexml_load_file($xmlf);
 $xml->getName();
   foreach($xml->children() as $child)
  {
  if ($child->getName()=='class')
  {
    
    
    	if($fldval==$child){
				$selected=' selected';
			}else{
				$selected='';
			}
    $html.='<option value="'.$child.'" '.$selected.'>'.$child.'</option>';
  }

  }
  

     
}else if($k =='xml'&&$row=="template:position"){
    
    
    	if($fldval==$child){
				$selected=' selected';
			}else{
				$selected='';
			}

  global $template_site_url;
$doc = new DOMDocument();
$xmlf= $template_site_url."tmp_data.xml";
$xml = simplexml_load_file($xmlf);
 $xml->getName();
   foreach($xml->children() as $child)
  {
  if ($child->getName()=='position')
  {
    $html.='<option value="'.$child.'" '.$selected.'>'.$child.'</option>';
  }

  }
   

    
} else{
    

               
	//echo $fild['select_data'];
        
        
   if($fild['select_data']){
    
 	if($row[$this->table_specs[$col]['select_id_fild']]==$value  || $row==$value || $k==$value ){
				$selected=' selected';
			}else{
				$selected='';
			}
		//	echo $row.":".$k.":".$fldval."<br>";
            $html.='<option value="'.$k.'" '.$selected.'>'.$row.'</option>';
		
        
        	}else{
			
             	if($row[$fild['select_id_fild']]==$value){
				$selected=' selected';
			}else{
				$selected='';
			}
			 
               
				$html.='<option value="'.$row[$fild['select_id_fild']].'" '.$selected.'>'.$row[$fild['select_title_fild']].'</option>';
			}
		
        
        
        
        
        
        
           }
        
        
        
        
        
        
        
        
        }
		return $html;
	}
    
    
    
    
    
 }
 
 $form= new frm_class();

 
 ?>
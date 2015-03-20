<?php

/**
 * @author [ismail mohemad   ]
 * @copyright [empcland@gmail.com]
 */
 
 class gen_class{
    function add_fld($fld,$se){  
     global $form;
     $form->mod_property=$fld;
     $form->mode='edit';
     $form->data=$se;
     return $form->get_properties();
        
        
    }
    
    
    
    
    function add_fld_db($pkg,$se){
        
    //$array[]
   
 
        //  include_once('actions/'.$pkg.'/fun/fld_to_bottom.php');        
          // foreach($flds as $f){$array[]=$f['name'] ;}
      // include_once('actions/'.$pkg.'/fun/fld_to_top.php');
 //foreach($flds as $f){$array[]=$f['name'] ;}
         // include_once('actions/'.$pkg.'/fun/fld_to_a_remarks.php');
          //foreach($flds as $f){$array[]=$f['name'] ;}
         include_once('actions/'.$pkg.'/fun/fld_to_a_name.php');     
        foreach($flds as $f){$array[]=$f['name'] ;}  
         
         
        
       
      foreach($array as $f){$ar_end[$f]=$se[$f];}
      
    //  print_r($ar_end);
          return $ar_end;
          
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
 
function add_to($pkg,$Place){
      global $val,$gen;    
    switch ($Place){
      case "top":
      include_once('actions/'.$pkg.'/fun/fld_to_top.php');     
      $data=$this->add_fld($flds,$_SESSION['post']);
      $flds="";
      break;
      case "a_name":
         case "top":
      include_once('actions/'.$pkg.'/fun/fld_to_a_name.php');     
      $data=$this->add_fld($flds,$_SESSION['post']);
      $flds="";       
      break;
      case "a_remarks": 
        
      include_once('actions/'.$pkg.'/fun/fld_to_a_remarks.php');     
      $data=$this->add_fld($flds,$_SESSION['post']);
      $flds="";     
      break;        
      case "bottom":
      
      include_once('actions/'.$pkg.'/fun/fld_to_bottom.php');     
      $data=$this->add_fld($flds,$_SESSION['post']);
      $flds="";
      break;
      
    }



return $data;
}









function add_to_edit($pkg,$Place,$e_data){
    
    
      global $val,$gen;    
    switch ($Place){
      case "top":
      include_once('actions/'.$pkg.'/fun/fld_to_top.php');     
      $data=$this->add_fld($flds,$e_data);
      $flds="";
      break;
      case "a_name":
         case "top":
      include_once('actions/'.$pkg.'/fun/fld_to_a_name.php');     
      $data=$this->add_fld($flds,$e_data);
      $flds="";       
      break;
      case "a_remarks": 
        
      include_once('actions/'.$pkg.'/fun/fld_to_a_remarks.php');     
      $data=$this->add_fld($flds,$e_data);
      $flds="";     
      break;        
      case "bottom":
      
      include_once('actions/'.$pkg.'/fun/fld_to_bottom.php');     
      $data=$this->add_fld($flds,$_SESSION['post']);
      $flds="";
      break;  
    }


return $data;
}












}

$gen=new gen_class();
?>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    

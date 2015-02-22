<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_searchFordomain_From($pro, $lang) {

    return '<div class="mod_searchFordomain_From">
  
      <input  type="button" class=\'mod_searchFordomain_search search\' value="' . $lang['search'] . '">

    <div class=\'frow\'>
    <select class="mod_searchFordomain_type">
            <option>com</option>
            <option>net</option>
            <option>org</option>
        </select>
       <input type="text" size="30" value="" class="mod_searchFordomain_domain">
       
 <div class=\'www\'>www</div>
        <br/>
     
    </div>   <div class=\'mod_searchFordomain_UpdateData UpdateData lightColor\'></div>
     
 </div>

';
}
?>


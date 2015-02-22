<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_newsLetter_getForm($pro, $lang) {

    return '<input type="text" size="30" value="" class="mod_newsLetter_email"> 
               <input  
               type="button" 
               class=\'button mod_newsLetter_search\' 
               value="' . $lang['sub'] . '">
     <br/>
     
';
}
?>
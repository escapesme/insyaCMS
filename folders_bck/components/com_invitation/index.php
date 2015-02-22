<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function main($pro, $lng) {

    /* @var $lib  \libs\libs */
    global $lib;

    $returnData = "";



    $returnData.="<div class='title'>" . $lng['title'] . "</div>";

    $returnData.="<div class='note1'>" . $lng['note1'] . "</div>";
    $returnData.="<div class='note2'>" . $lng['note2'] . "</div>";

    $returnData.="<div class='title1'>" . $lng['title1'] . "</div>";
    $returnData.="<div class='title2'>" . $lng['title2'] . "</div>";


    

$returnData.="<div class='form'>";
    $filds = array(
        "invitationcode" => array(
            "type" => "text",
            "id" => "invitation",
            "class" => "invitationcode",
            "title" => "",
        ),
   
        "invitationBT" => array(
            "type" => "button",
            "class" => "invitationBT",
            "title" => "invitationBT",
            "value" => "send"
        )
        
    );
    $lib->forms->filds = $filds;
    $returnData .= $lib->forms->_render_form();

    
    
    
    
    $returnData.="</div>";
    
    return $returnData;
}
?>





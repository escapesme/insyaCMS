<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function plg_pkgs($pro) {
    /* @var $lib  libs\libs */
    global $lib;

    //print_r($_SESSION);


    $nights = $pro['nights'];
    $Childs = $pro['Childs'];
    $Infants = $pro['Infants'];
    $Adults = $pro['Adults'];

    echo $datasql = $lib->db->get_row('com_pkgs', '', " maxDays>$nights and  minDays<$nights");











    $allforadoneNight = $Adults * $datasql['adultsPric'];
    $allforchoneNight = $Childs * $datasql['childPric'];
    $allforad = $Adults * $datasql['adultsPric'] * $nights;
    $allforch = $Childs * $datasql['childPric'] * $nights;



    $lla = $allforad + $allforch;







    $retdata = ''
            . '<table  style="width:96%;border:1px #6d3c07 solid; margin:auto;border-bottom:1px #6d3c07 solid;" id="pillwithoutt">
<!-- Adults  -->
<tbody><tr><td>No.of Adults:<b>' . $Adults . '</b></td><td>
' . $nights . ' Nights 

</td><td>=$' . $allforad . ' </td><td></td></tr>
<tr><td></td><td>+ <b>3</b> Extra Night (s) 

@ <b>$' . $datasql['adultsPric'] . '</b> / Night per Adult

</td><td>=$' . $allforadoneNight . '</td><td></td></tr>
<!-- Child  -->
 
<tr><td>No.of Child:<b> ' . $Childs . ' </b></td>

<td>   ' . $nights . ' Nights 
</td><td>=$' . $allforch . '</td><td></td></tr>


<tr><td></td><td>
+ <b>3</b> Extra Night (s) 

@ <b>$' . $datasql['childPric'] . ' </b>/ Night per Child

</td><td>=$' . $allforchoneNight . '</td><td></td></tr>


<!-- Infants  -->

<tr><td>Infants:</td><td>

1Infant(s)</td><td></td><td></td></tr>




</tbody></table>'
            . '<table style="width:96%;border:1px #6d3c07 solid; margin:auto;border-bottom:1px #6d3c07 solid; margin-bottom:20px;" class="tottd" id="tottdwt">
<tbody><tr><td><b>Total Lawazim:
<b>(With Transportation)<b>  

</b>&nbsp;&nbsp;&nbsp;</b></b></td><td></td><td><b>=$' . $lla . '</b></td><td></td></tr></tbody></table>'
            . ''
            . '';
    return $retdata;
}

?>

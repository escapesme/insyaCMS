<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function getsun($lt, $nt, $im) {
    $d = date("d");
    $m = date("m");
    $dom = new DomDocument();
    $dom->load("http://www.earthtools.org/sun/" . $lt . "/" . $nt . "/" . $d . "/" . $m . "/" . $im . "/1");
    $imageList = $dom->getElementsByTagName('sunrise');
    $imageCnt = $imageList->length;
    $imageList2 = $dom->getElementsByTagName('sunset');
    $imageCnt2 = $imageList2->length;
    $ds = str_split($imageList2->item(0)->nodeValue, 5);
    $dd = str_split($imageList->item(0)->nodeValue, 5);
    $ret = "<div id=\"sunries\">
        <div  class='title'>sunrise</div><br><br><div id=\"sun_num1\">" . $dd[0] . "</div></div>";
    $ret.= "<div id=\"sunset\"><div  class='title'>sunset</div><br><br><div id=\"sun_num\">" . $ds[0] . "</div></div>";
    return$ret;
}

?>

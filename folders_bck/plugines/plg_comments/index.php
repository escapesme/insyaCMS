<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_comments($data, $lang) {
    global $lib;




    $data["limitnumber"] = "5";
    $data["limitfrom"] = "5";




    if ($data['mytype'] == "all") {

        $returnData = ' <div class="comment_all datatabs">'
                . '<ul class="tabstitles">'
                . '<li data-show="in">' . $lang['commentin'] . '</li>'
                . '<li data-show="fb">' . $lang['commentfb'] . '</li>'
                . '<ul>';
        $returnData .= ' <div class="tabsbodys">';

        $returnData .='
        <div  class="comment_like in tabsbody">                       
                ' . addcomeent($data, $lang) . '' . getComments($data, $lang) . ' ' . createFrom($lang, $data) . '
        </div>';



        $returnData .= '<div class="comment_like fb tabsbody">
        <div class="fb-like" data-href="https://www.facebook.com/VIDEOALYOUM" data-send="true" data-width="450" data-show-faces="true"></div>
    
        <div class="comment_data">
        <div class="fb-comments " data-href="' . $lib->util->siteSetting['site_link'] . '/?type=' . $data["ob_type"] . "&id=" . $data["ob_id"] . '" data-width="620" data-num-posts="10"></div>'
                . '</div>   '
                . ' </div>';

        $returnData .= '</div></div>';
    }




    if ($data['mytype'] == "in") {
        $returnData .='
        <div  class="comment_like in">                       
                ' . addcomeent($data, $lang) . '' . getComments($data, $lang) . ' ' . createFrom($lang, $data) . '
        </div>';
    }





    if ($data['mytype'] == "fb") {

        $returnData .= '<div class="comment_like fb">
        <div class="fb-like" data-href="https://www.facebook.com/VIDEOALYOUM" data-send="true" data-width="450" data-show-faces="true"></div>
    
        <div class="comment_data">
        <div class="fb-comments " data-href="' . $lib->util->siteSetting['site_link'] . '/?type=' . $data["ob_type"] . "&id=" . $data["ob_id"] . '" data-width="620" data-num-posts="10"></div>'
                . '</div>    </div>';
    }




    return $returnData;
}

?>

<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_tabs($pro) {

    global $lib;




    $data = "<div class='mod_tab mod_tab" . $pro['myid'] . "'>";
    if ($pro['mytype'] == 'models') {
        $data .= modTabsGetModels($pro);
    } else {

        $data .= modTabsGetHtml($pro);
    }

    $data.="<script>updateTabModel('.mod_tab" . $pro['myid'] . "');</script></div>";





    return $data;
}
?>


<style>
  

    .tabTitle{

        cursor: pointer
            ;
        float:right;

    }
    .tabBody{
        width:100%;
        position: absolute;
        display: none;
    }

    .tabTiltes{
        float:right;
        width:100%;
        clear: both
    }



    .tabBodys{
        float:left;
        width:99% ;
        position:relative; 
        clear: both
    }
    .mod_tab{

        height: 220px;
    }
    .tabTitle.act{
        border-bottom: 1px solid rgba(255, 255, 255, 0.6);
    }


</style>
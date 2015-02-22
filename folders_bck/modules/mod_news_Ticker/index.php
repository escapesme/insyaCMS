<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_news_Ticker($pro) {
    global $lib;

    $thisTable = "com_content_article";
    $thiscatgoriesTable = "com_content_catgories";



    if ($pro['viewtype'] == "h") {




        $data =
                "
              
          



    <div class='tickerbts'>
    

<div class='tickerbt btleft stop" . $pro['myid'] . "'>left</div> 

  
    <marquee  id=\"mysl\"  height=\"20\" onmouseover=\"this.setAttribute('scrollamount', 0, 0)\" width=\"280\" direction=\"left\" 
onmouseout=\"this.setAttribute('scrollamount', 6, 0)\" >


";

        if ($pro['view'] == "categories") {

            $data .= news_Ticker_categories_getLast($pro, $thisTable, $thiscatgoriesTable);
        } else {
            if ($pro['Datatype'] == "latest") {

                $data .= news_Ticker_getLast($pro, $thisTable, $thiscatgoriesTable);
            } else if ($pro['Datatype'] == "mostview") {

                $data .= news_Ticker_hints($pro, $thisTable, $thiscatgoriesTable);
            }if ($pro['Datatype'] == "tags") {
                $data .= news_Ticker_tags($pro, $thisTable, $thiscatgoriesTable);
            }
        }
        $data .="</marquee><div class='tickerbt btright start" . $pro['myid'] . "'>right</div></div>";
    } else {



        $data =
                '<script src="/' . $lib->util->mylink("module", "mod_news_Ticker") . 'js/jquery.totemticker.js"></script>' .
                "<script>newsTikerRender('" . $pro['myid'] . "');</script>
          


    <div class='tickerbts'>
    
<div class='tickerbt  ticker-next ticker-next" . $pro['myid'] . "'>next</div> 
   

    <div class='tickerbt ticker-previous ticker-previous" . $pro['myid'] . "'>previous</div> 
        
<!--      
<div class='tickerbt stop stop" . $pro['myid'] . "'>stop</div> 
<div class='tickerbt start start" . $pro['myid'] . "'>start</div>--!>
    </div>
<ul class='newstiker " . $pro['myid'] . "'>

";

        if ($pro['view'] == "categories") {

            $data .= news_Ticker_categories_getLast($pro, $thisTable, $thiscatgoriesTable);
        } else {
            if ($pro['Datatype'] == "latest") {

                $data .= news_Ticker_getLast($pro, $thisTable, $thiscatgoriesTable);
            } else if ($pro['Datatype'] == "mostview") {

                $data .= news_Ticker_hints($pro, $thisTable, $thiscatgoriesTable);
            }if ($pro['Datatype'] == "tags") {
                $data .= news_Ticker_tags($pro, $thisTable, $thiscatgoriesTable);
            }
        }
        $data .="</ul>";
    }

    return $data;
}
?>

<script>
    $(function() {
/*

$(".maindata  .left"){
    
    
    
}*/

        $(".btright").click(function() {
            $("#mysl").attr('direction', "right");

        })


        $(".btleft").click(function() {
            $("#mysl").attr('direction', "left");

        })
    })

</script>

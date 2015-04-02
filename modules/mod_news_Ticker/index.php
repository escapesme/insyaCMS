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










    $data .= "<div class='tickerbts'>
<div class='tickerbt btleft stop" . $pro['myid'] . "'>left</div> 
    <div  class='marquee' id=\"mysl\" ><ul>
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
    $data .="</ul></div><div class='tickerbt btright start" . $pro['myid'] . "'>right</div></div>";



    return $data;
}
?>

<script>

    $(function() {


        $(document).ready(function() {

            var speed = 1;
            
            
            var pwidth= $('.marquee').outerWidth();
            var items, scroller = $('.marquee ul');


            var width = 0;

            scroller.children().each(function() {
                width += $(this).outerWidth(true) + 5;
            });

            scroller.css('width', width);

            scroll();
            function scroll() {
                items = scroller.children();
                var scrollWidth = items.eq(0).outerWidth();
                scroller.animate({'left': pwidth}, 120 * 100 / speed, 'linear', changeFirst);
            }


            function scrollRight() {
                items = scroller.children();
                var scrollWidth = items.last().outerWidth();
                scroller.animate({'left': -scroller.outerWidth()}, 120 * 100 / speed, 'linear', changeLast);
            }


            function changeFirst() {
                scroller.append(items.eq(0).remove()).css("left", -scroller.outerWidth());
                scroll();
            }


            function changeLast() {
                scroller.append(items.eq(0).remove()).css("left", pwidth);
                scrollRight();
            }



            $(".marquee ul").hover(function() {
                $(this).stop();
            }, function() {
                scroll();
            });




            $(".btright").click(function() {

                $(".marquee ul").stop();


                scroll();

            })
            $(".btleft").click(function() {
                $(".marquee ul").stop();
                scrollRight();


            })
        });



    })

</script>

<style>
    .marquee {
        position: relative;
        width: 280px;
        overflow: hidden
    }
    .marquee ul{
        width: auto;
        position: absolute;

    }

    .marquee li{
        display: inline-block;
    }
</style>

<?php
ini_set('date.timezone', 'Africa/Cairo');
@set_time_limit(0);
session_start();
$url = $_SERVER['REQUEST_URI'];
include('mysql.php');
include('functions.php');
include("form_class.php");
include("gen_class.php");
// $conten_news = $db->get_data_query("select * from news ORDER BY `id` DESC liMIT 0,2 "." ".getjcity_home("where"));
?>
<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0038)faiz/quds.html -->
<html xmlns="http://www.w3.org/1999/xhtml" class="cufon-active cufon-ready">
    <style>
        li  {
            list-style: none;
            padding: 1px;
        }
        #myinn{
            padding-right: 25px;;
            padding-top :10px;
            background-image:url("images/package-bg2_1.png");
            background-repeat: repeat-y;

            margin:0px 2px 0px  50px;
            text-align:justify;
            width:194px;
            margin-bottom:0px;
            padding-bottom:7px;

        }
        .package-title_inn{



            width: 187px;
            height:33px;
            background-image: url("images/package-bg2_0.png");
            margin:auto;
            font-size:15px;
            padding-top: 37px;;
            margin:30px 2px 0px  50px;
            text-align: center;
        }

        #myinn ul{
            padding-left :20px

        } 
        #innend{
            background-image: url("images/package-bg2_2.png");
            width:187px;
            height: 60px;
            margin:0px 2px 0px  50px;
        }

        #myinn li{
            width: 130px;
            background-image:url("images/innli.png");
            background-repeat: no-repeat;
            background-position: left;
            border-bottom: 1px dashed #604426;
            padding-left: 20px;
            margin-bottom:0px;
        } 


        .nact{
            color: #663300;
            text-decoration: none;
        } 
        .aact{

            color: #ffcc66;
            font-weight: bold;
        }
    </style>


    <head profile="http://gmpg.org/xfn/11">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

            <title>Faiz-e-Haakimi <?= get_city_full(); ?></title>




            <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen, projection"/>
            <link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>


            <meta name="generator" content="E-Scapes Development"/>
            <meta name="generator" content="E-Scapes Development"/>

            <script type="text/javascript" src="js/jquery-1.5.2.min.js"></script>

<!--<script type="text/javascript" src="js/jquery.tools.min.js"></script>
            -->


            <script type="text/javascript" src="js/custom.js"></script>
            <script type="text/javascript" src="js/jquery.corner.js"></script>
            <script type="text/javascript" src="js/cufon-yui.js"></script>
            <style type="text/css">cufon{text-indent:0!important;}@media screen,projection{cufon{display:inline!important;display:inline-block!important;position:relative!important;vertical-align:middle!important;font-size:1px!important;line-height:1px!important;}cufon cufontext{display:-moz-inline-box!important;display:inline-block!important;width:0!important;height:0!important;overflow:hidden!important;text-indent:-10000in!important;}cufon canvas{position:relative!important;}}@media print{cufon{padding:0!important;}cufon canvas{display:none!important;}}</style>

            <link rel="stylesheet" href="css/slide.css" type="text/css" media="screen" charset="utf-8"/>
            <link href="css/faiz.css" rel="stylesheet" type="text/css"/>
            <link href="css/custom.css" rel="stylesheet" type="text/css"/>

            <link rel="stylesheet" href="js/jquery.tooltip.css"/>
            <link rel="stylesheet" href="css/humanity/jquery-ui-1.7.3.custom.css" type="text/css" /> 
            <script type="text/javascript" src="js/Trajan_Pro_400-Trajan_Pro_700.font.js"></script>
            <script src="js/jquery.bgiframe.js" type="text/javascript"></script> 

            <script src="js/jquery.tooltip.js" type="text/javascript"></script> 
            <script src="js/jquery.dimensions.js" type="text/javascript"></script>

            <script type="text/javascript" src="js/jquery.center.js"></script>
            <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script> 
            <script type="text/javascript" src="js/jquery.validate.js"></script>
            <script src="jquery.zweatherfeed.js" type="text/javascript"></script>


            <?php
            if ($_GET['home']=="m"){
            $c = "JOXX0002";
            }else{
            $c = "EGXX0004";
            }
            ?>


            <script type="text/javascript" src="js/maxlength.js"></script>


            <script>$(document).ready(function() {
                    //$('#test').weatherfeed(['UKXX0085', 'EGXX0011', 'UKXX0061', 'CAXX0518', 'CHXX0049']);


                    $('.weather-current-hi-lo').weatherfeed(['<?= $c ?>'], {
                        image: true,
                        country: true,
                        highlow: true,
                        wind: true,
                        humidity: true,
                        visibility: true,
                        sunrise: true,
                        sunset: true,
                        forecast: true,
                        link: true
                    });


                });</script>
            <!--[if IE 7]>
                    <style>
                      #nav li ul{
                        margin-top:0px;
                        margin-left:-5px;
                      }
                      #nav{
                        height:85px;
                      }
                    </style>
                
                
                
            <![endif]-->

            <link rel="stylesheet" type="text/css" href="css/transmenu.css"/>
            <!--[if IE ]>
              <link rel="stylesheet" href="css/ie.css" type="text/css" >
            <![endif]-->
            <!--[if IE 7]>
              <link rel="stylesheet" href="css/ie7.css" type="text/css" media="screen, projection">
            <![endif]-->
            <style>





                .transMenu .content{

                    opacity:0.8;

                }

                #TransMenu0{

                    background:none ;

                }
                .items{

                    width:150px;
                    opacity:0.8;
                    -moz-border-radius-topright: 15px;

                    -moz-border-radius-bottomright: 15px;
                    -moz-border-radius-bottomleft: 15px;

                    -webkit-border-top-right-radius: 15px;
                    -webkit-border-top-left-radius: 15px;
                    -webkit-border-bottom-right-radius: 15px;

                    background-color:#50290A ;

                }
                .weatherFeed {
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 90%;
                    margin: 0;
                    width: 224px;
                    margin-top: -17px;
                }
                .weatherItem{
                    background-size: auto 100%;
                    background-position: left top;
                    height: 60px;
                    margin-top: -26px;
                }


                .weatherTemp{
                    color: #FDE69A;
                    float: left;
                    font-size: 35px;
                    margin-left: 55px;}


                .weatherRange{

                    top: 25px;
                    position: relative; 

                }




            </style>


    </head>
    <div id="myhtml">
        <body  onload="init();">
            <div id="mybody">


                <script type="text/javascript">





                    Cufon.replace('.weatherRange,.weatherTemp,.frm_row,.package-title_inn ,.ul-branches-menu li a,.time-city,h2,.label,#title,.mydes,.ul-topmenu li,.ul-topmidmenu li,.weather-current-dayname,.lwelcome,h2,#sun_num1,#sun_num,.tmenu li a,.package-title,.last', {
                        hover: true
                    });
                    Cufon.replace('.weatherRange,.weatherTemp,.frm_row,.package-title_inn,.weather-current-temp,.time-city,#title,.ampm,.label,.weather-current-hi-lo,.ul-branches-menu li a,.ul-topmenu li,.ul-topmidmenu li,.weather-current-dayname,.lwelcome,h2,.package-title,.weather-more-hi-lo,.weather-more-dayname,.slink,.current-hourstime,.last', {fontFamily: 'Trajan Pro'});



                    var _gaq = _gaq || [];
                    _gaq.push(['_setAccount', 'UA-18497224-1']);
                    _gaq.push(['_setDomainName', '.faizehaakimi.com']);
                    _gaq.push(['_trackPageview']);

                    (function() {
                        var ga = document.createElement('script');
                        ga.type = 'text/javascript';
                        ga.async = true;
                        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                        var s = document.getElementsByTagName('script')[0];
                        s.parentNode.insertBefore(ga, s);
                    })();





                </script>



                <?php
                if (isset($_GET['home'])){
                switch ($_GET['home']){

                case"q":


                ini_set('date.timezone', 'Asia/Jerusalem');
                echo '
<link rel="stylesheet" type="text/css" href="css/style_q.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
                $log = "images/logo_q.png";


                break;
                case"s":
                ini_set('date.timezone', 'Asia/Damascus');
                echo '
<link rel="stylesheet" type="text/css" href="css/style_s.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
                $log = "images/sham_logo.png";


                break;
                case"m":
                ini_set('date.timezone', 'Asia/Amman');
                echo '
     
<link rel="stylesheet" type="text/css" href="css/style_m.css" />

   
        <style>#cairo_link {
color:#9A5F25;
} </style>
 ';
                $log = "images/logo_m.png";
                break;

                case"c":
                $log = "images/logo.png";
                break;


                }




                }else{


                $log = "images/logo.png";



                }
                ?>
                <?if ($_GET['action']){?>
                <div class="container" id="maincontainer">
                    <div class="span-24" id="mheader">
                        <div class="span-23" id="mheader1">

                            <div class="span-5" id="logotop">
                                <a href="/" title="" class="logo"><IMG class="title" src="<?= $log ?>" alt="Faiz Cairo"></a>
                            </div>
                            <div id="topmenu"><div class="nav"> <ul id="nav" class="clearfloat">	


                                        <?
                                        $mm=$db->get_data('pages_cats','','sub_cat=0 ' ." and `type`='top'"." ".getjcity_home(). " order by `order` ");
                                        if ( count($mm)!=0)$mm[count($mm)-1]['lastone']=1;
                                        ?>



                                        <script>

                                            $(function() {




















                                                $('.submenu2').hide();
                                                $('.submenu2 a').css("font-size", "10pt");



                                                $('.tmenu li').mouseover(function() {
                                                    var mym = $(this).css("width");
                                                    $(this).children('.submenu2').show();
                                                    $(this).children('.links').addClass('myclass');

                                                })



                                                $('.tmenu li').mouseleave(function() {
                                                    $(this).children('.links').removeClass('myclass');
                                                    $('.submenu2').hide();

                                                })
                                            })

                                        </script>

                                        <?foreach ($mm as $menu){?>

                                        <div class="gmymenu">
                                            <div class="tmenu">

                                                <li class="page_item
                                                    <?if($menu['lastone']){


                                                        ?>
                                                        lastone<?}?>"
                                                    id="menuitem_<?= $menu['id'] ?>">

                                                    <a class="links" href="<?if($menu['page_id'])
                                                       {?>index.php?<?= get_city() ?>action=show_page&id=<?= $menu['page_id'] ?><?
                                                       }else{
                                                       ?><?if($menu['url']){?><?= $menu['url'] ?><?}else{?>#<?}?><?}?>" class="menu"><?= $menu['title'] ?></a>


                                                    <div class="submenu2">


                                                        <?php
                                                        $mmsub = $db->get_data('pages_cats', '', "sub_cat=".$menu['id']." ".getjcity_home(). " order by `order` ");
                                                        ?><?foreach ($mmsub as $menu2){?>

                                                        <a class="slink"  href="<?if($menu2['page_id']){?>index.php?<?= get_city() ?>&action=show_page&id=<?= $menu['page_id'] ?><?}else{?><?if($menu2['url']){?>
                                                           <?= $menu2['url'] ?><?}else{?>#<?}?><?}?>"  class="slink"  style="font-size:small;"  ><?= $menu2['title'] ?></a>


                                                        <?php } ?>



                                                    </div></li> 

                                            </div>

                                        </div>

                                        <?}?>
                                    </ul>
                                </div>


                                <div class="span-16" id="topmidmenu">     
                                    <ul class="ul-topmidmenu"> 
                                        <?php
                                        $mynews = $db->get_data('pages_cats', '', " `type`='middle'" . " " . getjcity_home());

                                        foreach ($mynews as $hp) {
                                            echo "<li><div id=\"topmidmenu-sep\"></div><a ";
                                            ?>

                                            href="<?if($hp['page_id']!=0){?>index.php?<?= get_city() ?>action=show_page&id=<?= $hp['page_id'] ?><?}else{?>
                                            index.php?<?php
                                            echo get_city();
                                            echo str_replace("?", "&", $hp['url']);
                                        }
                                        ?>" 
                                        <?php
                                        echo $hp['url'] . get_city() . " >" . $hp['title'] . "</a></li>";
                                        }
                                        ?>



                                    </ul>   </div> 
                            </div>
                        </div>

                        <div class="container span-24" id="mcontent">
                            <div class="span-24" id="rpost" > 
                                <div class="span-6" id="right-sidebar">

                                    <?php
                                    if (isset($_GET['action']) && $_GET['action'] == "glance_show") {

                                        $mmp2 = $db->get_data('a_glance', '', ' id =' . $_GET['gid'] . ' ');

                                        $mmp = $db->get_data('a_glance', '', ' `category` =' . $mmp2[0]['category'] . ' AND `delete`=0  order by `order`  ');
                                        $mmcayt = $db->get_data('a_glance_categorey', '', ' `id` =' . $mmp2[0]['category'] . '   order by `order`   ');

                                        echo '<style> #myinn li {
margin-left:-14px;
padding-left:20px;
width:160px; 
}

</style>';




                                        echo '
     <div class=package-title_inn>' . $mmcayt[0]['title'] . '</div>
     <div id=myinn>
     
    
     <ul>';
                                        foreach ($mmp as $pho) {

                                            echo '<style>.package-title{margin-left:0px;}#page-branches-menu{margin-top:10px;margin-left:5px;}</style>';


                                            echo " <li><a href=\"index.php?&action=glance_show&gid=" . $pho['id'] . "\" class=nact
          ";
                                            if ($_GET['gid'] == $pho['id']) {
                                                echo " style=\"color: #ffcc66;font-weight: bold;\" class=aact ";
                                            };

                                            echo "> " . $pho['title'] . "</a></li>";
                                            //echo$myid  ;
                                            //echo  $_GET['id']."::".$pho['id'];; 
                                        }


                                        echo ' </ul>
     </div>
     
     
     <div id=innend > </div>
     ';
                                    }
                                    if (isset($_GET['action']) && $_GET['action'] == "intro_glance" || $_GET['menu_t'] == "eag") {



                                        $ff = "16";

                                        if ($_GET['home'] == "s") {
                                            $ff = "96";
                                        }
                                        $mmp = $db->get_data('pages_cats', '', 'sub_cat="' . $ff . '" ' . " " . getjcity_home() . " order by `order` ");

                                        echo '
      <div class=package-title_inn>Gallery</div>
     <div id=myinn>
    
    
     <ul>';
                                        foreach ($mmp as $pho) {

                                            echo '<style>.package-title{margin-left:0px;}#page-branches-menu{margin-top:10px;margin-left:5px;}</style>';
                                            $ff = str_split($pho['url'], 27);

                                            $gg = str_split($ff[1], 2);
                                            ;
                                            $myid = str_replace('&', '', $gg[0]);

                                            echo " <li><a href=" . $pho['url'] . " class=nact
          ";
                                            if ($_GET['thid'] == $pho['id']) {
                                                echo " style=\"color: #ffcc66;font-weight: bold;\" class=aact ";
                                            };

                                            echo "> " . $pho['title'] . "</a></li>";
                                            //echo$myid  ;
                                            //echo  $_GET['id']."::".$pho['id'];; 
                                        }


                                        echo ' </ul>
     </div>
     
     <div id=innend > </div>
     
     ';
                                    }
                                    ?>





                                    <?php
                                    if (isset($_GET['action']) && $_GET['action'] == "photos" && $_GET['menu_t'] != "eag") {


                                        // echo getjcity_home();
                                        $ff = "15";

                                        if ($_GET['home'] == "s") {
                                            $ff = "86";
                                        }
                                        $mmp = $db->get_data('pages_cats', '', 'sub_cat="' . $ff . '" ' . " " . getjcity_home() . " order by `order` ");

                                        echo '
      <div class=package-title_inn>Gallery</div>
     <div id=myinn>
    
    
     <ul>';


                                        foreach ($mmp as $pho) {

                                            echo '<style>.package-title{margin-left:0px;}#page-branches-menu{margin-top:10px;margin-left:5px;}</style>';
                                            $ff = str_split($pho['url'], 27);

                                            $gg = str_split($ff[1], 2);
                                            ;
                                            $myid = str_replace('&', '', $gg[0]);

                                            echo " <li><a href=" . $pho['url'] . " class=nact
          ";
                                            if ($_GET['id'] == $myid) {
                                                echo " style=\"color: #ffcc66;font-weight: bold;\" class=aact ";
                                            };

                                            echo "> " . $pho['title'] . "</a></li>";
                                            //echo$myid  ;
                                            //echo  $_GET['id']."::".$pho['id'];; 
                                        }


                                        echo ' </ul>
     </div>
     
     <div id=innend > </div>
     
     ';
                                    }
                                    ?>


                                    <div class="span-8" id="page-branches-select">
                                        <div id="page-branches-menu">
                                            <ul class="ul-branches-menu">
                                                <li><a href="index.php" id="cairo_link">Cairo</a></li> 
                                                <!--	<li><a id="Quds_link" href="index.php?home=q">Quds</a></li>-->
                                                <li><a id="mutah_link" href="index.php?home=m">Mutah</a></li>
                                                <!--	<li><a id="shaam_link" href="index.php?home=s">Shaam</a></li>
                                        
                                        <li><a id="shaam_link" >&nbsp;</a></li>-->
                                            </ul>
                                        </div>
                                    </div>
                                </div>      


                                <div class="span-18" id="single-post"  > 
                                    <div class="box-bg" > 
                                        <div class="single-post post" style="margin:0;" > 


                                            <h2 style="padding:10px;"></h2> 

                                            <div id="tabsbg"></div> 
                                            <div class="scroll-pane">
                                                <div style="padding:10px;">

                                                    <?
                                                    }
                                                    //style="background:url('../images/section-2-bg.jpg') ;" 
                                                    if (isset($_GET['action']) && file_exists('actions/'.$_GET['action'].'.php'))
                                                    {
                                                    include('actions/'.$_GET['action'].'.php');
                                                    }else if(isset($_GET['action'])) {


                                                    echo "<br><div class=last> Unfortunately, the page you requested does not exist </div>";

                                                    }else{
                                                    include('actions/home.php');
                                                    }
                                                    if ($_GET['action']){
                                                    ?>
                                                </div>                                 
                                            </div>	    
                                        </div> 
                                    </div>                        
                                </div>
                            </div>  </div>


                        <div class="span-24" id="bottom-section">
                            <div class="span-6" id="prayer-times">


                                <?php
                                $mmsun = $db->get_data('site_setting', "", "id=1");

                                if (isset($_GET['home'])) {




                                    switch ($_GET['home']) {

                                        case"q":


                                            getsun('31.47', '35.12', $mmsun[0]['sun_q']);

                                            break;
                                        case"s":

                                            getsun('33.30', '36.18', $mmsun[0]['sun_s']);

                                            break;
                                        case"m":


                                            getsun('31.57', '35.52', $mmsun[0]['sun_m']);
                                            break;

                                        case"c":


                                            getsun('30.2', '31.21', $mmsun[0]['sun_c']);
                                            break;
                                    }
                                } else {

                                    getsun('30.2', '31.21', $mmsun[0]['sun_c']);
                                }
                                ?>

                            </div>
                            <?php
                            $mynews = $db->get_data('pages_cats', '', " `type`='bottom'" . " " . getjcity_home() . " order by `order` ");
                            echo "<div id=mymeny>";
                            foreach ($mynews as $hp) {
                                echo "<li><div id=\"topmidmenu-sep\"></div><a ";
                                ?>

                                href="<?if($hp['page_id']!=0){?>index.php?<?= get_city() ?>action=show_page&id=<?= $hp['page_id'] ?><?}else{?>
                                index.php?<?php
                                echo get_city();
                                echo str_replace("?", "&", $hp['url']);
                            }
                            ?>" 
                            <?php
                            echo $hp['url'] . get_city() . " >" . $hp['title'] . "</a></li>";
                            }
                            echo "</div>";
                            ?>



                            <div class="span-24" id="footer">

                                </a> <span> Copyright &copy; 2010 Faiz-e-Haakimi. All rights reserved, Site Developed by</span>

                                <a target="_blank" href="http://www.e-scapes.me/">E-Scapes</a>



                            </div>


                        </div>
                    </div>
                </div>



                <?}?>










                <?php
                if (isset($_GET['home'])) {
                    switch ($_GET['home']) {

                        case"q":
                            ini_set('date.timezone', 'Jerusalem');
                            echo '
<link rel="stylesheet" type="text/css" href="css/style_q.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
                            break;
                        case"s":
                            ini_set('date.timezone', 'Asia/Damascus');
                            echo '
<link rel="stylesheet" type="text/css" href="css/style_s.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
                            break;
                        case"m":
                            ini_set('date.timezone', 'Asia/Amman');
                            echo '
     
<link rel="stylesheet" type="text/css" href="css/style_m.css" />

   
        <style>#cairo_link {
color:#9A5F25;
} </style>
 ';
                            break;
                    }
                }
                ?>  


            </div>
            <div id='test'></div>
            <div class='scrollable'></div>
        </body></div></html>

<!-- Start of Zopim Live Chat Script -->

<script type="text/javascript">
    /*document.write(unescape("%3Cscript src='" + document.location.protocol + "//zopim.com/?yGXZCk9d3rDXGvbMq7uOupfv4xdtXj82' charset='utf-8' type='text/javascript'%3E%3C/script%3E"));
     $zopim.livechat.setLanguage('en')*/
</script>
<!-- End of Zopim Live Chat Script -->




<!DOCTYPE html>


<?php

// <editor-fold defaultstate="collapsed" desc="comment">


function getModileStting() {
    /* @var $lib  /libs\libs */
    global $lib;
    return $lib->db->get_row("sys_mobile_setting", "*");
}

$mysetting = getModileStting();


$theme = $mysetting["theme"];



if ($mysetting['pages_transition'] == "rondome") {



    $a = array("fade", "pop", "flip", "turn", "flow", "slidefade", "slide", "slidedown", "slideup");
    $rand_keys = array_rand($a, 1);
    $mysetting['pages_transition'] = $a[$rand_keys];
}

function getMenuHear($men, $position, $theme) {

    if (isset($men) && trim($men) != "" && trim($men) != "0") {
        return '<a  data-icon="bars" data-theme="' . $theme . '" href="#menupanel_' . $position . '" class="menubt"   data-iconpos="notext" ></a>';
    }
}

function getMenu($men, $position, $s) {




    $r = "";

    if (isset($men) && trim($men) != "" && trim($men) != "0") {

        $mydata = array(
            "id" => "0"
            , "morecss" => ""
            , "class" => "nostyle"
            , "type" => "mod_Menu",
            "view_title" => "0"
        );


        $pro = array(
            "selecmenu" => $men,
            "myid" => "0",
            "title" => "0",
            "button" => "1",
            "pages_transition" => $s['pages_transition']
        );


        $r = ' <div data-role="panel"   data-theme="' . $s['theme'] . '" id="menupanel_' . $position . '" class="menuPanel_' . $position . '" data-position="' . $position . '" data-theme="a">	
                <div class="panel-content">';
        $r.= getmoduleMobileBydata($mydata, $pro, $type = "");

        $r.="   </div>
            </div>";
    }
    return $r;
}

function getNavbar($men, $position, $s) {

    $r = "";

    if (isset($men) && trim($men) != "" && trim($men) != "0") {

        $mydata = array(
            "id" => "0"
            , "morecss" => ""
            , "class" => "nostyle"
            , "type" => "mod_Menu",
            "view_title" => "0"
        );


        $pro = array(
            "selecmenu" => $men,
            "myid" => "0",
            "title" => "0",
            "button" => "0",
            "pages_transition" => $s['pages_transition']
        );


        $r = ' <div data-theme="' . $s['theme'] . '" data-role="' . $position . '">		
	<div data-role="navbar">';
        $r.= getmoduleMobileBydata($mydata, $pro, $type = "");

        $r.="   </div><!-- /navbar -->
</div><!-- /footer -->";
    }
    return $r;
}

function backBT($bool, $theme) {

    if ($bool) {
        return '<a data-icon="back" href="" data-iconpos="notext"  data-theme="' . $theme . '"  data-rel="back" data-transition="slideup"></a>';
    }
}

function HomeBT($bool, $theme) {

    if ($bool) {
        return '<a data-icon="home" href="/" data-iconpos="notext"  data-theme="' . $theme . '"  data-rel="home" data-transition="slideup"></a>';
    }
}

/*
  backbt
  homebt */


// </editor-fold>
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title><?= getPageTitle() ?></title>

        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.css" />

        <link rel="stylesheet" href="/templates/moblie/themes/escapes.css" /> 
        <link rel="stylesheet" href="/templates/moblie/themes/escapes.min.css" /> 

        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.js"></script>

        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>



        <script src="/lib/js/mobileUtils.js"></script>




        <script>



        </script>

    </head>
    <body>









        <?php
        /*
         *  $form = array(
          "formstart" => array(
          "name" => "formstart",
          "type" => "form",
          "acton" => "",
          "method" => "post",
          "moreAttra" => "data-info='" . $this->util->getmyurl("admin") . "'",
          "novalidation" => "1",
          "name" => $this->table_name . "addForm",
          "class" => $this->table_name . "addForm  block-content"
          )
          );







          $this->formes->filds = $form;
         */




        /* @var $lib  libs\libs */
        global $lib;







        if ($lib->front->menuData['mei_main'] == "sys_mobile_application") {
            echo getMainMobile();
        } else {
            ?>

            <div data-role="page"  id="Gallery1" class="gallery-page thispage"  id="home" data-theme="<?= $theme ?>">
                <div aria-level="1"  data-role="header" data-theme="<?= $theme ?>">


                    <div data-role="header" data-theme="<?= $theme ?>">


                        <?= HomeBT($mysetting['homebt'], $theme) ?>
                        <?= backBT($mysetting['backbt'], $theme) ?>

                        <?= getMenuHear($mysetting['right_menu'], "right", $theme) ?>


                        <h1  data-iconpos="notext"  class='logo'></h1>
                        <?= getMenuHear($mysetting['left_menu'], "left", $theme) ?>
                    </div>

                </div><!-- /header -->
                <?= getNavbar($mysetting['header_bar'], "header", $mysetting) ?>


                <div data-role="content"  class='content' data-theme="<?= $theme ?>" >


                    <h3 class="pageTitle"><?= getPageTitle() ?></h3>



                    <?= getMainMobile() ?>

                </div>
                <?= getMenu($mysetting['right_menu'], "right", $mysetting) ?>
                <?= getMenu($mysetting['left_menu'], "left", $mysetting) ?>
                <?= getNavbar($mysetting['footer_bar'], "footer", $mysetting) ?>
            </div>
            <?php
        };
        ?>


    </body>
</html>








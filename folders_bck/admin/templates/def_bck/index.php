<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
?>

<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<?php
/* @var $lib  libs\libs */
global $lib;
$sidebarlitCss = "display:none";
$mainCss = "";

if ($lib->util->getProperty("sidebar") == "close") {
    $sidebarCss = "display:none";

    $sidebarlitCss = "display:block";

    $mainCss = "margin-left:42px;";
} else {

    $sidebarCss = "";
    $mainCss = "";
}
$image = "";
if ($lib->users->getUser("image") == "") {
    $image = "images/avatar_small.png";
} else {
    $image = "../uploads/images/" . $lib->users->getUser("image");
}



;
?>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link type = "text/css" href =" templates/def/css/style.css" rel = "stylesheet" />

        <script  src =" templates/def/js/script.js" ></script>





    </head>
    <body>
        <div id='header-surround'>
            <header id="header"> 
                <div class="logo"><a class='' href='http://e-scapes.me'><img src="images/logo.png" alt="E-scapes" class="logo"></a></div>
                <div class="divider-header divider-vertical"></div>
                <div id="user-info"> <p> <span class="messages">Hello <a href=""><?= $lib->users->getUser('name') ?></a> ( <a href=""><img src="images/mail.png" alt="Messages"> 0 new messages</a> )</span> <a href="?view=site_setting" class="toolbox-action button">Settings</a> <a href="?view=logout" class="button red">Logout</a> </p> </div>
            </header>
        </div>



        <div id='sidebarlit' style='<?= $sidebarlitCss ?>' >
            <div class='slidebarstp'>

            </div>
            <?= creat_module("mod_defaultMenu") ?> 
        </div> 

        <div id='sidebar' style='<?= $sidebarCss ?>'>

            <div id="search-bar"><div class='slidebarst'></div>  <form id="search-form" name="search-form" action="search.php" method="post"> <input type="text" id="query" name="query" value="" autocomplete="off" placeholder="Search" class="text placeholder"> </form></div>
            <section id="login-details">
                <a href="?view=com_update_my_date">
                    <img class="img-left framed"  style='max-width: 110px;'src="<?= $image ?>" alt="Hello Admin"> 
                </a>

                <h3>Logged in as</h3> <h2><a class="user-button" >
                        <?= $lib->users->getUser('name') ?>&nbsp;<span class="arrow-link-down"></span></a>
                </h2> <ul class="dropdown-username-menu"> 
                    <li><a href="?view=com_update_my_date">my Settings</a></li> 
                    <li><a href="?view=com_users">Users</a></li> 
                    <li><a href="?view=site_setting">Settings</a></li> 
                    <li><a href="#">Messages</a></li> 
                    <li><a href="?view=logout">Logout</a></li> </ul> <div class="clearfix"></div>
            </section>

            <?= creat_module("mod_defaultMenu") ?> </div>

        <div class='main' style='<?= $mainCss ?>'> 



            <div id="title-bar"> <ul id="breadcrumbs"> <li><a href="index.php" title="Home"><span id="bc-home"></span></a></li> <li class="no-hover"><?= getTitle() ?> </li> </ul> </div>  
            <div id='main-content'>
                <div class='container_12'>


                    <?php creat_main(); ?>


                </div>

            </div>
        </div>











        <div id="fuf">

            <?= creat_module("mod_favorites") ?> 

        </div>


        <footer id="footer">

            <div class="container_12"> 
                <div class="grid_12"> 
                    <div class="footer-icon align-right"> <a class="showfuf" ></a></div>

                    <div class="footer-icon align-center"><a class="top" href="#top"></a></div>



                </div> </div></footer>


        <div class='lightbox_bg'></div>

        <div class='lightbox'><div class='lightbox_title'></div><div class='lightbox_close'></div><div class="lightbox_body"> </div></div>


    </body>
</html>


<script>

    $(function() {


        $(".lightbox_close").click(function() {


            $(".lightbox").fadeOut();
            $(".lightbox_bg").fadeOut();

        })


    })




    $(".def_menu_all .menu-parent .title").show();












</script>





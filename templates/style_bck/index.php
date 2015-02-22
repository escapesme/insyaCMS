<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1.0,minimum-scale=1.0 ,initial-scale=1.0">


        <?php
        
        ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);




        $pro = getProperties();
        $template_url = getTemplateLink();
        global $lib;
        echo getHeader();
        $mymenu = getModule("our_menu");
        $mainmenu = getModule("mainmenu");
        $getmymani = getMain();
        ?>
        <link rel="stylesheet" href="/includes/js/lightbox/s3/colorbox.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
        <script src="/includes/js/lightbox/jquery.colorbox.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="/lib/js/util.js"></script>

        <link rel="stylesheet" href="/<?= $template_url ?>/css/default.css" type="text/css"  />
        <link rel="stylesheet" href="/<?= $template_url ?>/css/style.css" type="text/css"/>
        <link   href="/<?= $template_url ?>/css/phone.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width:700px)" />
        <link   href="/<?= $template_url ?>/css/medium.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 601px) and (max-width: 800px)" />
        
        
        
        
        <script type = "text/javascript" src = "/<?= $template_url ?>/js/js.js"></script>
        
        <?= $lib->util->get_to_head(); ?> 

        <?= getMoreCss() ?></style>
    <title><?= getWidowsTitle() ?></title>




    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



    
    <?php if (isset($_GET["lang"])) {
        ?>
        <link rel="stylesheet" href="/<?= $template_url ?>/css/<?= $_GET["lang"] ?>.css" type="text/css"/>

        
          <link   href="/<?= $template_url ?>/css/phone_<?= $_GET["lang"] ?>.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width: 700px)" />
        <link   href="/<?= $template_url ?>/css/medium_<?= $_GET["lang"] ?>.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 601px) and (max-width: 800px)" />
      
        

        <?php
    }
    ?>
    

</head>
<body class='<?= pageType() ?>'>   



    <?php
   
    if ((isset($_GET['main']) && $_GET['catid'] == 'main') || isset($_GET['main'])) {

        echo $getmymani;
    } else {
        ?>


        <header>
            <div class="headerTop">
                <div class='pdata'>
                    <a href='/'><div class='logo'></div> </a>
                    
                    <div class='menuphonebt'></div>
                    <div class='menudata'><?= $mainmenu ?></div> 
                    <div class='langBar'>
                        
                            <?= getModule("lang") ?>
                    </div>
                </div>
            </div>

            <?php if (ishome()) { ?>
                <div class="slideShow">
                    <div class='pdata'><div class='slideShowData'><?= getModule("slide_show") ?></div></div>
                </div>
            <?php } ?>


        </header>

        <section class="main">

            <div class='mianTop'><?= getModule("main_top") ?></div>
            <div class='main'><?= $getmymani ?></div>
            <div class='mianBottom'><?= getModule("mian_bottom") ?></div>



        </section>



        <footer>
            <div class='pdata'>

                <div class='mod footer'><?= getModule("footer") ?></div>
                <div class='mod copyright'><?= getModule("copyright") ?></div>
            </div>
        </footer>






    <?php } ?>







</body>
</html>

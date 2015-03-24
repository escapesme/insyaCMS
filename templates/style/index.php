<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1.0,minimum-scale=1.0 ,initial-scale=1.0">


        <?php
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


        <link   href="/<?= $template_url ?>/css/phone.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width: 900px)" />

        <link   href="/<?= $template_url ?>/css/medium.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 601px) and (max-width: 800px)" />


        <script type = "text/javascript" src = "/<?= $template_url ?>/js/my.js"></script>



        <script type = "text/javascript" src = "/<?= $template_url ?>/js/cufon-yui.js"></script>
        <script type = "text/javascript" src = "/<?= $template_url ?>/js/Trajan_Pro_400-Trajan_Pro_700.font.js"></script>

        <?= $lib->util->get_to_head(); ?> 


        <?= getMoreCss() ?></style>
    <title><?= getPageTitle() ?></title>




    <script>





    </script>



    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">

        </script>



</head>
<body>   




    <div class='body_data'>

        <div class='phonemenuData'>
            <?= $mainmenu ?>
            <?= $mymenu ?>
        </div>

        <div class='otherData'>

            <div class='header toclear'>

                <div class='data'>
                    <div class='header toclear'>   <div class='phonemenuBT'></div>

                        <div class='toleft logo'></div>
                        <div class='toright mainmenu modcont'><?= $mainmenu ?></div>

                    </div>
                    <div class='our_menu toclear'>

                        <div class='mainmenu modcont'><?= $mymenu ?></div>
                    </div>
                </div>
            </div>



            <div class='dataBody'>

                <div class='slideshow toclear'>
                    <div class='data modcont'>
                        <?= getModule("slideShow") ?>
                        <div class='left toleft modcont'><?= getModule("slideShow_left") ?></div>
                        <div class='right toright toright modcont'><?= getModule("slideShow_right") ?></div>
                    </div>
                </div>



                <div class='maindata toclear'> 

                    <div class='data'>

                        <div class='main_top_left modcont'><?= getModule("main_top_left") ?></div>
                        <div class='main_top_right modcont'><?= getModule("main_top_right") ?></div>
                        <?php if (!ishome()) { ?>
                            <div class='maindatabottom toclear'> 
                                <div class='left toleft modcont'><?= getModule("left") ?></div>
                                <div class='main  modcont'>
                                    <div class='pageTitle'><?= getPageTitle() ?></div>
                                    <?= $getmymani ?></div></div>
                        <?php } ?>


                        <div class='main_bottom modcont'><?= getModule("main_bottom") ?></div>

                    </div>
                </div>

                <div class='toclear' style="width:100%; height:1px;">



                </div>
                <div class='footer toclear'>
                    <div class='data'>     
                        <div class='left toleft modcont'><?= getModule("footer_left") ?></div>
                        <div class='right toright toright modcont'><?= getModule("footer_right") ?></div>
                    </div>
                    <div class='toclear' style="width:100%; height:1px;">
                        <div class='copyright toclear'>

                            <div class='data'>
                                <div class='left toleft modcont'><?= getModule("copyright") ?></div>

                            </div>
                        </div>   
                        <div class='toclear' style="width:100%; height:1px;">
                        </div> </div> </div>
                </body>
                </html>
                <script>
                    $(function() {
                        $(".modcont,.moduletable").each(function() {

                            if ($.trim($(this).html()) == "") {
                                $(this).css("display", "none");
                            }

                        })


                    })

                </script>

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
        $getmymani = getMain();
        ?>
        <link rel="stylesheet" href="/includes/js/lightbox/s3/colorbox.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
        <script src="/includes/js/lightbox/jquery.colorbox.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="/lib/js/util.js"></script>




        <link rel="stylesheet" href="/<?= $template_url ?>/css/default.css" type="text/css"  />

        <link rel="stylesheet" href="/<?= $template_url ?>/css/style.css" type="text/css"/>


        <link   href="/<?= $template_url ?>/css/phone.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width: 900px)" />

        <link   href="/<?= $template_url ?>/css/medium.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 601px) and (max-width: 800px)" />



        <script type = "text/javascript" src = "/<?= $template_url ?>/js/js.js"></script>



        <?= $lib->util->get_to_head(); ?> 

        <?= getMoreCss() ?></style>
    <title><?= getWidowsTitle() ?></title>




    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




</head>
<body class='<?= pageType() ?>'>   
    <div class="mainData">
        <?= $getmymani ?></div>
</body>
</html>

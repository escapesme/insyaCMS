<?php
/* @var $lib  libs\libs */
global $lib;
session_start();
$image = "";
if ($lib->users->getUser("image") == "") {
    $image = "images/avatar_small.png";
} else {
    $image = "../uploads/images/" . $lib->users->getUser("image");
}
$main = creat_main();
?>

<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="templates/def/font-awesome/css/font-awesome.css" rel="stylesheet">



        <link type = "text/css" href =" templates/def/css/style.css" rel = "stylesheet" />
        <link type = "text/css" href =" templates/def/css/layout.css" rel = "stylesheet" />
        <link type = "text/css" href =" templates/def/css/build.css" rel = "stylesheet" />
        <script src="templates/def/js/script.js" ></script>

<link rel="stylesheet" type="text/css" href="/includes/js/lightbox/fancyBox/jquery.fancybox.css?v=2.1.5" media="screen" />

        <script type="text/javascript" src="/includes/js/lightbox/fancyBox/jquery.fancybox.js?v=2.1.5"></script>
	



        <link rel="stylesheet" href="templates/def/standalone/switchery.css" />
        <script src="templates/def/standalone/switchery.js"></script>




        <script>



            $(function() {

                $(".content").tooltip({
                    position: {
                        my: "center bottom-20",
                        at: "center top",
                        using: function(position, feedback) {
                            $(this).css(position);
                            $("<div>")
                                    .addClass("arrow")
                                    .addClass(feedback.vertical)
                                    .addClass(feedback.horizontal)
                                    .appendTo(this);
                        }
                    }
                });




            });
        </script>
    </head>
    <body>
        <div class='databody <?= $_SESSION['barStatus'] ?>'>
            <header>
                <div class='header-seperation closed'>
                    <div class="site_title">   <a title='Admin home' href='/admin/'><?php echo $lib->util->siteSetting['title']; ?></a></div>
                    <ul class="headerBar">

                        <li><a class="slideClose"><i class="fa  fa-bars"></i> </a></li>
                        <li><a href="/" class="home"><i class="fa fa-home"></i> </a></li>

                    </ul>


                </div>
                <div class='userData'>
                    <a href="?view=logout"><li class="fa fa-power-off  fa-fw"></li></a>
                    <img class="img-left framed"  src="<?= $image ?>" alt="Hello Admin"> 
                    <div class="username"> <?= $lib->users->getUser('name') ?></div>

                </div>
            </header>
            <section class='page  '>


                <section class='page-sidebar '>

                    <?= creat_module("mod_defaultMenu") ?> 




                </section>
                <section class='page-content'>

                    <div class='content'>

                        <?= $main ?>
                    </div>
                </section>
            </section>
            <div></div>
        </div>
    </body>
</html>




<script type="text/javascript">


    var elems = Array.prototype.slice.call(document.querySelectorAll('.ios'));

        elems.forEach(function(html) {
        
   
    var switchery = new Switchery(html , {color: '#0aa699'});
    });
</script>











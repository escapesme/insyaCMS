<?php
session_start();


/*
 * 
 * <script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
 */
$header = '
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBmvvx5LsvKen4a9qjbI6DtA9DIamaNQ_A&sensor=true"></script>

<link type = "text/css" href = "/lib/css/utile.css" rel = "stylesheet" />


<link type = "text/css" href = "http://code.jquery.com/ui/1.10.3/themes/flick/jquery-ui.css" rel = "stylesheet" />

<script type = "text/javascript" src = "/includes/js/jquery.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>



<script type="text/javascript" src="/includes/js/jquery.lazyload.js"></script>


<script type="text/javascript" src="/includes/js/jscripts/tiny_mce/jquery.tinymce.min.js"></script>


<script src="/includes/js/jquery-gmaps-latlon-picker.js"></script>



<link rel="stylesheet" media="screen" type="text/css" href="/includes/js/colorpicker/css/colorpicker.css" />

<link rel="stylesheet" type="text/css" media="screen" href="/includes/js/upload/fileuploader.css"/>


<link type = "text/css" href = "/includes/js/jqueryv/style.css" rel = "stylesheet" />


<script type = "text/javascript" src = "/includes/js/jquery.timer.js"></script>

<link rel="stylesheet" href="/includes/js/webticker.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />


<script type = "text/javascript" src = "/includes/js/jquery.webticker.js"></script>




<script type="text/javascript" src="/includes/js/jscripts/tiny_mce/jquery.tinymce.js"></script>

<script type="text/javascript" src="/includes/js/jqueryUi/jqueryui.js"></script>

<script type="text/javascript" src="/includes/js/colorpicker/js/colorpicker.js"></script>




<script type="text/javascript" src="/includes/js/upload/fileuploader.js"></script>



<script type="text/javascript" src="/includes/js/jquery.lazy.min.js"></script>

<script type="text/javascript" src="/lib/js/forms_fornt.js"></script>





<link rel="stylesheet" href="/includes/js/nivo/css/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/includes/js/nivo/css/themes/light/light.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/includes/js/nivo/css/themes/dark/dark.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/includes/js/nivo/css/themes/bar/bar.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/includes/js/nivo/css/nivo-slider.css" type="text/css" media="screen" />

<script language="javascript" type="text/javascript" src="/includes/js/nivo/js/jquery.nivo.slider.js"></script>
  <script language="javascript" type="text/javascript" src="/includes/js/my.js"></script>



';


$myurl = "";


ini_set("display_errors", 0);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);






ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
require_once("lib/libs.php");




//echo $_SERVER['HTTP_USER_AGENT'] . "\n\n";

$browser = get_browser(null, true);



/* @var $lib  libs\libs */
global $lib;




/*
  if (isset($_SESSION['invitationcode'])) {

  //

  $data = $lib->db->get_row("com_invitation", "*", "code='" . $_SESSION['invitationcode'] . "'");
  if (is_array($data)) {

  if ($_GET['alias'] == "closehome"||$_GET['alias'] == "") {

  $_GET['alias'] = "home";
  }
  } else {

  $_GET['alias'] = "closehome";
  }
  }else{

  $_GET['alias'] = "closehome";

  }

 */



require_once("includes/php/facebookphp/src/facebook.php");

$config = array(
    'appId' => $lib->util->siteSetting['facebookappid'],
    'secret' => 'YOUR_APP_SECRET',
    'fileUpload' => false, // optional
    'allowSignedRequest' => false, // optional, but should be set to false for non-canvas apps
);

$facebook = new Facebook($config);




$header.= '   
<script type="text/javascript" language="javascript" src="/' . $lib->util->mylink("module", "mod_Slider") . 'js/jquery.carouFredSel.js"></script>
		<!-- optionally include helper plugins -->
		<script type="text/javascript" language="javascript" src="/' . $lib->util->mylink("module", "mod_Slider") . 'js/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" language="javascript" src="/' . $lib->util->mylink("module", "mod_Slider") . 'js/helper-plugins/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" language="javascript" src="/' . $lib->util->mylink("module", "mod_Slider") . 'js/helper-plugins/jquery.transit.min.js"></script>
		<script type="text/javascript" language="javascript" src="/' . $lib->util->mylink("module", "mod_Slider") . 'js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>

	';






$lib->front->updatedata();

// $lib->plugins->importPlugin("plg_ipData");

function detect_mobile() {
    if (preg_match('/(alcatel|amoi|android|avantgo|blackberry|benq|cell|cricket|docomo|elaine|htc|iemobile|iphone|ipad|ipaq|ipod|j2me|java|midp|mini|mmp|mobi|motorola|nec-|nokia|palm|panasonic|philips|phone|playbook|sagem|sharp|sie-|silk|smartphone|sony|symbian|t-mobile|telus|up\.browser|up\.link|vodafone|wap|webos|wireless|xda|xoom|zte)/i', $_SERVER['HTTP_USER_AGENT']))
        return true;
    else
        return false;
}

function getModuleMobile($postion, $type = "") {
    /* @var $lib  libs\libs */
    global $lib;
    return $lib->front->getmoduleMobile($postion, $type);
}

function getmoduleMobileBydata($mydata, $pro, $type = "") {
    /* @var $lib  libs\libs */
    global $lib;
    return $lib->front->getmoduleMobileBydata($mydata, $pro, $type);
}

function getModule($postion, $type = "") {
    /* @var $lib  libs\libs */
    global $lib;
    return $lib->front->getmodule($postion, $type);
}

function getMain() {

    global $lib;
    return $lib->front->getmain();
}

function getMainMobile() {

    global $lib;
    return $lib->front->getmainMobile();
}

function getTemplateLink() {
    global $lib;
    return $lib->front->templatelink;
}

function getPageTitle() {
    global $lib;
    $returnData = "";
    $utitle = $lib->util->page->get_title();
    if (trim($utitle) != "") {
        $returnData = $utitle;
    } else {
        $returnData = $lib->front->menuData['mei_title'];
    }
    return $lib->util->out($returnData, true);
    ;
}

function getWidowsTitle() {
    global $lib;

    $returnData = "";
    $utitle = $lib->util->page->get_Windowstitle();

    if (trim($utitle) != "") {
        $returnData = $utitle;
    } else {

        $returnData = $lib->front->menuData['mei_title'];
    }





    return $lib->util->out($returnData, true);
}

function getPageComeent() {
    global $lib;
    return $lib->front->menuData['mei_comment'];
}

function getMoreCss() {
    global $lib;
    return $lib->front->templateData['morecss'];
}

function ishome() {

    global $lib;
    $returnData = false;
    if ($lib->front->menuData['mei_home'] == "1") {

        $returnData = true;
    }
    return $returnData;
}

function pageType() {

    $r = "inner";
    if (ishome()) {

        $r = "home";
    }

    return $r;
}

function getPageID() {
    global $lib;
    return $lib->front->menuData['id'];
}

function getHeader() {
    global $lib;
    global $header;
    $keywords = "";

    //." ".   ." ". 
    $itemKets = $lib->util->page->get_key();
    $aliasKeys = $lib->front->menuData['keywords'];
    $siteKeys = $lib->util->siteSetting['site_keywords'];


    $itemdes = $lib->util->page->get_des();
    $aliasdes = $lib->front->menuData['description'];
    $sitedes = $lib->util->siteSetting['site_meta'];
    $des = "";






    //$lib->util->get_to_head();

    if (trim($itemdes) != "") {
        $des = $itemdes;
    } else if (trim($aliasdes) != "") {
        $des = $aliasdes;
    } else {
        $des = $sitedes;
    }
    if (trim($itemKets) != "") {
        $keywords = $itemKets;
    } else if (trim($aliasKeys) != "") {
        $keywords = $aliasKeys;
    } else if (trim($siteKeys) != "") {
        $keywords = $siteKeys;
    }







    return '
' . $lib->front->getheader() .
            $lib->util->siteSetting['addto_headre'] . $lib->util->page->get_head() .
            "<meta name='keywords'  content='" . $keywords . "' />
            <meta name='description'   content='" . $des . "'  />  " .
            $header . $lib->front->menuData['header']
    ;
}

function getProperties() {
    global $lib;
    return $lib->util->getFromProperits($lib->front->templateData['properties']);
}

if (isset($_GET['alias']) && $_GET['alias'] == '404') {


    require_once 'templates/404/index.php';
} else if ((isset($_GET['catid']) && $_GET['catid'] == 'print') || isset($_GET['print'])) {
    echo"
    <!DOCTYPE html>
<html>


    <head> 
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
    <link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"/includes/print.css\"/>


</head>
    <body>";






    echo getMain();

    echo" </body>
</html>";
} else if ((isset($_GET['main']) && $_GET['catid'] == 'main') || isset($_GET['main'])) {

    getMain();
} else if (detect_mobile()) {



    $lib->front->getmobilePage();
} else if ($lib->util->siteSetting['offline'] != "1") {

    /*

      $ismobile = check_user_agent('mobile');
      if ($ismobile) {
      $lib->front->getmobilePage();
      } else {
     */
    $lib->front->getmobilePage();
    //  $lib->front->getpage();
    // }

    $t .= "<style>";


    if (trim($lib->front->menuData['mei_background']) != "") {
        $t.= "  body{ background-image:url(/uploads/images/" . $lib->front->menuData['mei_background'] . ") !important; }";
    }
    $t.= $lib->front->menuData['mei_morecss'] . "
</style>";




    echo $t;
} else {
    echo "<style>
        html{
        background:url('/uploads/images/" . $lib->util->siteSetting['offline_background'] . "')}
            

.center-msg{
            
 position: fixed;
top:40%;
left:40%;
border:1px solid #999;
padding:5px;
}
            
" . $lib->util->siteSetting['offline_morecss'] . " 
            
</style>";

    echo "<div class='center-msg'>" . $lib->util->siteSetting['offline_message'] . "</style>";
}

/* USER-AGENTS
  ================================================== */

function check_user_agent($type = NULL) {
    $user_agent = strtolower($_SERVER['HTTP_USER_AGENT']);
    if ($type == 'bot') {
        // matches popular bots
        if (preg_match("/googlebot|adsbot|yahooseeker|yahoobot|msnbot|watchmouse|pingdom\.com|feedfetcher-google/", $user_agent)) {
            return true;
            // watchmouse|pingdom\.com are "uptime services"
        }
    } else if ($type == 'browser') {
        // matches core browser types
        if (preg_match("/mozilla\/|opera\//", $user_agent)) {
            return true;
        }
    } else if ($type == 'mobile') {
        // matches popular mobile devices that have small screens and/or touch inputs
        // mobile devices have regional trends; some of these will have varying popularity in Europe, Asia, and America
        // detailed demographics are unknown, and South America, the Pacific Islands, and Africa trends might not be represented, here
        if (preg_match("/phone|iphone|itouch|ipod|symbian|android|htc_|htc-|palmos|blackberry|opera mini|iemobile|windows ce|nokia|fennec|hiptop|kindle|mot |mot-|webos\/|samsung|sonyericsson|^sie-|nintendo/", $user_agent)) {
            // these are the most common
            return true;
        } else if (preg_match("/mobile|pda;|avantgo|eudoraweb|minimo|netfront|brew|teleca|lg;|lge |wap;| wap /", $user_agent)) {
            // these are less common, and might not be worth checking
            return true;
        }
    }
    return false;
}
?>

<div id="fb-root"></div>

<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=<?= trim($lib->util->siteSetting['facebookappid']) ?>";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

</script>



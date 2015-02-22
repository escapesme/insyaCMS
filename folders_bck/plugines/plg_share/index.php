

<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function plg_share($p, $l) {
    global $lib;

    $returnData = "";




    /* @var $lib libs\libs */
    global $lib;
    ;


    if ($p['follow'] == "1") {



        if ($p['twitter'] != "") {

            $returnData .= '<div class="flo">
   


<a href="https://twitter.com/' . $p['twitter'] . '" class="twitter-follow-button" data-show-count="true" data-show-screen-name="false">Follow </a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\'://platform.twitter.com/widgets.js\';fjs.parentNode.insertBefore(js,fjs);}}(document, \'script\', \'twitter-wjs\');</script>
</div>
  ';
        }



        if ($p['facebook'] != "") {



            $returnData .= '<div class="flo">
        <div class="fb-like" 
        data-href="https://www.facebook.com/' . $p['facebook'] . '"
        data-layout="button_count" 
        data-action="like" 
        data-show-faces="false" 
        data-share="false" >
        </div></div>
';
        }


        if ($p['google'] != "") {
            $returnData .= '<div class="flo ">
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<g:plusone data-href="//plus.google.com/' . $p['google'] . '" ></g:plusone>

';
            $returnData .= '</div>';
        }
    }






    if ($p['share'] == "1") {






        if ($p['sharfacebook'] == "1") {


            $url = $lib->util->siteSetting['site_link'] . '' . $_GET['alias']."/".$_GET['catid']."/".$_GET['id']."/";


            $returnData .= ' <div class="shearData">    
                            <div class="fb-share-button"  
                            data-count="vertical" 
                            data-href="' .$url . '" 
                            data-type="box_count"></div></div> ';
        }

        if ($p['shartwitter'] == "1") {

            $returnData .= '   <div class="shearData">   <a href="https://twitter.com/share" data-count="vertical" class="twitter-share-button" >Tweet</a>
                            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\'://platform.twitter.com/widgets.js\';fjs.parentNode.insertBefore(js,fjs);}}(document, \'script\', \'twitter-wjs\');</script>
                         </div>';
        }
        if ($p['sharinlink'] == "1") {
            $returnData .= '   <div class="shearData">  
                            <script src="//platform.linkedin.com/in.js" type="text/javascript">
                             lang: en_US
                            </script>
                            <script type="IN/Share" data-counter="top"></script></div>
                            ';
        }
        if ($p['shargoogle'] == "1") {
            $returnData .= '  <div class="shearData">  '
                    . '
<script type="text/javascript" src="https://apis.google.com/js/platform.js">
  {parsetags: \'explicit\'}
</script>
<div class="g-plusone" data-size="tall"></div>
<script type="text/javascript">gapi.plusone.go();</script>'
                    . '</div>';
        }
    }








    if ($p['links'] == "1") {











        $returnData .= ' <div class="sociallinks">';
        if ($p['linksfacebook'] != "") {
            $returnData .= '       <li> <a class="fburl" href="https://www.facebook.com/' . $p['linksfacebook'] . '">FB</a></li>';
        }
        if ($p['linkstwitter'] != "") {


            $returnData .= '        <li><a class="tiwurl" href="https://twitter.com/' . $p['linkstwitter'] . '">T</a></li> ';
        }
        if ($p['linksgoogle'] != "") {









            $returnData .= '        <li><a class="googleurl" href="https://plus.google.com/' . $p['linksgoogle'] . '">G+</a></li> ';
        }
        if ($p['linksinlink'] != "") {


            $returnData .= '        <li><a class="linkurl" href="https://www.linkedin.com/' . $p['linksinlink'] . '">IN</a></li> ';
        }

        $returnData .= ' </div>';
    }










    return $returnData;
}
?>

<style>

    .sociallinks a {
        width: 35px;
        height: 35px;
        background: url('images/fbicone.png') no-repeat scroll center center #FFF;
        display: block;
        border-radius: 17px;

        color: blue;
        text-align: center;
        line-height: 35px;
    }



</style>


<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_social_Buttons($p, $l) {
    global $lib;

    $returnData = "";





    

    /* @var $lib libs\libs */
    global $lib;



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
            $returnData .= '<div class="datashare"><div class="flo ">
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<g:plusone data-href="//plus.google.com/' . $p['google'] . '" ></g:plusone></div>

';
            $returnData .= '</div>';
        }
    }

    if ($p['share'] == "1") {












        if ($p['sharfacebook'] != "1") {

            $returnData .= '  <div class="datashare">    
                            <div class="fb-share-button"  
                            data-count="vertical" 
                            data-href="http://madad.com.eg/Project/Environment/%D8%AA%D9%86%D9%88%D9%8A%D8%B1-%D8%A7%D9%84%D8%AD%D9%8A%D8%B2/" 
                            data-type="box_count"></div></div>';
        }

        if ($p['shartwitter'] != "1") {

            $returnData .= '  <div class="datashare">   <a href="https://twitter.com/share" data-count="vertical" class="twitter-share-button" >Tweet</a>
                            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\'://platform.twitter.com/widgets.js\';fjs.parentNode.insertBefore(js,fjs);}}(document, \'script\', \'twitter-wjs\');</script></div>
                         ';
        }
        if ($p['sharinlink'] != "1") {
            $returnData .= '  
                           <div class="datashare"> <script src="//platform.linkedin.com/in.js" type="text/javascript">
                             lang: en_US
                            </script>
                            <script type="IN/Share" data-counter="top"></script></div>
                            ';
        }
        if ($p['shargoogle'] != "1") {
            $returnData .= '  
                   <div class="datashare"> <div class="g-plus" data-action="share" data-annotation="vertical-bubble" data-height="60"></div>
                    <script type="text/javascript">
                      (function() {
                        var po = document.createElement(\'script\'); po.type =\'text/javascript\'; po.async = true;
                        po.src = \'https://apis.google.com/js/platform.js\';
                        var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(po, s);
                      })();
                    </script></div>';
        }
    }








    if ($p['links'] == "1") {











        $returnData .= ' <div class="sociallinks">';
        if ($p['linksfacebook'] != "") {
            $returnData .= '       <li> <a target="_blank" class="fburl" href="https://www.facebook.com/' . $p['linksfacebook'] . '">FB</a></li>';
        }
        if ($p['linkstwitter'] != "") {


            $returnData .= '        <li><a  target="_blank" class="tiwurl" href="https://twitter.com/' . $p['linkstwitter'] . '">T</a></li> ';
        }
        if ($p['linksgoogle'] != "") {


            $returnData .= '        <li><a target="_blank"  class="googleurl" href="https://plus.google.com/' . $p['linksgoogle'] . '">G+</a></li> ';
        }
        if ($p['linksinlink'] != "") {


            $returnData .= '        <li><a target="_blank" class="linkedurl" href="https://www.linkedin.com/' . $p['linksinlink'] . '">IN</a></li> ';
        } if ($p['linksyoutube'] != "") {


            $returnData .= '        <li><a target="_blank" class="linksyoutube" href="http://www.youtube.com/' . $p['linksyoutube'] . '">IN</a></li> ';
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
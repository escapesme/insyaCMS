

<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
global $lib;




$mode = $lib->variables->url_mode;
if (isset($_GET[$mode])) {



    if (isset($_GET['type']) && $_GET['type'] == "component") {

        echo $lib->adminEng->getComponentMain("com_install", "components_porperties", $_GET[$mode]);
    } else if (isset($_GET['type']) && $_GET['type'] == "module") {

        echo $lib->adminEng->getComponentMain("com_install", "modules_porperties", $_GET[$mode]);
    } else if (isset($_GET['type']) && $_GET['type'] == "template") {

        echo $lib->adminEng->getComponentMain("com_install", "templates_porperties", $_GET[$mode]);
    } else if (isset($_GET['type']) && $_GET['type'] == "plugin") {

        echo $lib->adminEng->getComponentMain("com_install", "plugin_porperties", $_GET[$mode]);
    }
} else {





    echo
    "
<ul class='tabs'>
     <li id='installcomponent'>install component</li>
     <li id='installmodules'>install modules</li>
        <li id='installTemplate'>install Template</li>
          <li id='installplugin'>install Plugin</li>
</ul>
<div class='tabdivs'>
<div class='tabdiv installcomponent'>";
    $lib->adminEng->getComponentMain("com_install", "components_porperties");
    echo "</div>
<div class='tabdiv installmodules'>";
    $lib->adminEng->getComponentMain("com_install", "modules_porperties");
    echo "</div>
<div class='tabdiv installTemplate'>";
    $lib->adminEng->getComponentMain("com_install", "templates_porperties");
    echo "</div>
                
<div class='tabdiv installplugin'>";
    $lib->adminEng->getComponentMain("com_install", "plugin_porperties");
    echo "</div>

</ div>
";
}
?>

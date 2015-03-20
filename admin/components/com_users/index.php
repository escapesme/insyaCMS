<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

global $lib;





$lib->userPanel->updatePlugins();


$this->moreToGroup = $lib->userPanel->getadmingroups();






echo $lib->adminEng->getComponentMain();
?>



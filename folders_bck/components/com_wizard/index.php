<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro) {
    global $lib;
    $data = "";





    postDataSteps($pro);
    $stepes = getSteps($pro);


    $data = createStepesBar($stepes);

    return$data;
}
?>



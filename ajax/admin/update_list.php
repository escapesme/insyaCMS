<?php
session_start();

/* @var $lib  libs\libs */
global $lib;
//"listBody"

$lib->admin->tabheader=FALSE;
echo $lib->adminEng->getComponentMain("","", $_GET['mode'],"");
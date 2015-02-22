<?php

/* @var $lib  libs\libs */
global $lib;

$data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['ej'] . ";getType__data"); 
echo json_encode($data);


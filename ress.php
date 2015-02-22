
<?php
header('Content-Type: application/rss+xml; charset=ISO-8859-1');
 
ini_set("display_errors", 0);

require_once("lib/libs.php");

error_reporting(E_ALL);

global $lib;

echo '<per>';
$lib->rss->setChannel();
$lib->rss->setNewsrss();
$lib->rss->rssburn();

echo '</per>';
?>
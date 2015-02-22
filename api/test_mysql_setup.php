<?php
$submitted = 'no';
$user = 'matahene_3mr';
$password = '3mrmosho';
$host = 'localhost';
$port = '3306';
$server = '';
$database = 'matahene_faiz';
$query = 'show databases';
//$_POST['query'] = 'show databases';

$query = $_POST['query'];
print_r($_POST);
$submitted = 'yes';
if ($_POST) {
    if (isset($_POST['query'])) {
        /* 
          $user = $_POST['user'];
          $password = $_POST['password'];
          $host = $_POST['host'];
          $port = $_POST['port'];
          $server = $host . ':' . $port;
          $database = $_POST['database']; */
    }
}



if ($submitted == 'yes') {
    $link = mysql_connect($server, $user, $password);
    if (!$link) {
        die('ERROR: Could not connect: ' . mysql_error());
    }

    $db_selected = mysql_select_db($database, $link);
    if (!$db_selected) {
        do_close($link);
        die('ERROR: Could not select database: ' . $database . ': error = ' . mysql_error());
    }

    $result = mysql_query($query, $link);
    if (!$result) {
        $message = 'ERROR: ' . mysql_error();
        die($message);
    }

    while ($row = mysql_fetch_row($result)) {
        $count = count($row);
        $y = 0;
        while ($y < $count) {
            echo current($row) . ' ';
            next($row);
            $y = $y + 1;
        }
     
    }
    mysql_free_result($result);
    do_close($link);
}

function do_close($link) {
    mysql_close($link);
}
?>


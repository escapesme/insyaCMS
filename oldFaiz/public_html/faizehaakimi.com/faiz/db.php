<?
mysql_connect("localhost","root","fola");
mysql_select_db("sports");
mysql_query("mysql -h localhost -u root -p mysql < test.sql") or die(mysql_error())
?>
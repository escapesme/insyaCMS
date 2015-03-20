<?php

error_reporting(0);
//MySQL Lib Version 2.0.2
class opt{
	var $order_a;
	var $order_d;
	var $start_from;
	var $num_rows;
	var $rkey;
}

class db_driver {

	var $obj = array ( "sql_database"   => ""         ,
	"sql_user"       => "root"     ,
	"sql_pass"       => ""         ,
	"sql_host"       => "localhost",
	"sql_port"       => ""         ,
	"persistent"     => "0"         ,
	"sql_tbl_prefix" => "phpbb_"      ,
	"cached_queries" => array(),
	'debug'          => 0,
	);
	var $opt;
	var $query_id      = "";
	var $connection_id = "";
	var $query_count   = 0;
	var $record_row    = array();
	var $return_die    = 0;
	var $error         = "";

	/*========================================================================*/
	// Connect to the database
	/*========================================================================*/
	function db_driver(){
		$this->opt = new opt;
	}
	function connect() {

		if ($this->obj['persistent'])
		{
			$this->connection_id = mysql_pconnect( $this->obj['sql_host'] ,
			$this->obj['sql_user'] ,
			$this->obj['sql_pass']
			);
		}
		else
		{
			$this->connection_id = mysql_connect( $this->obj['sql_host'] ,
			$this->obj['sql_user'] ,
			$this->obj['sql_pass']
			);
		}

		if ( !mysql_select_db($this->obj['sql_database'], $this->connection_id) )
		{
			echo ("ERROR: Cannot find database ".$this->obj['sql_database']);
		}
		if($this->server_ver() > '4.1'){
			$this->query("SET NAMES 'utf8'");
		}
	}



	/*========================================================================*/
	// Process a query
	/*========================================================================*/

	function query($the_query, $bypass=0) {

		//--------------------------------------
		// Change the table prefix if needed
		//--------------------------------------
		if ($bypass != 1)
		{
			if ($this->obj['sql_tbl_prefix'] != "axp_")
			{
				$the_query = preg_replace("/axp_(\S+?)([\s\.,]|$)/", $this->obj['sql_tbl_prefix']."\\1\\2", $the_query);
			}
		}

		if ($this->obj['debug'])
		{
			global $Debug, $system;

			//$Debug->startTimer();
		}

		$this->query_id = mysql_query($the_query, $this->connection_id);

		if (! $this->query_id )
		{
			$this->fatal_error("mySQL query error: $the_query");
		}

		if ($this->obj['debug'])
		{
			//$endtime = $Debug->endTimer();

			if ( preg_match( "/^select/i", $the_query ) )
			{
				$eid = mysql_query("EXPLAIN $the_query", $this->connection_id);
				$system->debug_html .= "<table width='95%' border='1' cellpadding='6' cellspacing='0' bgcolor='#FFE8F3' align='center'>
										   <tr>
										   	 <td colspan='8' style='font-size:14px' bgcolor='#FFC5Cb'><b>Select Query</b></td>
										   </tr>
										   <tr>
										    <td colspan='8' style='font-family:courier new, courier, monaco, arial;font-size:14px'>$the_query</td>
										   </tr>
										   <tr bgcolor='#FFC5Cb'>
											 <td><b>table</b></td><td><b>type</b></td><td><b>possible_keys</b></td>
											 <td><b>key</b></td><td><b>key_len</b></td><td><b>ref</b></td>
											 <td><b>rows</b></td><td><b>Extra</b></td>
										   </tr>\n";
				while( $array = mysql_fetch_array($eid) )
				{
					$type_col = '#FFFFFF';

					if ($array['type'] == 'ref' or $array['type'] == 'eq_ref' or $array['type'] == 'const')
					{
						$type_col = '#D8FFD4';
					}
					else if ($array['type'] == 'ALL')
					{
						$type_col = '#FFEEBA';
					}

					$system->debug_html .= "<tr bgcolor='#FFFFFF'>
											 <td>$array[table]&nbsp;</td>
											 <td bgcolor='$type_col'>$array[type]&nbsp;</td>
											 <td>$array[possible_keys]&nbsp;</td>
											 <td>$array[key]&nbsp;</td>
											 <td>$array[key_len]&nbsp;</td>
											 <td>$array[ref]&nbsp;</td>
											 <td>$array[rows]&nbsp;</td>
											 <td>$array[Extra]&nbsp;</td>
										   </tr>\n";
				}

				if ($endtime > 0.1)
				{
					$endtime = "<span style='color:red'><b>$endtime</b></span>";
				}

				$system->debug_html .= "<tr>
										  <td colspan='8' bgcolor='#FFD6DC' style='font-size:14px'><b>mySQL time</b>: $endtime</b></td>
										  </tr>
										  </table>\n<br />\n";
			}
			else
			{
				$system->debug_html .= "<table width='95%' border='1' cellpadding='6' cellspacing='0' bgcolor='#FEFEFE'  align='center'>
										 <tr>
										  <td style='font-size:14px' bgcolor='#EFEFEF'><b>Non Select Query</b></td>
										 </tr>
										 <tr>
										  <td style='font-family:courier new, courier, monaco, arial;font-size:14px'>$the_query</td>
										 </tr>
										 <tr>
										  <td style='font-size:14px' bgcolor='#EFEFEF'><b>mySQL time</b>: $endtime</span></td>
										 </tr>
										</table><br />\n\n";
			}
		}

		$this->query_count++;

		$this->obj['cached_queries'][] = $the_query;

		return $this->query_id;
	}

	function unb_query($the_query, $bypass=0) {

		//--------------------------------------
		// Change the table prefix if needed
		//--------------------------------------

		if ($bypass != 1)
		{
			if ($this->obj['sql_tbl_prefix'] != "axp_")
			{
				$the_query = preg_replace("/axp_(\S+?)([\s\.,]|$)/", $this->obj['sql_tbl_prefix']."\\1\\2", $the_query);
			}
		}

		if ($this->obj['debug'])
		{
			global $Debug, $system;

			//$Debug->startTimer();
		}

		$this->query_id = mysql_unbuffered_query($the_query, $this->connection_id);

		if (! $this->query_id )
		{
			$this->fatal_error("mySQL query error: $the_query");
		}

		if ($this->obj['debug'])
		{
			//$endtime = $Debug->endTimer();

			if ( preg_match( "/^select/i", $the_query ) )
			{
				$eid = mysql_query("EXPLAIN $the_query", $this->connection_id);
				$system->debug_html .= "<table width='95%' border='1' cellpadding='6' cellspacing='0' bgcolor='#FFE8F3' align='center'>
										   <tr>
										   	 <td colspan='8' style='font-size:14px' bgcolor='#FFC5Cb'><b>Select Query</b></td>
										   </tr>
										   <tr>
										    <td colspan='8' style='font-family:courier new, courier, monaco, arial;font-size:14px'>$the_query</td>
										   </tr>
										   <tr bgcolor='#FFC5Cb'>
											 <td><b>table</b></td><td><b>type</b></td><td><b>possible_keys</b></td>
											 <td><b>key</b></td><td><b>key_len</b></td><td><b>ref</b></td>
											 <td><b>rows</b></td><td><b>Extra</b></td>
										   </tr>\n";
				while( $array = mysql_fetch_array($eid) )
				{
					$type_col = '#FFFFFF';

					if ($array['type'] == 'ref' or $array['type'] == 'eq_ref' or $array['type'] == 'const')
					{
						$type_col = '#D8FFD4';
					}
					else if ($array['type'] == 'ALL')
					{
						$type_col = '#FFEEBA';
					}

					$system->debug_html .= "<tr bgcolor='#FFFFFF'>
											 <td>$array[table]&nbsp;</td>
											 <td bgcolor='$type_col'>$array[type]&nbsp;</td>
											 <td>$array[possible_keys]&nbsp;</td>
											 <td>$array[key]&nbsp;</td>
											 <td>$array[key_len]&nbsp;</td>
											 <td>$array[ref]&nbsp;</td>
											 <td>$array[rows]&nbsp;</td>
											 <td>$array[Extra]&nbsp;</td>
										   </tr>\n";
				}

				if ($endtime > 0.1)
				{
					$endtime = "<span style='color:red'><b>$endtime</b></span>";
				}

				$system->debug_html .= "<tr>
										  <td colspan='8' bgcolor='#FFD6DC' style='font-size:14px'><b>mySQL time</b>: $endtime</b></td>
										  </tr>
										  </table>\n<br />\n";
			}
			else
			{
				$system->debug_html .= "<table width='95%' border='1' cellpadding='6' cellspacing='0' bgcolor='#FEFEFE'  align='center'>
										 <tr>
										  <td style='font-size:14px' bgcolor='#EFEFEF'><b>Non Select Query</b></td>
										 </tr>
										 <tr>
										  <td style='font-family:courier new, courier, monaco, arial;font-size:14px'>$the_query</td>
										 </tr>
										 <tr>
										  <td style='font-size:14px' bgcolor='#EFEFEF'><b>mySQL time</b>: $endtime</span></td>
										 </tr>
										</table><br />\n\n";
			}
		}

		$this->query_count++;

		$this->obj['cached_queries'][] = $the_query;

		return $this->query_id;
	}


	/*========================================================================*/
	// Fetch a row based on the last query
	/*========================================================================*/

	function fetch_row($query_id = "",$chr=0) {

		if ($query_id == ""){
			$query_id = $this->query_id;
		}

		$this->record_row = mysql_fetch_array($query_id, MYSQL_ASSOC);
		if (is_array($this->record_row)){
			foreach ($this->record_row AS $key => $value){
				//this is for the arabic chaters
				if ($chr){
					$value=str_replace("<","",$value);
					$value=str_replace(">","",$value);
				}
				$this->record_row[$key]=$value;
			}
		}
		return $this->record_row;

	}

	/*========================================================================*/
	// Fetch the number of rows affected by the last query
	/*========================================================================*/

	function get_affected_rows() {
		return mysql_affected_rows($this->connection_id);
	}

	/*========================================================================*/
	// Fetch the number of rows in a result set
	/*========================================================================*/

	function get_num_rows() {
		return mysql_num_rows($this->query_id);
	}

	/*========================================================================*/
	// Fetch the last insert id from an sql autoincrement
	/*========================================================================*/

	function get_insert_id() {
		return mysql_insert_id($this->connection_id);
	}

	/*========================================================================*/
	// Return the amount of queries used
	/*========================================================================*/

	function get_query_cnt() {
		return $this->query_count;
	}

	/*========================================================================*/
	// Free the result set from mySQLs memory
	/*========================================================================*/

	function free_result($query_id="") {

		if ($query_id == "") {
			$query_id = $this->query_id;
		}

		@mysql_free_result($query_id);
	}

	/*========================================================================*/
	// Shut down the database
	/*========================================================================*/

	function close_db() {
		return mysql_close($this->connection_id);
	}

	/*========================================================================*/
	// Return an array of tables
	/*========================================================================*/

	function get_table_names() {

		$result     = mysql_list_tables($this->obj['sql_database']);
		$num_tables = @mysql_numrows($result);
		for ($i = 0; $i < $num_tables; $i++)
		{
			$tables[] = mysql_tablename($result, $i);
		}

		mysql_free_result($result);

		return $tables;
	}

	/*========================================================================*/
	// Return an array of fields
	/*========================================================================*/

	function get_result_fields($query_id="") {

		if ($query_id == "")
		{
			$query_id = $this->query_id;
		}

		while ($field = mysql_fetch_field($query_id))
		{
			$Fields[] = $field;
		}

		//mysql_free_result($query_id);

		return $Fields;
	}

	/*========================================================================*/
	// Basic error handler
	/*========================================================================*/

	function fatal_error($the_error) {
		global $INFO;


		// Are we simply returning the error?

		if ($this->return_die == 1)
		{
			$this->error = mysql_error();
			return TRUE;
		}

		$the_error .= "\n\nmySQL error: ".mysql_error()."\n";
		$the_error .= "mySQL error code: ".mysql_errno()."\n";
		$the_error .= "Date: ".date("l dS of F Y h:i:s A");

		$out = "<html><head><title>Database Error</title>
    		   <style>P,BODY{ font-family:arial,sans-serif; font-size:11px; }</style></head><body>
    		   &nbsp;<br><br><blockquote><b>There appears to be an error with the {$INFO['board_name']} database.</b><br>
    		   You can try to refresh the page by clicking <a href=\"javascript:window.location=window.location;\">here</a>, if this
    		   does not fix the error, you can contact the board administrator by clicking <a href='mailto:{$INFO['email_in']}?subject=SQL+Error'>here</a>
    		   <br><br><b>Error Returned</b><br>
    		   <form name='mysql'><textarea rows=\"15\" cols=\"60\">".htmlspecialchars($the_error)."</textarea></form><br>We apologise for any inconvenience</blockquote></body></html>";


		echo($out);
		die("");
	}

	/*========================================================================*/
	// Create an array from a multidimensional array returning formatted
	// strings ready to use in an INSERT query, saves having to manually format
	// the (INSERT INTO table) ('field', 'field', 'field') VALUES ('val', 'val')
	/*========================================================================*/

	function compile_db_insert_string($data) {

		$field_names  = "";
		$field_values = "";

		foreach ($data as $k => $v) {
			$v = preg_replace( "/'/", "\\'", $v );
			//$v = preg_replace( "/#/", "\\#", $v );
			$field_names  .= "$k,";
			$field_values .= "'$v',";
		}

		$field_names  = preg_replace( "/,$/" , "" , $field_names  );
		$field_values = preg_replace( "/,$/" , "" , $field_values );

		return array( 'FIELD_NAMES'  => $field_names,
		'FIELD_VALUES' => $field_values,
		);
	}

	/*========================================================================*/
	// Create an array from a multidimensional array returning a formatted
	// string ready to use in an UPDATE query, saves having to manually format
	// the FIELD='val', FIELD='val', FIELD='val'
	/*========================================================================*/

	function compile_db_update_string($data) {

		$return_string = "";

		foreach ($data as $k => $v) {
			$v = preg_replace( "/'/", "\\'", $v );
			$return_string .= $k . "='".$v."',";
		}

		$return_string = preg_replace( "/,$/" , "" , $return_string );

		return $return_string;
	}


	//-------------------------------------------


	function insert_row_city($table,$data) {
		$data = $this->filter_values($table,$data);
		foreach ($data as $k => $v) {
			$sql_felds.="`".$k."`,";
			$sql_valus.="'".$v."',";
		}
		$sql_felds=substr($sql_felds, 0, (strlen($sql_felds)-1));
		$sql_valus=substr($sql_valus, 0, (strlen($sql_valus)-1));
        if (isset($_SESSION['login_city'])){
		$sql="INSERT INTO $table ($sql_felds,`city`)VALUES($sql_valus,'".$_SESSION['login_city']."')";
        }else{
            $sql="INSERT INTO $table ($sql_felds)VALUES($sql_valus)";
        }
        
        //echo $sql;
		$result=$this->unb_query($sql);
		return $result;
	}
	function insert_row($table,$data) {
		$data = $this->filter_values($table,$data);
		foreach ($data as $k => $v) {
			$sql_felds.="`".$k."`,";
			$sql_valus.="'".$v."',";
		}
		$sql_felds=substr($sql_felds, 0, (strlen($sql_felds)-1));
		$sql_valus=substr($sql_valus, 0, (strlen($sql_valus)-1));
		$sql="INSERT INTO $table ($sql_felds)VALUES($sql_valus)";
		$result=$this->unb_query($sql);
		return $result;
	}

	function insert_data($table,$data) {

		foreach ($data as $row){
			$sql_felds="";
			$sql_valus="";
			foreach ($row as $k => $v){
				$sql_felds.="`".$k."`,";
				$sql_valus.="'".$v."',";
			}
			$sql_felds=substr($sql_felds, 0, (strlen($sql_felds)-1));
			$sql_valus=substr($sql_valus, 0, (strlen($sql_valus)-1));
			$sql="INSERT INTO $table ($sql_felds)VALUES($sql_valus)";
			$result.=$this->unb_query($sql);
		}

		return $result;
	}
	//-----------------------------
	function delete_row($table,$id=0,$where="",$pri_key='id') {

		if ($id||$where){
			if ($id){$id=' '.$pri_key.'='.$id;}
			$sql="DELETE FROM $table WHERE$id $where  LIMIT 1";
		}
		$result=$this->unb_query($sql);
		return $result;
	}
	function delete_data($table,$where=0) {
		if ($where){
			$sql="DELETE FROM $table WHERE $where";
		}
		$result=$this->unb_query($sql);
		return $result;
	}
	//-----------------------------
	function get_data_query($sql) {
		$result=$this->query($sql);
		$i=0;
		while ($row=$this->fetch_row()){
			$rows[$i]=$this->clean_d($row);
			$i++;
		}
		return $rows;
	}
function clean_d($row){
	foreach ($row as $k=>$v){
		$row[$k]=str_replace('\"','',$v);
	}
	return $row;
}










	function get_data($table,$data="",$where="",$debug="",$no_pre=1) {

		if ($no_pre){
		$pre='';
		}else{
		$pre='`';
		}
		if(is_array($data)){
			foreach ($data as $k => $v) {
				$sql_felds.=$pre.$v.$pre.',';
			}
			$sql_felds=substr($sql_felds, 0, (strlen($sql_felds)-1));
		}else {
			if ($data){
				$sql_felds=$pre.$data.$pre;
			}else{
				$sql_felds='*';
			}
		}

		if (!$sql_felds){$sql_felds="*";}
		if ($where){$where="WHERE ".$where;}
		if ($this->opt->order_a){$options.=' ORDER BY '.$pre.$this->opt->order_a.$pre.' ASC';$this->opt->order_a="";}
		if ($this->opt->order_d){$options.=' ORDER BY '.$pre.$this->opt->order_d.$pre.' DESC';$this->opt->order_d="";}

		if ($this->opt->num_rows){
			if ($this->opt->start_from){
				$options.=" LIMIT ".$this->opt->start_from.",".$this->opt->num_rows;
			}else {
				$options.=" LIMIT 0,".$this->opt->num_rows;
			}
		}

		$sql="SELECT $sql_felds FROM $table $where $options";
		if ($debug){
		debug($sql,$debug);
		}
		$result=$this->query($sql);
		$i=0;
		while ($row=$this->fetch_row()){
			if ($this->opt->rkey){
				$rows[$row[$this->opt->rkey]]=$this->clean_d($row);
			}else{
				$rows[]=$this->clean_d($row);
			}

			$i++;
		}
		$this->opt->rkey='';
		$this->opt->num_rows=0;
		if(is_array($rows)){
			return $rows;
		}else{
			return array();
		}
	}
	function get_data_list($table,$data,$where="",$pri_key='id') {
		$sql_felds=''.$pri_key.','.$data.'';
		if ($where){$where="WHERE ".$where;}
		if ($this->opt->order_a){$options.=' ORDER BY '.$pre.$this->opt->order_a.$pre.' ASC';$this->opt->order_a="";}
		if ($this->opt->order_d){$options.=' ORDER BY '.$pre.$this->opt->order_d.$pre.' DESC';$this->opt->order_d="";}
		if ($this->opt->num_rows){
			if ($this->opt->start_from){
				$options.=" LIMIT ".$this->opt->start_from.",".$this->opt->num_rows;
			}else {
				$options.=" LIMIT 0,".$this->opt->num_rows;
			}
		}

		$sql="SELECT $sql_felds FROM $table $where $options";
		if ($debug){
		debug($sql,$debug);
		}
		$result=$this->query($sql);
		$i=0;
		while ($row=$this->fetch_row()){
				$rows[$row[$pri_key]]=$this->clean_d($row[$data]);
			$i++;
		}
		return $rows;
	}
	function get_row($table,$data="",$where="",$debug=0) {
		if(is_array($data)){
			foreach ($data as $k => $v) {
				$sql_felds.="".$v.",";
			}
			$sql_felds=substr($sql_felds, 0, (strlen($sql_felds)-1));
		}else{
			$sql_felds=$data;
		}

		if (!$sql_felds){$sql_felds="*";}
		if ($where){$where="WHERE ".$where;}
		$sql="SELECT $sql_felds FROM $table $where";
		if ($debug){
			debug($sql);
		}
		$result=$this->query($sql);
		$rows=$this->fetch_row();
		return $this->clean_d($rows);
	}
	//-----------------------------
	function update_row($table,$data,$id="",$where="") {
		$data = $this->filter_values($table,$data);
		if(!$id&&!$where){
		return 0;
		}
		foreach ($data as $k => $v) {
			$sql_data.="`$k`='$v',";
		}
		$sql_data=substr($sql_data, 0, (strlen($sql_data)-1));
		if ($id){$where=" WHERE id=$id";}else {$where=" WHERE ".$where;}
		$sql="UPDATE `$table` SET $sql_data $where";

		$result=$this->unb_query($sql);
		return $result;
	}
	function update_data($table,$data,$where) {
		foreach ($data as $k => $v) {
			$sql_data.="`$k`='$v',";
		}
		$sql_data=substr($sql_data, 0, (strlen($sql_data)-1));
		$sql="UPDATE `$table` SET $sql_data WHERE $where";
		$result=$this->unb_query($sql);
		return $result;
	}
	function duplicate_row($table,$id,$override_data){
		$row1=$this->get_row($table,"","id=$id");
		$row1['id']="";
		foreach ($override_data as $k=>$v){
			$row1[$k]=$v;
		}
		$this->insert_row($table,$row1);
		return "Row (id:$id) Duplicated...";
	}

	//meta-data functions
	function server_ver(){
		return mysql_get_server_info();
	}
	function get_table_fields($table_name){

		return $this->get_data_query('SHOW COLUMNS FROM '.$table_name);
	}
	function filter_values($table_name,$values){
		$fildes = $this->get_table_fields($table_name);

		foreach ($fildes as $f){
			if ($values[$f['Field']] != ''){
				$new_values[$f['Field']]=$values[$f['Field']];
			}
		}

		return $new_values;
	}
	function get_next_id($table_name){
		$data=$this->get_data_query("SHOW TABLE STATUS LIKE '$table_name'");


		return $data[0]['Auto_increment'];
	}
	//-----------------------------
} // end class

$db = new db_driver;
include 'config.php';
$db->obj['sql_database'] = $config['db_name'];
$db->obj['sql_user']        = $config['db_user'];
$db->obj['sql_pass']       = $config['db_pass'];
$db->obj['sql_host']        = $config['db_host'];
$db->obj['sql_tbl_prefix']= $config['db_prefix'];
// Get a DB connection

$db->connect();

//include_once("functions.php")
?>

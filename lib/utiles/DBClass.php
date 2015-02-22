<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */






/**
 * Namespace containing the basic utility classes.
 */

namespace libs\utiles;

/**
 * Class that acts as a place holder for the database connection options.
 */
class opt {

    /**
     *
     * @var String sets the order mode to ascending 
     */
    var $order_a;

    /**
     *
     * @var String sets the order mode to descending 
     */
    var $order_d;

    /**
     *
     * @var int number of the starting row
     */
    var $start_from;

    /**
     *
     * @var int number of rows to include in the result set 
     */
    var $num_rows;

    /**
     *
     * @var int key of the results set  
     */
    var $rkey;

}

/**
 * This class is the main class for all the database releated informations.
 */
class dbClass {

    var $obj = array("sql_database" => "",
        "sql_user" => "root",
        "sql_pass" => "",
        "sql_host" => "localhost",
        "sql_port" => "",
        "persistent" => "0",
        "sql_tbl_prefix" => "phpbb_",
        "cached_queries" => array(),
        'debug' => 0,
    );
    var $opt;
    var $query_id = "";
    var $connection_id = "";
    var $query_count = 0;
    var $record_row = array();
    var $return_die = 0;
    var $error = "";
    var $getDleleted = "";
    var $getEnable = "";
    var $getDisable = "";
    var $returnSQL = "";

    /**
     * Initializes the database options class.
     */
    function db_driver() {
        $this->opt = new opt;
    }

    /**
     * <p> Constructor of the dbclass. 
     * @param String $sql_host the url of the database host.
     * @param String $sql_user username to be used when connecting to the database.
     * @param String $sql_pass password for the passed username.
     * @param String $db_name name of the database to connect to.
     */
    function __construct($sql_host, $sql_user, $sql_pass, $db_name) {
        $this->obj['sql_host'] = $sql_host;
        $this->obj['sql_user'] = $sql_user;
        $this->obj['sql_pass'] = $sql_pass;
        $this->obj['sql_database'] = $db_name;
    }

    /**
     * Establishes a connection to the database using the information passed in the class constructor.
     * @global configClass $config
     */
    function connect() {



        global $config;
        if ($this->obj['persistent']) {
            $this->connection_id = mysql_pconnect($this->obj['sql_host'], $this->obj['sql_user'], $this->obj['sql_pass']);
        } else {
            $this->connection_id = mysql_connect($this->obj['sql_host'], $this->obj['sql_user'], $this->obj['sql_pass']);
        }

        if (!mysql_select_db($this->obj['sql_database'], $this->connection_id)) {
            echo ("ERROR: Cannot find database " . $this->obj['sql_database']);
        }
        if ($this->server_ver() > '4.1') {
            $this->query("SET NAMES 'utf8'");
        }
    }

    /**
     * Excutes an SQL query. Also generates the suitable debug messages if in debug mode.
     * @param String $the_query the query to be excuted
     * @param int $bypass dictates wether to use a prefix to the table name or not.
     * @return int The excuted query id.
     */
    function query($the_query, $bypass = 0, $widthouterror = 0) {


        if ($bypass != 1) {
            if ($this->obj['sql_tbl_prefix'] != "axp_") {
                $the_query = preg_replace("/axp_(\S+?)([\s\.,]|$)/", $this->obj['sql_tbl_prefix'] . "\\1\\2", $the_query);
            }
        }

        if ($this->obj['debug']) {
            global $Debug, $system;

            //$Debug->startTimer();
        }



        $this->query_id = mysql_query($the_query);


        if ($widthouterror != 0) {
            if (!$this->query_id) {
                return 0;
            }
        } else {
            if (!$this->query_id) {
                $this->fatal_error("mySQL query error: $the_query");
            }
        }
        if ($this->obj['debug']) {
            //$endtime = $Debug->endTimer();

            if (preg_match("/^select/i", $the_query)) {
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
                while ($array = mysql_fetch_array($eid)) {
                    $type_col = '#FFFFFF';

                    if ($array['type'] == 'ref' or $array['type'] == 'eq_ref' or $array['type'] == 'const') {
                        $type_col = '#D8FFD4';
                    } else if ($array['type'] == 'ALL') {
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

                if ($endtime > 0.1) {
                    $endtime = "<span style='color:red'><b>$endtime</b></span>";
                }

                $system->debug_html .= "<tr>
										  <td colspan='8' bgcolor='#FFD6DC' style='font-size:14px'><b>mySQL time</b>: $endtime</b></td>
										  </tr>
										  </table>\n<br />\n";
            } else {
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

    /**
     * Excutes an SQL unbuffered query. Unbeuffered query sends an SQL query to MySQL without fetching and buffering the result rows.
     * @param String $the_query
     * @param type $bypass dictates wether to use a prefix to the table name or not.
     * @return int The id of the excuted query.
     */
    function unb_query($the_query, $bypass = 0) {



        if ($bypass != 1) {
            if ($this->obj['sql_tbl_prefix'] != "axp_") {
                $the_query = preg_replace("/axp_(\S+?)([\s\.,]|$)/", $this->obj['sql_tbl_prefix'] . "\\1\\2", $the_query);
            }
        }

        if ($this->obj['debug']) {
            global $Debug, $system;

            //$Debug->startTimer();
        }

        $this->query_id = mysql_unbuffered_query($the_query);

        if (!$this->query_id) {
            $this->fatal_error("mySQL query error: $the_query");
        }

        if ($this->obj['debug']) {
            //$endtime = $Debug->endTimer();

            if (preg_match("/^select/i", $the_query)) {
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
                while ($array = mysql_fetch_array($eid)) {
                    $type_col = '#FFFFFF';

                    if ($array['type'] == 'ref' or $array['type'] == 'eq_ref' or $array['type'] == 'const') {
                        $type_col = '#D8FFD4';
                    } else if ($array['type'] == 'ALL') {
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

                if ($endtime > 0.1) {
                    $endtime = "<span style='color:red'><b>$endtime</b></span>";
                }

                $system->debug_html .= "<tr>
										  <td colspan='8' bgcolor='#FFD6DC' style='font-size:14px'><b>mySQL time</b>: $endtime</b></td>
										  </tr>
										  </table>\n<br />\n";
            } else {
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

    /**
     * Fetch a row based on an excuted query based on its id. If no id is given the last query will be used.
     * @param int $query_id The id of the excuted query.
     * @param type $chr
     * @return Array An array containing the row.
     */
    function fetch_row($query_id = "", $chr = 0) {

        if ($query_id == "") {
            $query_id = $this->query_id;
        }

        $this->record_row = mysql_fetch_array($query_id, MYSQL_ASSOC);
        if (is_array($this->record_row)) {
            foreach ($this->record_row AS $key => $value) {
                //this is for the arabic chaters
                if ($chr) {
                    $value = str_replace("<", "", $value);
                    $value = str_replace(">", "", $value);
                }
                $this->record_row[$key] = $value;
            }
        }
        return $this->record_row;
    }

    /**
     * Fetch the number of rows affected by the last query
     * @return int the number of affected rows on success, and -1 if the last query
     * failed.
     */
    function get_affected_rows() {
        return mysql_affected_rows($this->connection_id);
    }

    /**
     * Get number of rows in result
     * @return int The number of rows in a result set on success or <b>FALSE</b> on failure.
     */
    function get_num_rows() {
        return mysql_num_rows($this->query_id);
    }

    /**
     * Fetch the last insert id from an sql autoincrement
     * @return int The ID generated for an AUTO_INCREMENT column by the previous
     */
    function get_insert_id() {
        return mysql_insert_id($this->connection_id);
    }

    /**
     * Get the amount of queries used in the current database connection.
     * @return int the amount of queries used
     */
    function get_query_cnt() {
        return $this->query_count;
    }

    /**
     * Free the result set from mySQLs memory using the passed query id.
     * @param int $query_id The query id to free its result set. If no id passed, the last query id will be used.
     */
    function free_result($query_id = "") {

        if ($query_id == "") {
            $query_id = $this->query_id;
        }

        @mysql_free_result($query_id);
    }

    /**
     * Close MySQL connection
     * @return bool <b>TRUE</b> on success or <b>FALSE</b> on failure.
     */
    function close_db() {
        return mysql_close($this->connection_id);
    }

    /**
     * Creates an array containing the names of the tables in the currently opened database.
     * @return Array An array containing the table names.
     */
    function get_table_names() {

        $result = mysql_list_tables($this->obj['sql_database']);
        $num_tables = @mysql_numrows($result);
        for ($i = 0; $i < $num_tables; $i++) {
            $tables[] = mysql_tablename($result, $i);
        }

        mysql_free_result($result);

        return $tables;
    }

    /**
     * Get columns information from a result and return as an array
     * @param int $query_id Query id to get the columns information for.
     * @return Array Array of the columns names.
     */
    function get_result_fields($query_id = "") {

        if ($query_id == "") {
            $query_id = $this->query_id;
        }

        while ($field = mysql_fetch_field($query_id)) {
            $Fields[] = $field;
        }

        //mysql_free_result($query_id);

        return $Fields;
    }

    /**
     * Fatal database error handeler. It creates the output to be displayed with the error information. 
     * @param String  $the_error String containing description of the error.
     */
    function fatal_error($the_error) {
        global $INFO;


        // Are we simply returning the error?

        if ($this->return_die == 1) {
            $this->error = mysql_error();
            return TRUE;
        }

        $the_error .= "\n\nmySQL error: " . mysql_error() . "\n";
        $the_error .= "mySQL error code: " . mysql_errno() . "\n";
        $the_error .= "Date: " . date("l dS of F Y h:i:s A");

        $out = "<html><head><title>Database Error</title>
    		   <style>P,BODY{ font-family:arial,sans-serif; font-size:11px; }</style></head><body>
    		   &nbsp;<br><br><blockquote><b>There appears to be an error with the {$INFO['board_name']} database.</b><br>
    		   You can try to refresh the page by clicking <a href=\"javascript:window.location=window.location;\">here</a>, if this
    		   does not fix the error, you can contact the board administrator by clicking <a href='mailto:{$INFO['email_in']}?subject=SQL+Error'>here</a>
    		   <br><br><b>Error Returned</b><br>
    		   <form name='mysql'><textarea rows=\"15\" cols=\"60\">" . htmlspecialchars($the_error) . "</textarea></form><br>We apologise for any inconvenience</blockquote></body></html>";


        echo($out);
        die("");
    }

    /**
     *  Create an array from a multidimensional array returning formatted
     *  strings ready to be used in an INSERT query, cutting the need to manually format
     *  the "(INSERT INTO table) ('field', 'field', 'field') VALUES ('val', 'val')" query.
     * @param Array $data Array containing the data to be inserted in the database as key->value pairs.
     * @return Array An array ready to be inserted into the database.
     */
    function compile_db_insert_string($data) {

        $field_names = "";
        $field_values = "";

        foreach ($data as $k => $v) {
            $v = preg_replace("/'/", "\\'", $v);
            //$v = preg_replace( "/#/", "\\#", $v );
            $field_names .= "$k,";
            $field_values .= "'$v',";
        }

        $field_names = preg_replace("/,$/", "", $field_names);
        $field_values = preg_replace("/,$/", "", $field_values);

        return array('FIELD_NAMES' => $field_names,
            'FIELD_VALUES' => $field_values,
        );
    }

    /**
     *  Create an array from a multidimensional array returning formatted
     *  strings ready to be used in an INSERT query, cutting the need to manually format
     *  the "FIELD='val', FIELD='val', FIELD='val'" query.
     * @param Array $data Array containing the data to be inserted in the database as key->value pairs.
     * @return Array An array ready to be inserted into the database.
     */
    function compile_db_update_string($data) {

        $return_string = "";

        foreach ($data as $k => $v) {
            $v = preg_replace("/'/", "\\'", $v);
            $return_string .= $k . "='" . $v . "',";
        }

        $return_string = preg_replace("/,$/", "", $return_string);

        return $return_string;
    }

    /**
     * Inserts a row into the database with the user city as an additional field if it's set in the session.
     * @param String $table the table name to insert the data into.
     * @param Array $data The data to be inserted.
     * @return int The excuted query id.
     */
    function insert_row_city($table, $data) {
        $data = $this->filter_values($table, $data);
        foreach ($data as $k => $v) {
            $sql_felds.="`" . $k . "`,";
            $sql_valus.="'" . $v . "',";
        }
        $sql_felds = substr($sql_felds, 0, (strlen($sql_felds) - 1));
        $sql_valus = substr($sql_valus, 0, (strlen($sql_valus) - 1));
        if (isset($_SESSION['login_city'])) {
            $sql = "INSERT INTO $table ($sql_felds,`city`)VALUES($sql_valus,'" . $_SESSION['login_city'] . "')";
        } else {
            $sql = "INSERT INTO $table ($sql_felds)VALUES($sql_valus)";
        }

        //echo $sql;
        $result = $this->unb_query($sql);
        return $result;
    }

    /**
     * Inserts a row into the database.
     * @param String $table the table name to insert the data into.
     * @param Array $data The data to be inserted.
     * @return int The excuted query id.
     */
    function insert_row($table, $data) {



        /* @var $lib  \libs\libs */
        global $lib;

        $data['created'] = $lib->util->dateTime->craeteDBDateTime();



        $data = $this->filter_values($table, $data);
        foreach ($data as $k => $v) {
            $sql_felds.="`" . $k . "`,";
            $sql_valus.="'" . $v . "',";
        }
        $sql_felds = substr($sql_felds, 0, (strlen($sql_felds) - 1));
        $sql_valus = substr($sql_valus, 0, (strlen($sql_valus) - 1));
        $sql = "INSERT INTO $table ($sql_felds)VALUES($sql_valus)";
        $result = $this->unb_query($sql);
        return $result;
    }

    /**
     * Inserts multiple rows into the database.
     * @param String $table the table name to insert the data into.
     * @param Array $data The data to be inserted.
     * @return int The excuted query id.
     */
    function insert_data($table, $data) {
        /* @var $lib  \libs\libs */
        global $lib;
        foreach ($data as $row) {

            $data['created'] = $lib->util->dateTime->craeteDBDateTime();


            $sql_felds = "";
            $sql_valus = "";
            foreach ($row as $k => $v) {
                $sql_felds.="`" . $k . "`,";
                $sql_valus.="'" . $v . "',";
            }
            $sql_felds = substr($sql_felds, 0, (strlen($sql_felds) - 1));
            $sql_valus = substr($sql_valus, 0, (strlen($sql_valus) - 1));
            $sql = "INSERT INTO $table ($sql_felds)VALUES($sql_valus)";
            $result.=$this->unb_query($sql);
        }

        return $result;
    }

    /**
     * Deletes a row from the database using the passed selection criteria.
     * @param String $table The table to delete a row from.
     * @param string $id the column name to search with it.
     * @param String  $where The where clause.
     * @param String  $pri_key Name of the primary key. Default 'id'.
     * @return int The excuted query id.
     */
    function delete_row($table, $id = 0, $where = "", $pri_key = 'id') {

        if ($id || $where) {
            if ($id) {
                $id = ' ' . $pri_key . '=' . $id;
            }
            $sql = "DELETE FROM $table WHERE$id $where  LIMIT 1";
        }
        $result = $this->unb_query($sql);
        return $result;
    }

    /**
     * Deletes a collection of rows based on the passed where clause.
     * @param String $table The table to delete a row from.
     * @param type String  $where The where clause.
     * @return int The excuted query id.
     */
    function delete_data($table, $where = 0) {
        if ($where) {
            $sql = "DELETE FROM $table WHERE $where";
        }


        $result = $this->unb_query($sql);
        return $result;
    }

    /**
     * Returns an SQL result set after replacing the double quote character.
     * @param String $sql An SQL query to get the cleaned up data for.
     * @return Array An array of the result set after cleaning it.
     */
    function get_data_query($sql) {
        $result = $this->query($sql);
        $i = 0;
        while ($row = $this->fetch_row()) {
            $rows[$i] = $this->clean_d($row);
            $i++;
        }
        return $rows;
    }

    /**
     * Cleans up a row data by removing the double quote character.
     * @param Array $row The row data to clean up.
     * @return Array The row data after clean up.
     */
    function clean_d($row) {
        foreach ($row as $k => $v) {
            $row[$k] = str_replace('\"', '', $v);
        }
        return $row;
    }

    /**
     * Returns a result set from t6he database using the passed search objects.
     * @param String $table The table to delete a row from.
     * @param type $data
     * @param String $where The search clause.
     * @param type $debug Decides the use of debug messages or not.
     * @param type $no_pre
     * @return type
     */
    function get_data($table, $data = "", $where = "", $debug = "", $no_pre = 1) {

        if ($no_pre) {
            $pre = '';
        } else {
            $pre = '`';
        }
        if (is_array($data)) {
            foreach ($data as $k => $v) {
                $sql_felds.=$pre . $v . $pre . ',';
            }
            $sql_felds = substr($sql_felds, 0, (strlen($sql_felds) - 1));
        } else {
            if ($data) {
                $sql_felds = $pre . $data . $pre;
            } else {
                $sql_felds = '*';
            }
        }

        if (!$sql_felds || trim($sql_felds) == "") {
            $sql_felds = "*";
        }


        $moreWhere .= " where  1=1 ";

        if (!$this->getEnable) {
            $moreWhere .= " and  enabled='1'";
        } else if ($this->getDisable) {
            $moreWhere .= " and  enabled='0'";
        }
        if (!$this->getDleleted) {
            $moreWhere .= " and   `delete`=0 ";
        }
        if (isset($where) && $where != "") {
            $moreWhere .= " and  " . $where;
        }
        if ($this->opt->order_a) {
            $options.=' ORDER BY ' . $pre . $this->opt->order_a . $pre . '  ASC';
            // $this->opt->order_a = "order";
        }
        if ($this->opt->order_d) {
            $options.=' ORDER BY ' . $pre . $this->opt->order_d . $pre . ' DESC';
            $this->opt->order_d = "order";
        }

        if ($this->opt->num_rows) {
            if ($this->opt->start_from) {
                $options.=" LIMIT " . $this->opt->start_from . "," . $this->opt->num_rows;
            } else {
                $options.=" LIMIT 0," . $this->opt->num_rows;
            }
        }



        $sql = "SELECT $sql_felds FROM $table $moreWhere $options";

        $this->returnSQL = $sql;

//echo $sql;

        if ($debug) {
            debug($sql, $debug);
        }
        $result = $this->query($sql);




        $i = 0;
        while ($row = $this->fetch_row()) {
            if ($this->opt->rkey) {
                $rows[$row[$this->opt->rkey]] = $this->clean_d($row);
            } else {
                $rows[] = $this->clean_d($row);
            }

            $i++;
        }
        $this->opt->rkey = '';
        $this->opt->num_rows = 0;
        if (is_array($rows)) {
            return $rows;
        } else {
            return array();
        }
    }

    /**
     * Creates a result set using the provided options in the <b>'opt'</b> class and the passed information.
     * @param String $table the table to get the data from.
     * @param type $data 
     * @param string $where The where clause used to search for the results.
     * @param type $pri_key Primary key of the table, default <b>'id'</b>.
     * @return Array An array containing the result of the query.
     */
    function get_data_list($table, $data, $where = "", $pri_key = 'id') {
        $sql_felds = '' . $pri_key . ',' . $data . '';
        if ($where) {
            $where = "WHERE " . $where;
        }
        if ($this->opt->order_a) {
            $options.=' ORDER BY ' . $pre . $this->opt->order_a . $pre . ' ASC';
            $this->opt->order_a = "";
        }
        if ($this->opt->order_d) {
            $options.=' ORDER BY ' . $pre . $this->opt->order_d . $pre . ' DESC';
            $this->opt->order_d = "";
        }
        if ($this->opt->num_rows) {
            if ($this->opt->start_from) {
                $options.=" LIMIT " . $this->opt->start_from . "," . $this->opt->num_rows;
            } else {
                $options.=" LIMIT 0," . $this->opt->num_rows;
            }
        }

        $sql = "SELECT $sql_felds FROM $table $where $options";
        if ($debug) {
            debug($sql, $debug);
        }
        $result = $this->query($sql);
        $i = 0;
        while ($row = $this->fetch_row()) {
            $rows[$row[$pri_key]] = $this->clean_d($row[$data]);
            $i++;
        }
        return $rows;
    }

    /**
     * Fetch a row based on an excuted query based on the passed data and also performs replacing the double quote character.
     * @param String $table The table to get the row from
     * @param Array $data Array containing the field to select.
     * @param String $where the where clause.
     * @param int $debug Decides the use of debug messages or not.
     * @return Array An array containing the row.
     */
    function get_row($table, $data = "", $where = "", $debug = 0) {
        if (is_array($data)) {
            foreach ($data as $k => $v) {
                $sql_felds.="" . $v . ",";
            }
            $sql_felds = substr($sql_felds, 0, (strlen($sql_felds) - 1));
        } else {
            $sql_felds = $data;
        }

        if (!$sql_felds) {
            $sql_felds = "*";
        }
        if ($where) {
            $where = "WHERE " . $where;
        }
        $sql = "SELECT $sql_felds FROM $table $where";

        $this->returnSQL = $sql;
        if ($debug) {
            debug($sql);
        }

        $result = $this->query($sql);
        $rows = $this->fetch_row();
        return $this->clean_d($rows);
    }

    /**
     * 
     * @param type $table
     * @param type $data
     * @param type $where
     * @return String[]
     */
    function get_maxrow($table, $data = "", $where = "") {
        $mid = $this->get_row($table, "max(id) as id ", $where);



        echo $mid;
        $r = "0";
        if ($mid['id'] != "") {

            $r = $this->get_row($table, $data, "id=" . $mid['id']);
        }
        return $r;
    }

    /**
     * 
     * @param type $table
     * @param type $data
     * @param type $id
     * @param type $where
     * @return int
     */
    function update_row($table, $data, $id = "", $where = "") {
         /* @var $lib  \libs\libs */
        global $lib;

                    $data['modified'] = $lib->util->dateTime->craeteDBDateTime();

        
        $data = $this->filter_values($table, $data);
        if (!$id && !$where) {
            return 0;
        }
        foreach ($data as $k => $v) {
            $sql_data.="`$k`='$v',";
        }
        $sql_data = substr($sql_data, 0, (strlen($sql_data) - 1));
        if ($id) {
            $where = " WHERE id=$id";
        } else {
            $where = " WHERE " . $where;
        }
        $sql = "UPDATE `$table` SET $sql_data $where";

        $this->returnSQL = $sql;

        $result = $this->unb_query($sql);
        return $result;
    }

    /**
     * 
     * @param type $table
     * @param type $data
     * @param type $where
     * @return type
     */
    
    function update_data($table, $data, $where) {
        
       
             $data = $this->filter_values($table, $data);
        foreach ($data as $k => $v) {
            $sql_data.="`$k`='$v',";
        }
        $sql_data = substr($sql_data, 0, (strlen($sql_data) - 1));
        $sql = "UPDATE `$table` SET $sql_data WHERE $where";
        $result = $this->unb_query($sql);
        return $result;
    }

    /**
     * 
     * @param type $table
     * @param type $id
     * @param type $override_data
     * @return type
     */
    function duplicate_row($table, $id, $override_data) {
        $row1 = $this->get_row($table, "", "id=$id");
        $row1['id'] = "";
        foreach ($override_data as $k => $v) {
            $row1[$k] = $v;
        }
        $this->insert_row($table, $row1);
        return "Row (id:$id) Duplicated...";
    }

    /**
     * Get MySQL server info
     * @return string the MySQL server version on success or <b>FALSE</b> on failure.
     */
    function server_ver() {
        return mysql_get_server_info();
    }

    /**
     * Get a list of the tables in the database.
     * @return type List of the tables in the currently opened database.
     */
    function get_tables() {
        $result = mysql_query('SHOW TABLES');
        while ($row = mysql_fetch_row($result)) {
            $tables[] = $row[0];
        }

        return $tables;
    }

    /**
     * Gets the column names for the passed table.
     * @param type $table_name Table name to get its columns.
     * @return type Column names from the passed table.
     */
    function get_table_fields($table_name) {

        return $this->get_data_query('SHOW COLUMNS FROM ' . $table_name);
    }

    /**
     * 
     * @param type $table_name
     * @param type $values
     * @return type
     */
    function filter_values($table_name, $values) {
        $fildes = $this->get_table_fields($table_name);



        //  print_r($values);
        foreach ($values as $k => $v) {
            $a = 0;
            foreach ($fildes as $f) {
                if (($f['Field'] == $k)) {
                    $a = 1;
                }
            }
            if ($a == 0) {


                unset($values[$k]);
            }
            //  echo$a;
        }


        /*
          foreach ($fildes as $f) {

          if ($f['Field'] != 'id') {
          //  if ($values[$f['Field']] != '') {
          //  if ($f['Field'] == 'password' && $values[$f['Field']] != '') {
          $new_values[$f['Field']] = $values[$f['Field']];
          // }
          // }
          } */
        // }

        return $values;
    }

    /**
     * Returns the next available auto incremented id for table.
     * @param type $table_name Table name to get its next id.
     * @return int the next id.
     */
    function get_next_id($table_name) {
        $data = $this->get_data_query("SHOW TABLE STATUS LIKE '$table_name'");


        return $data[0]['Auto_increment'];
    }

    /**
     * 
     * @global type $my_db
     * @param type $val
     * @return boolean
     */
    function chk_array_row($val) {
        global $my_db;
        $aduser = $my_db->get_row('users', '', "id=" . $_SESSION['login']);
        $user_ar = explode(';', $aduser['other']);
        foreach ($user_ar as $user) {
            if ($user == $val) {
                $ret = true;
            }
        }
        return $ret;
    }

    /**
     * Returns 
     * @param type $val
     * @return type
     */
    function get_array_row($val) {
        global $db;
        $aduser = $db->get_row('users', '', "id=" . $_SESSION['login']);
        return explode(';', $aduser['lev']);
    }

    //-----------------------------
}

// end class
?>

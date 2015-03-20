<?php
include('mysql.php');
//$aResults[]
	switch ($_GET['content']){
		case 'users':
		//$_GET['input']=str_replace('�','_',$_GET['input']);
		//$_GET['input']=str_replace('�','_',$_GET['input']);
			$data=$db->get_data('users','',"title LIKE '%$_GET[input]%'");
			foreach ($data as $row){
				$aResults[]=array('id'=>$row['id'],'value'=>$row['title'],'info'=>$row['job']);
			}
		break;
		case 'family':
		//$_GET['input']=str_replace('�','_',$_GET['input']);
		//$_GET['input']=str_replace('�','_',$_GET['input']);
			$data=$db->get_data('members','DISTINCT family',"family LIKE '%$_GET[input]%'");
			foreach ($data as $row){
				$aResults[]=array('id'=>$row['id'],'value'=>$row['family'],'info'=>$row['job']);
			}
		break;
		
	}
	
	
	header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
	header ("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
	header ("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
	header ("Pragma: no-cache"); // HTTP/1.0
	
	//sleep(2);
	
	if (isset($_REQUEST['json']))
	{
		header("Content-Type: application/json");
	
		echo "{\"results\": [";
		$arr = array();
		for ($i=0;$i<count($aResults);$i++)
		{
			$arr[] = "{\"id\": \"".$aResults[$i]['id']."\", \"value\": \"".$aResults[$i]['value']."\", \"info\":\"".$aResults[$i]['info']."\"}";
		}
		echo implode(", ", $arr);
		echo "]}";
	}
	else
	{
		header("Content-Type: text/xml");

		echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?><results>";
		for ($i=0;$i<count($aResults);$i++)
		{
			echo "<rs id=\"".$aResults[$i]['id']."\" info=\"".$aResults[$i]['info']."\">".$aResults[$i]['value']."</rs>";
		}
		echo "</results>";
	}
?>
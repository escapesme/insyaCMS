<?
$page=$db->get_row('pages','','id='.$_GET['id']);
?>
<script language="javascript">
	$('xtitle').innerHTML='<?=$page['title']?>';
	
</script>
<?=$page['dcontent']?>
  
 <script language='javascript' type='text/javascript'>function closeCP(obj) {
obj.style.display='block';

} </script> 

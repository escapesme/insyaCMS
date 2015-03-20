<?php

/**
 * @author yas500(mohamedigm@nileweb.com)
 * @copyright 2009
 */


class ckedit
{
	var $field;
	var $data="";
	
	function ckedit($field,$data)
	{
		$this->field=$field;
		$this->data=$data;
	}
	
	function create()
	{
		$html='
	<textarea id="'.$this->field.'" name="'.$this->field.'" rows="10" cols="40">'.$this->data.'</textarea>
	<script type="text/javascript">
	';
	$html.="if ( typeof CKEDITOR == 'undefined' )
{
	document.write(
		'ERROR!!' ) ;
}else
{
	var editor = CKEDITOR.replace( '".$this->field."' );";
	$html.="CKFinder.SetupCKEditor(editor,'ckfinder/') ;
	}
		</script>
";
		
		return $html;
		
	}
	
	
}


?>
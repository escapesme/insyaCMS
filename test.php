<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
	$targ_w = $targ_h = 150;
	$jpeg_quality = 90;

	$src = 'includes/crop/demos/demo_files/pool.jpg';
	$img_r = imagecreatefromjpeg($src);
	$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );

	imagecopyresampled($dst_r,$img_r,0,0,$_POST['x'],$_POST['y'],
	$targ_w,$targ_h,$_POST['w'],$_POST['h']);

	header('Content-type: image/jpeg');
	imagejpeg($dst_r,null,$jpeg_quality);

	exit;
}


?>

  <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
  <script src="includes/cropp/js/jquery.min.js" type="text/javascript"></script>
  
  <script src="includes/cropp/js/jquery.Jcrop.js" type="text/javascript"></script>
 
  <link href="includes/cropp/css/jquery.Jcrop.css" rel="stylesheet" type="text/css"/>
  
<script type="text/javascript">

  $(function(){

    $('#cropbox').Jcrop({
     
      onSelect: updateCoords
    });

  });

  function updateCoords(c)
  {
    $('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);
  };

  function checkCoords()
  {
    if (parseInt($('#w').val())) return true;
    alert('Please select a crop region then press submit.');
    return false;
  };

</script>



                <img src="includes/cropp/demos/demo_files/pool.jpg" id="cropbox"  alt=""/>
                
		<form action="" method="post" onsubmit="return checkCoords();">
			<input type="hidden" id="x" name="x" />
			<input type="hidden" id="y" name="y" />
			<input type="hidden" id="w" name="w" />
			<input type="hidden" id="h" name="h" />
			<input type="submit" value="Crop Image" class="btn btn-large btn-inverse" />
		</form>

	
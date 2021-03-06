<?php
$imgdata = explode("/", $_GET['img']);
if ($imgdata[0] == "..") {
    $_GET['img'] = "../" . $_GET['img'];
}

$_GET['img'] = str_replace(" ", "%20", $_GET['img']);
?>
<link href="/includes/crop/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/includes/crop/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/includes/crop/css/cropper.min.css" rel="stylesheet" type="text/css"/>
<link href="/includes/crop/css/main.css" rel="stylesheet" type="text/css"/>

<form class="avatar-form" action="crop.php" enctype="multipart/form-data" method="post">
    <input class="avatar-src" name="avatar_src" value='<?= $_GET['img'] ?>' type="hidden">
    <input class="avatar-data" name="avatar_data" type="hidden">
    <!-- Content -->
    <div class="container">




        <div class="row">
            <div class="col-md-9 docs-buttons">
                <!-- <h3 class="page-header">Toolbar:</h3> -->
                <div class="btn-group">
                    <button class="btn btn-primary" data-method="setDragMode" data-option="move" type="button" title="Move">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
                            <span class="icon icon-move"></span>
                        </span>
                    </button>
                    <button class="btn btn-primary" data-method="setDragMode" data-option="crop" type="button" title="Crop">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setDragMode&quot;, &quot;crop&quot;)">
                            <span class="icon icon-crop"></span>
                        </span>
                    </button>
                    <button class="btn btn-primary" data-method="zoom" data-option="0.1" type="button" title="Zoom In">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;zoom&quot;, 0.1)">
                            <span class="icon icon-zoom-in"></span>
                        </span>
                    </button>
                    <button class="btn btn-primary" data-method="zoom" data-option="-0.1" type="button" title="Zoom Out">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;zoom&quot;, -0.1)">
                            <span class="icon icon-zoom-out"></span>
                        </span>
                    </button>
                    <button class="btn btn-primary" data-method="rotate" data-option="-45" type="button" title="Rotate Left">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;rotate&quot;, -45)">
                            <span class="icon icon-rotate-left"></span>
                        </span>
                    </button>
                    <button class="btn btn-primary" data-method="rotate" data-option="45" type="button" title="Rotate Right">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;rotate&quot;, 45)">
                            <span class="icon icon-rotate-right"></span>
                        </span>
                    </button>




                    <button class="btn btn-primary avatar-save docrop" type="button">Done</button> 


                    <label class="btn btn-primary active" data-method="setAspectRatio" data-option="1.7777777777777777" title="Set Aspect Ratio">
                        <input class="sr-only" id="aspestRatio1" name="aspestRatio" value="1.7777777777777777" type="radio">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setAspectRatio&quot;, 16 / 9)">
                            16:9
                        </span>
                    </label>
                    <label class="btn btn-primary" data-method="setAspectRatio" data-option="1.3333333333333333" title="Set Aspect Ratio">
                        <input class="sr-only" id="aspestRatio2" name="aspestRatio" value="1.3333333333333333" type="radio">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setAspectRatio&quot;, 4 / 3)">
                            4:3
                        </span>
                    </label>
                    <label class="btn btn-primary" data-method="setAspectRatio" data-option="1" title="Set Aspect Ratio">
                        <input class="sr-only" id="aspestRatio3" name="aspestRatio" value="1" type="radio">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setAspectRatio&quot;, 1 / 1)">
                            1:1
                        </span>
                    </label>
                    <label class="btn btn-primary" data-method="setAspectRatio" data-option="0.6666666666666666" title="Set Aspect Ratio">
                        <input class="sr-only" id="aspestRatio4" name="aspestRatio" value="0.6666666666666666" type="radio">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setAspectRatio&quot;, 2 / 3)">
                            2:3
                        </span>
                    </label>
                    <label class="btn btn-primary" data-method="setAspectRatio" data-option="NaN" title="Set Aspect Ratio">
                        <input class="sr-only" id="aspestRatio5" name="aspestRatio" value="NaN" type="radio">
                        <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setAspectRatio&quot;, NaN)">
                            Free
                        </span>
                    </label>
                </div>


                <div class="col-md-3">

                </div>

            </div><!-- /.docs-buttons -->



        </div><!-- /.docs-toggles -->
        <div class="row">

            <div class="col-md-3">
                <!-- <h3 class="page-header">Preview:</h3> -->
                <div class="docs-preview clearfix">
                    <div class="img-preview preview-lg"></div>
                    <div class="img-preview preview-md"></div>
                    <div class="img-preview preview-sm"></div>
                    <div class="img-preview preview-xs"></div>
                </div>

                <!-- <h3 class="page-header">Data:</h3> -->
                <div class="docs-data">
                    <div class="input-group">
                        <label class="input-group-addon" for="dataX">X</label>
                        <input class="form-control" id="dataX" type="text" placeholder="x">
                        <span class="input-group-addon">px</span>
                    </div>
                    <div class="input-group">
                        <label class="input-group-addon" for="dataY">Y</label>
                        <input class="form-control" id="dataY" type="text" placeholder="y">
                        <span class="input-group-addon">px</span>
                    </div>
                    <div class="input-group">
                        <label class="input-group-addon" for="dataWidth">Width</label>
                        <input class="form-control" id="dataWidth" type="text" placeholder="width">
                        <span class="input-group-addon">px</span>
                    </div>
                    <div class="input-group">
                        <label class="input-group-addon" for="dataHeight">Height</label>
                        <input class="form-control" id="dataHeight" type="text" placeholder="height">
                        <span class="input-group-addon">px</span>
                    </div>
                    <div class="input-group">
                        <label class="input-group-addon" for="dataRotate">Rotate</label>
                        <input class="form-control" id="dataRotate" type="text" placeholder="rotate">
                        <span class="input-group-addon">deg</span>
                    </div>
                </div>
            </div>


            <div class="col-md-9">
                <!-- <h3 class="page-header">Demo:</h3> -->
                <div class="img-container">
                    <img src="<?= $_GET['img'] ?>" alt="Picture">
                </div>
            </div>

        </div>
    </div>


</form>


<div class='preview'>

    <div class='bar'>
        <div class="btn-group">
            <button class='btn-primary btn cropDone'>Done</button><button class='btn-primary btn cropCancel'>cancel</button>
        </div>
    </div>
    <div class='data toceneter'>


        <img class='imgcrop' src='' /> 
    </div></div>

<script src="/includes/crop/js/jquery.min.js" type="text/javascript"></script>
<script src="/includes/crop/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/includes/crop/js/cropper.min.js" type="text/javascript"></script>
<script src="/includes/crop/js/main.js" type="text/javascript"></script>


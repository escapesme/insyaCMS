<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function saveData() {
    global $lib;

    if (isset($_POST['title']) && $_POST['title'] != "") {
        $addData = array("title" => $_POST['title']);
        $lib->db->insert_row('com_wizard', $addData);

        $m = $lib->db->get_row('com_wizard', "max(id) as mid");
        $d = $lib->db->delete_data('com_wizard_xref', "w_id='" . $m['mid'] . "'");






        for ($i = 0; $i < count($_POST['stepesTitle']); $i++) {


            $addData = array(
                "w_id" => $m['mid'],
                "order" => $_POST['stepesOrder'][$i],
                "title" => $_POST['stepesTitle'][$i],
                "sid" => $_POST['stepid'][$i],
                "properties" => $_POST['stepesData'][$i],
                "s_id" => $i
            );
            $d = $lib->db->insert_row('com_wizard_xref', $addData);
        }
    }
}

function updatData() {
    global $lib;


    if (isset($_POST['title']) && $_POST['title'] != "") {
        $addData = array("title" => $_POST['title']);
        $lib->db->update_row('com_wizard', $addData, $_GET['id']);


        $d = $lib->db->delete_data('com_wizard_xref', "w_id='" . $_GET['id'] . "'");

        for ($i = 0; $i < count($_POST['stepesTitle']); $i++) {



            $addData = array(
                "w_id" => $_GET['id'],
                "order" => $_POST['stepesOrder'][$i],
                "title" => $_POST['stepesTitle'][$i],
                "sid" => $_POST['stepid'][$i],
                "properties" => $_POST['stepesData'][$i],
                "s_id" => $i
            );
            $d = $lib->db->insert_row('com_wizard_xref', $addData);
        }
    }
}

function addData($title = "", $dw = "") {

    $titles = "";

    foreach ($dw as $d) {

        $titles.= $d['title'] . "%";
        $pro.= $d['properties'] . "%";
        $sid.= $d['sid'] . "%";
        $order.= $d['order'] . "%";
    }




    $returndata = "<div class='block-border'> <div class='block-content'>";

    $returndata .= '     
    <div class="block-header">
    <h1>html<div class="subtitle">edit<div></div></div></h1><span></span></div>\n
    <div class="block-actions top"><div class="form_row actions-right submit_p  _parent"><input style="" action="" name="mysubmit" id="mysubmit" class="form_row txt rowfeild mysubmit submit button actions-right" value="update" type="submit">
    </div>
    <div class="form_row actions-right reset_p  _parent">
    <input style="" action="" name="myreset" id="myreset" class="form_row txt rowfeild myreset reset button red actions-right    " value="reset" type="reset"></div></div>
';

    $returndata .='<form action="" class="wData_form"  method="post"><div id="text_count" title="" class="form_row text  _parent">
           <div class="field-label">
           <label for="morecss">Title</label></div><div class="field-input"><input type="text" style=""  value="' . $title . '" name="title" id="morecss" class="form_row txt rowfeild morecss text title"/></div></div><div class="sdata" style=\'display:none;\' ></div> </form>';

    $returndata .= "

<div class='allsteps'>
<div class=' add addstep'>
        <input type='button'  class='button  addStepBt' value='add Step'/>
        </div>";
    $returndata .= "<div class='stepes'> </div></div>
        <script>
                UpdateBluder('" . $titles . "','" . $pro . "','" . $sid . "','" . $order . "','admin/wizard_data');
                
                getBluder('','admin/wizard_data');
        </script>";


    $returndata .= "</div> </div>";





    return $returndata;
}
?>

<script>

    $(function() {



        $(" .mysubmit").click(function() {
  
            Bluder_update();
            $(".wData_form").submit();
        });
    })
    /*
     function getsaveData(val) {
     var ops = new Array("html", "images", "videos", "form", "formData");
     
     
     var typeData = "<select    class='Typestep' ><option></option>";
     for (var o = 0; o < ops.length; o++) {
     var doselect = "";
     if (ops[o] == val) {
     doselect = "selected='selected'";
     } else {
     doselect = "";
     }
     typeData += "<option " + doselect + " >" + ops[o] + "</option>";
     
     }
     typeData += "</select>";
     return typeData;
     }
     
     
     
     function  getTypehtmlData(order, id, optionsData, type) {
     
     var typeData = getsaveData(type);
     
     
     
     
     var setpdiv = "<div class='chstep'>\n\
     <div class='stepHeader'>\n\
     <div class='stepOrder'>" + order + "</div>\n\
     <div class='stepNumercont'><label>ID</label><span class='stepNumer' >" + id + "</span></div> \n\
     <div class='coll ui-icon  ui-icon-carat-1-s'></div>\n\
     <div class='titlediv'><label>Type</label>" + typeData + " </div><div class='stepNumer'>Type</div>\n\
     </div>\n\
     <div class='chstepOpions'><input type='hidden' class='mydata' value='" + optionsData + "'/><</div>\n\
     </div>";
     
     
     
     
     return setpdiv;
     
     }
     
     
     function  getStephtmlData(order, id, title, TypesData) {
     
     return  "<div class='step'>\n\
     <div class='stepHeader'> \n\
     <div class='coll ui-icon  ui-icon-carat-1-s'></div>\n\
     <div class='stepOrder'>" + order + "</div>\n\
     <div class='stepNumercont'><label>ID</label><span class='stepNumer' >" + id + "</span></div> \n\
     <div class='titlediv'><label>Title</label>\n\
     <input type='text' class=' txtTitlestep' value='" + title + "'/></div>\n\
     <input type='button' class='button addChStepBt' value='add Type'/> \n\
     <input type='button' class='button closeChStepBt' value='close'/></div>\n\
     <div class='chstepes'>" + TypesData + "</div></div>";
     
     }
     
     
     
     function editdata(dw, pro, ids, order) {
     
     
     $(function() {
     
     
     var titles = dw.split("%");
     var pros = pro.split("%");
     var orders = order.split("%");
     var mid = ids.split("%");
     
     
     
     var nums = 0;
     for (var i = 0; i < titles.length; i++) {
     if (titles[i] != null && titles[i] != "") {
     var mypros = pros[i].split("||");
     
     var setpdivd = "";
     
     
     for (var s = 0; s < mypros.length; s++) {
     var chmypros = mypros[s].split("__");
     
     if (chmypros[0] != null && chmypros[0] != "") {
     
     
     setpdivd += getTypehtmlData(s + 1, chmypros[0], chmypros, chmypros[1]);
     
     nums++;
     }
     }
     
     $(".stepes").append(getStephtmlData(orders[i], mid[i], titles[i], setpdivd));
     }
     
     
     }
     
     
     
     
     
     
     $("body").on("cu", ".stepes", function() {
     
     
     $(".chstepOpions").each(function() {
     
     var mychmypros = $(this).children(".mydata").val().split(",");
     
     var obj = $(this);
     
     getAjax("admin/wizard_data", "type=" + mychmypros[1] + "&id=" + mychmypros[2] + "&morecss=" + mychmypros[3], function(d) {
     $(obj).html(d);
     });
     })
     
     
     $(".stepes,.chstepes").sortable({
     stop: function(event, ui) {
     
     updateindes();
     }
     });
     
     });
     $('.stepes').trigger("cu");
     
     })
     }
     
     
     function updateindes() {
     myin2 = 0;
     myin = 0;
     $(".sdata").html("");
     var order = 0;
     $(".step").each(function() {
     order++;
     
     var chs = $(this).children(".chstepes").children(".chstep");
     var sdata = "";
     chs.each(function() {
     
     var myin2 = $(this).index() + 1;
     
     $(this).children(".stepHeader").children(".stepOrder").text(myin2);
     
     var thissid = $(this).children(".stepHeader").children(".stepNumercont").children(".stepNumer").text();
     
     sdata += thissid + "__"
     + $(this).children(".stepHeader").children(".titlediv").children(".Typestep").val() + "__"
     + $(this).children(".chstepOpions").children(".form_row").children(".field-input").children(".optionData").val()
     + "__"
     + $(this).children(".chstepOpions").children(".form_row").children(".field-input").children(".morecss").val()
     + "||";
     })
     
     
     var Title = $(this).children(".stepHeader").children("div").children(".txtTitlestep").val();
     myin = $(this).index() + 1;
     $(this).children(".stepHeader").children(".stepOrder").text(myin);
     
     var thissid = $(this).children(".stepHeader").children(".stepNumercont").children(".stepNumer").text();
     
     var muinput = "<div class='sdatafiled'>\n\
     <input class='stepesorder' value='" + order + "' name='stepesOrder[]' />\n\
     <input class='stepid' value='" + thissid + "' name='stepid[]' />\n\
     <input class='stepesTitle' value='" + Title + "' name='stepesTitle[]' />\n\
     <textarea name='stepesData[]'  class='stepInputData'>" + sdata + "</textarea>\n\
     </div>";
     $(".sdata").append(muinput);
     });
     }
     
     $(function() {
     $(".mysubmit").click(function() {
     updateindes();
     $(".wData_form").submit();
     });
     var type = "type";
     var nums = 0;
     var title = "Title";
     
     var typeData = getsaveData("");
     
     
     
     function getmyajax(type, obj) {
     getAjax("admin/wizard_data", "type=" + type, function(d) {
     obj.html(d);
     });
     }
     
     
     
     
     
     
     
     
     $(".addStepBt").click(function() {
     
     nums++;
     $(".stepes").append(getStephtmlData(nums, "s" + nums, "Setp-s" + nums, ""));
     updateindes();
     $(".stepes,.chstepes").sortable({
     stop: function(event, ui) {
     
     updateindes();
     }
     });
     });
     var nums = 0;
     $(document).on('click', ".coll", function() {
     
     var h = $(this).parent(".stepHeader").parent().css("height");
     if (h == "28px") {
     $(this).removeClass("ui-icon-carat-1-e");
     $(this).addClass("ui-icon-carat-1-s");
     $(this).parent(".stepHeader").parent().css("height", "auto");
     } else {
     
     $(this).removeClass("ui-icon-carat-1-s");
     $(this).addClass("ui-icon-carat-1-e");
     $(this).parent(".stepHeader").parent().css("height", "28px");
     }
     
     
     
     });
     $(document).on('change', ".Typestep", function() {
     var type = $(this).val();
     var obj = $(this).parent(".titlediv").parent(".stepHeader").parent(".chstep").children(".chstepOpions");
     
     
     getmyajax(type, obj);
     })
     
     var Tnum = 0;
     $(document).on('click', ".addChStepBt", function() {
     
     
     var numb = $(this).parent().parent().children(".chstepes").children(".chstep").size();
     Tnum = numb + 1;
     var setpdiv = getTypehtmlData(Tnum, "T" + Tnum, "", "");
     $(this).parent(".stepHeader").parent(".step").children(".chstepes").append(setpdiv);
     $(".stepes,.chstepes").sortable({
     stop: function(event, ui) {
     
     updateindes();
     }
     });
     });
     $(document).on('click', ".closeChStepBt", function() {
     $(this).parent(".stepHeader").parent(".step").remove();
     updateindes();
     });
     $(document).on('change', ".txtTitlestep", function() {
     $(this).parent(".stepHeader").parent(".step").remove();
     updateindes();
     });
     })
     
     */
</script>



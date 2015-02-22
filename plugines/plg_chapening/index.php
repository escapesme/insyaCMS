<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function plg_chapening($lng) {
    global $lib;





    if ($lng['6'] != "fixedprice" && $lng['7'] != "0") {




        $retData = "
   
        



       
      <div class='shapeingCount'>
<div class='shipTitle label'>" . $lng['1'] . "</div>";
        if ($lng['6'] == "ziprange" || $lng['6'] == "ukpostcode") {
            $retData .= "  <input class='postCode'  type='text'/> ";
        } else if ($lng['6'] == "country") {


            $fildsss = array(
                "postCode" => array(
                    "type" => "select",
                    "select_type" => "countries",
                    "name" => "postCode"
                )
            );
            $lib->forms->filds = $fildsss;

            $retData .= $lib->forms->_render_form();
            $lib->forms->filds = "";
        }



        $retData .= "<input class='shipUpdate' type='button' value='Update " . $lng['2'] . "'/> 
             </div>
             
";
    }





    if ($lng['7'] == "0") {

        $retData .= "
<div class='pro_data'>

<input type=\"hidden\" name=\"shipping_id\" class=\"shipping_id\" value=\"0\" /> 

<input type=\"hidden\" name=\"li_" . $lng['5'] . "_type\" value=\"shipping\" /> 
<input type=\"hidden\" name=\"li_" . $lng['5'] . "_name\" value=\"Shipping\" /> 
<input type=\"hidden\" name=\"li_" . $lng['5'] . "_quantity\" value=\"1\" /> 
<input class='li_price_ch'  type=\"hidden\" name=\"li_" . $lng['5'] . "_price\" value=\"0\" /> 
<input type=\"hidden\" name=\"li_" . $lng['5'] . "_tangible\" value=\"Y\" /> 
   </div>
    
";
    } else {
        $retData .= "<script>$(function(){updatemyData('" . $lng['6'] . "');})</script>
<div class='pro_data'>

<input type=\"hidden\" name=\"shipping_id\" class=\"shipping_id\" value=\"0\" /> 

<input type=\"hidden\" name=\"li_" . $lng['5'] . "_type\" value=\"shipping\" /> 
<input type=\"hidden\" name=\"li_" . $lng['5'] . "_name\" value=\"Shipping\" /> 
<input type=\"hidden\" name=\"li_" . $lng['5'] . "_quantity\" value=\"1\" /> 
<input class='li_price_ch'  type=\"hidden\" name=\"li_" . $lng['5'] . "_price\" value=\"0\" /> 
<input type=\"hidden\" name=\"li_" . $lng['5'] . "_tangible\" value=\"Y\" /> 
   </div>
    <input class='wightCode' type='hidden' value='" . $lng['3'] . "'/>
    <input class='subpric' type='hidden' value='" . $lng['4'] . "'/>
    <input class='shipValuein' type='hidden' name='shipValuein' value='' />
";
    }
    // $retData .= "<div  class='shipValue'></div>";
    return $retData;
}
?>


<script>






    function updatemyData(mtype) {

        if (mtype != "fixedprice" && mtype != "country") {
            $(".ship_zip").attr("readonly", "readonly");
            $(".postCode").change(function() {
                $(".ship_zip").val($(this).val());
            })
        }






        if (mtype == "fixedprice") {
            myajax(mtype);
        } else {

            $(".shipUpdate").click(function() {

                myajax(mtype)

            })
        }

    }


    function myajax(mtype) {


        if (mtype == "fixedprice") {

            var link = "postCode=<?= $_GET['site'] ?>&wigth=" + $(".wightCode").val() + "&type=" + mtype;

        } else {


            var link = "postCode=" + $(".postCode").val() + "&wigth=" + $(".wightCode").val() + "&type=" + mtype;


        }



        getAjax("productes/get_shipping", link, function(data) {


            if ($.trim(data) != "") {

                var d = data.split("__");

                $(".shipping_id").val($.trim(d[1]));
                $(".li_price_ch").val($.trim(d[0]));
                var allpric = $(".subpric").val() + d[0];
                //   $(".shipValue").html(data);
                $(".devPric").text(d[0]);
                $(".shipValuein").text(allpric);
                var AllPric = parseFloat($(".SubTotalPric").text()) + parseFloat(d[0]);
                $(".totalPric").text(AllPric.toFixed(2));
            } else {


                $(".totalPric").text($(".SubTotalPric").text());
            }





        })


    }


</script>

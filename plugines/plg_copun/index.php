<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function plg_copun($lng) {
    global $lib;




    $retData = "
          <div class='cuponData'><div class='codetitle'>" . $lng['0'] . "</div> 
   <div class='codeintro '>" . str_replace("\n", "<br/>", $lng['1']) . "</div>
        <div class='havecode '>" . $lng['3'] . "</div>
            <div  style='display:none'class='havecodeinfo'>
        <input class='copunCode'  type='text'/> 
        <input class='copunUpdate' type='button' value='Apply'/>
        
<div  class='havecodeinfomsg'></div>
        </div>
        <div class='codeintro'>" . str_replace("\n", "<br/>", $lng['2']) . "</div>
            
   <input class='havecodeinfomsgData'  type='hidden' value='" . $lng['4'] . "' />

            <input class='copunValuein'  type='hidden' name='copunValuein' value='' />

";
    $retData .= "<div class='copunValue'></div>  </div>";
    return $retData;
}
?>
<script>
    $(function() {



        function getAllPric() {
            var data = 0;


            $(".prosumPric").each(function() {
                //  alert($(this).val());
                data += parseFloat($.trim($(this).val()));
            });


            //alert(data);


            return data;

        }


        $(".havecode").toggle(
                function() {
                    $(".havecode").hide("slow");
                    $(".havecodeinfo").show("slow")

                },
                function() {

                    $(".havecodeinfo").hide("slow")

                }

        );



        $(".copunUpdate").click(function() {


            $(".pro_data").each(function() {



                var obj = $(this);



                var li_product_id = obj.children(".li_product_id").val();


                var li_quantity = obj.children(".li_quantity").val();

                var li_price = obj.children(".li_price").val();
                var li_pricedef = obj.children(".li_pricedef").val();
                //  alert(li_product_id + ":" + li_quantity + ":" + li_price);
                if (li_product_id != null || li_product_id != undefined) {

                    getAjax("productes/get_copun", "status=one&product_id=" + li_product_id + "&pric=" + li_pricedef + "&copunCode=" + $(".copunCode").val(), function(data) {

                        var getData = data.split("__");


                        var allpricnew = li_quantity * getData[1];
                        var allpricold = li_quantity * li_pricedef;


                        if (getData[1] == li_pricedef) {

                            obj.children(".li_price").val($.trim(li_price));

                            //$(".copunValuein").val("xxxxxxxxxxxxxxx");

                            $(".proViewPric" + li_product_id).html(allpricold);

                            $(".prosumPric" + li_product_id).val($.trim(allpricold));




                            $(".havecodeinfomsg").text($(".havecodeinfomsgData").val());

                            $(".havecodeinfomsg").addClass("error");

                        } else {
                            obj.children(".li_price").val(getData[1]);

                            $(".proViewPric" + li_product_id).html("<span style='text-decoration: line-through;'>" + allpricold + "</span> &nbsp;&nbsp; " + allpricnew);

                            $(".prosumPric" + li_product_id).val($.trim(allpricnew));



                            $(".havecodeinfomsg").text(getData[2]);
                            $(".havecodeinfomsg").addClass("succ");

                        }



                        var AllPric = parseFloat($(".devPric").text()) + parseFloat(getAllPric());

                        $(".totalPric").text(AllPric.toFixed(2));


                        $(".SubTotalPric").text(Math.round(getAllPric(), 2));



                    });


                }

            })


            /*   getAjax("productes/get_copun", "copunCode=" + $(".copunCode").val(), function(data) {
             
             $(".copunValue").html("£" + data);
             $(".copunValuein").val(data);
             
             
             
             
             });*/
        });
    });
</script>

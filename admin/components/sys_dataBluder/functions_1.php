<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function saveData() {
    global $lib;
}

function addData() {
    /* @var $lib  libs\libs */
    global $lib;



    $data = '<div class=\'allsteps\'>
     
        
        <div class=\' add addstep\'>
         <li title="updiate Qury" class="updiateQury ui-state-default ui-corner-all">
        <span class="ui-icon ui-icon-arrowrefresh-1-e"></span></li>
        

    <li title="Check Qury" class="checkQury ui-state-default ui-corner-all">
        <span class="ui-icon ui-icon-info"></span></li>
        <li title="Add Qury" class="addQury ui-state-default ui-corner-all">
        <span class="ui-icon ui-icon ui-icon-plusthick"></span></li></div><div class=\'quers\'></div></div>';
    return $data;
}

function updatData() {
    
}

//getAllTable();

function getAllTable() {
    /* @var $lib  libs\libs */
    global $lib;
    $d = $lib->db->get_table_names();

    //  print_r(getfildes("com_products_order"));
}

function getfildes($tabel) {
    /* @var $lib  libs\libs */
    global $lib;
    return $lib->db->get_table_fields($tabel);
}
?>
<script>



    function UpdateCdata(adata) {
        var cdata = "";
        if (adata == "all") {

            cdata = "*";
        }

        else {

            $(".cdataRow").each(function(index) {




                var t = $(this).find(".cdataType:checked").val();
                var f = $(this).find(".addFileds").val();
                var a = $(this).find(".Filedas").val();
                var tas = "";

                var m = "";
                if (index > 0) {

                    m = " , ";
                }
                if (t != "data") {
                    cdata += m + t + "(" + f + ") ";
                } else {





                    cdata += m + f;
                }



                if (a != "") {

                    cdata += " as " + a;
                }



            })




        }

        return  cdata;
    }



    function UpdateWhere() {

        var data = " WHERE ";
        if ($(".joinData").is(":checked")) {

            data = " ON ";
        }
        var wdata = "";
        $(".Brackets").each(function(bindex) {

            if (bindex > 0) {
                wdata += " " + $(this).children('.whereRow').find(".mor").val();
            }
            wdata += "(";
            $(this).find('.whereRow').each(function(index) {


                var m = "";
                var v = $(this).find(".textwhererow").val();
                if ($.trim(v) != "") {
                    if (index > 0) {
                        m = " " + $(this).find(".mor").val() + " ";
                    }

                    if ($(".joinData").is(":checked")) {
                        wdata += m + " " + $(this).find(".addFileds").val() + $(this).find(".opr").val() + "'" + v + "'";
                    } else {


                        wdata += m + "`" + $(this).find(".addFileds").val() + "`" + $(this).find(".opr").val() + "'" + v + "'";

                    }
                }

            });
            wdata += ")";
        });
        if ($.trim(wdata) == "") {
            data = "";
        } else {

            data += wdata;
        }



        return data;
    }




    function UpdateMore() {





        var mdata = "";
        if ($(".orderl").is(':checked')) {
            mdata = " ORDERBY " + $(" .orderc .addFileds").val() + " `" + $(" .orderc .orderType").val() + "`";
        }


        if ($(".limitl").is(':checked')) {

            mdata += " LIMIT " + $(".limitFrom").val() + "," + $(" .limitNumber").val();
        }




        return  mdata;
    }

    function updateQuery() {
        var data = "";
        // data = "select";

        var table = $(".tables").val();
        var cdata = UpdateCdata($(".cdataType:checked").val());
        var where = UpdateWhere();
        var more = UpdateMore();
        var jone = " ";
        if ($(".joinData").is(":checked")) {

            jone = " " + $(".joinetype").val() + " " + $(".jointables").val();
        }
        data += "select " + cdata + " from " + table + jone + " " + where + more;
        $("textarea.data").val(data);
    }
    function queryData(d) {

        d = d.split("__");
        var Data = "\n\
                    <div class='qTabs'>\n\
                    <ul>\n\
                        <li><a href='#tabel'>Tabel</a></li>\n\
                        <li><a href='#data'>Data</a></li>\n\
                        <li><a href='#where'>Where </a></li>\n\
                        <li> <a href='#more'>More</a></li>\n\
                     </ul>\n\
                      <div id='tabel' class='qbody tabel'>" + d[0] + "</div>\n\
                        <div id='data' class='qbody data'>" + d[1] + "</div>\n\
                        <div id='where' class='qbody where'>" + d[2] + "</div>\n\
                        <div id='more' class='qbody more'>" + d[3] + "</div>\n\
                    </div>";
        return Data;
    }
    ;
    function afertCode() {







        $(document).on('click', " .checkData,.cdataType,.limitl,.orderl,.mor,.opr,.updiateQury", function() {

            updateQuery();
        })


        $(document).on('change', " .tables,.addFileds", function() {

            updateQuery();
        })

        $(document).on('click', " .checkData", function() {

            var data = $(this).prop("id");
            $("." + data + " input,." + data + "select").css("background", "transparent");
            $("." + data + " input,." + data + "select").prop('disabled', false);
            updateQuery();
        })

        var mid = 0;
        $(document).on('click', " .addcdata", function() {
            mid++;
            var data = $(this).next(".cdataRow").html();
            data = data.replaceAll("name=\"cdataType\"", "name=\"cdataType" + mid + "\"");
            //alert(data)
            $(".cDatarows").append("<div class='cdataRow' >" + data + "</div>");
            updateQuery();
        })


        $(document).on('click', " .addbrackets", function() {

            var data = $(this).next(".Brackets").html();
            var n = data.replaceAll("disnone", "disblock");
            $(".cwhererows").append("<div class='Brackets' >" + n + "</div>");
            updateQuery();
        })




        $(document).on('click', " .addwhere", function() {

            var data = $(this).next(".whereRow").html();
            var n = data.replaceAll("disnone", "disblock");
            $(this).parent(".Brackets").append("<div class='whereRow' >" + n + "</div>");
            updateQuery();
        })





        $(document).on('click', " .deleteRow", function() {

            $(this).parent().remove();
            updateQuery();
        })



        $(document).on('change', " .tables", function() {

            if ($(".joinData").is(":checked")) {
                getData("table_fields", "full_options", $(this).val(), function(d) {
                    getData("table_fields", "full_options", $(".jointables").val(), function(dj) {


                        $(".addFileds").html(d + dj);
                    })
                })




            } else {

                getData("table_fields", "options", $(this).val(), function(d) {

                    $(".addFileds").html(d);

                })


            }

            updateQuery();
        })



    }

    $(function() {








        $(".checkQury").click(function() {
            getAjax("eng/checksql", "data=" + $("textarea.data").val(), function(d) {

                alert(d)

            })
        })
        $(".addQury").click(function() {


            getAjax("admin/query_data", "", function(d) {
                $(".quers").append(queryData(d));
                afertCode();
                $("body").on("cu", ".quers", function() {
                    $(".qTabs").tabs();
                    //  $(".disData input,.disData select").prop('disabled', true);

                });
                $('.quers').trigger("cu");
            })
        });
    })


</script>
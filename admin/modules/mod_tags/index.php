<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_tags() {

    global $lib;

    $datasql = $lib->db->get_data('sys_tags');

    $data = '<div class=\'data\'><div class=\'block-border\'><div class="block-content">';

    foreach ($datasql as $d) {

        $data .= '<li class=\'tag_item\' data-id="' . $d['id'] . '" id="' . $d['id'] . '" ><i  style="color:' . $d['color'] . '" class="fa fa-tag"></i>' . $d['title'] . '</a></li>';
    }

    $data .= '</div></div></div>';




    return $data;
}
?>


<script>


</script>
<div class="tag-toolbar-options">
    <a href="#"><li class="fa  fa-times-circle fa-fw"></li></a>


</div>
<style>

    .tag_item{
        margin: 5px;
        cursor: pointer

    }
    .ui-draggable{
        z-index: 111111
    }

    .tag_item i{
        margin: 5px;

    }
</style>


<script>



    function toolactions() {

        bar("tags li", "tag-toolbar-options", function(event) {


            var p = $(this).parents(".divRow");

            var obj_id = p.data("id");
            var obj_alias = p.data("table");

            var tag_id = $(this).data("id");

            var query = "obj_alias='" + $.trim(obj_alias) + "' and obj_id='" + $.trim(obj_id) + "'  and  tag_id='" + $.trim(tag_id) + "'";
            $.get("../getajax.php?file=eng/db_delete&table=sys_tags_xref&query=" + query, function(a) {

                $.get("../getajax.php?file=admin/get_tags&obj_alias=" + obj_alias + "&obj_id=" + obj_id, function(retdata) {
                    $(".tool-container").css("opacity", "0");

                    p.find(".tags._" + obj_id).html(retdata);

                })
            })
        })


    }

    var myid = "";
    $(function() {




        toolactions();


        $(".tag_item").draggable({
            appendTo: "body",
            helper: "clone", start: function() {
         
            }
        });


        $(".divRow .tdata").droppable({
            activeClass: "ui-state-default",
            hoverClass: "ui-state-hover",
            drop: function(event, ui) {
                var p = $(this).parents(".divRow");
                var obj_alias = p.data("table");
                var obj_id = p.data("id");
                var tag_id = ui.draggable.data("id");
                var vals = obj_alias + "," + obj_id + "," + tag_id;
                var query = "obj_alias='" + obj_alias + "' and obj_id='" + obj_id + "'  and  tag_id='" + $.trim(tag_id) + "'";
                $.get("../getajax.php?file=eng/db_delete&table=sys_tags_xref&query=" + query, function(a) {
                    $(".tool-container").css("opacity", "0");
                    $.get("../getajax.php?file=eng/db_insert&table=sys_tags_xref&fields=obj_alias,obj_id,tag_id&values=" + vals, function(b) {
                        $.get("../getajax.php?file=admin/get_tags&obj_alias=" + obj_alias + "&obj_id=" + obj_id, function(retdata) {

                            toolactions();
                            p.find(".tags._" + obj_id).html(retdata);


                        })

                    })

                })

            }
        })
    });
</script>

<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

//echo $lib->adminEng->getComponentMain();
global $lib;


if ($_POST['update_stat'] == "remove") {

    do_remove();
} else if ($_POST['update_stat'] == "restore") {
    do_restore();
}
$notfrom = array("", "menu_xref_com", "menu_xref_mod", "menu_xref_tem", "com_site_setting", "menu_xref_com", "site_setting");
$tables = $lib->db->get_table_names();




echo "<div class='tools_bar'><div><a class='remove_all'>Remove</a><a class='restore_all'>restore</a></div></div><div class='block-border'>
    <div class=\"block-header\"><h1>Trach</h1><span></span></div> <div class='block-content'>
    <form class='trash_form' method='post'><input type='hidden' name='update_stat' class='update_stat'  value='' />
<table style='width:800px   ;' class='adminlisttyble'> ";
foreach ($tables as $table) {


    if (array_search($table, $notfrom) == null) {


        try {
            $table_datas = $lib->db->get_data($table, "", "`delete`='1'");




            if (is_array($table_datas[0])) {

                echo "<tr><td colspan='3'>" . $table . "</td><tr>";

                foreach ($table_datas as $table_data) {


                    echo "<tr><td><input type='checkBox' name='ids[]' value='" . $table . "__" . $table_data['id'] . "'</td>
                        <!--<td>
                        <a id='" . $table . "__" . $table_data['id'] . "' class='me_restore'>restore</a>
                            <a id='" . $table . "__" . $table_data['id'] . "' class='me_delete'>Remove</a></td>-->
                            ";
                    $num = 0;
                    foreach ($table_data as $k => $v) {
                        $num++;
                        if ($num < 4) {



                            echo "<td>" . $table_data[$k] . "</td>";
                        }
                    }
                    echo "<tr>";
                }
            }
        } catch (Exception $e) {
            echo 'Caught exception: ', $e->getMessage(), "\n";
        }
    }
}

echo "</table>   </form></div></div>";
?>


<script>
    $(function(){
        $(".remove_all").click(function(){
        
        
            
      

            answer = confirm("Do you really want to Remove Data?")

            if (answer !=0)

            {

                $(".update_stat").val("remove");
                $(".trash_form").submit();

            }


        })
        
        
    
        $(".restore_all").click(function(){
        
        
            answer = confirm("Do you really want to Restore Data??")

            if (answer !=0)

            {
                $(".update_stat").val("restore");
                $(".trash_form").submit();

            }

        
        
         
        })
    
    
    
    
    })
</script>

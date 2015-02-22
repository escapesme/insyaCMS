<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
global $lib;

$as = $lib->db->get_data("com_poll_answers", "*", "`q_id`='" . $_GET['q_id'] . "'");
$all = $lib->db->get_data("com_poll_answers", "sum(nums) as n", "`q_id`='" . $_GET['q_id'] . "'");

$q = $lib->db->get_row("com_poll_questions", "*", "`id`='" . $_GET['q_id'] . "'");


$returnData .= "<h3>" . $_GET['res'] . "</h3><div>" . $q['questions'] . "</div>";




foreach ($as as $a) {

    $per =($a['nums'] / $all[0]['n']) * 100;
    $returnData .= "<div>" . $a['answers'] . ": " . $a['nums'] . " <br/><div class='poll_resb' style='border:1px solid #111;clear:both;width:96%;margin:auto;padding:1px;background:#eee; height:20px;'><div style='float:right;width:".$per."%;background:#111; height:20px;'></div>".round($per) ."%</div></div>";
}

//$returnData .= " <input  type='button' class='button poll_back'    value='" . $_GET['back'] . "' /> ";





echo $returnData;
?>

<script>

    $(function() {
        $(".poll_back").click(function() {

            getModule("<?= $_GET['mod_id'] ?>", ".mod._<?= $_GET['mod_id'] ?>", "");


            //   updateModule("order", ".order_module", '<?= $_GET['alias'] ?>');

        })

    })
</script>


<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function faqUpdateData($lng, $pro) {

    if (isset($_POST['question'])) {

        global $lib;


        $lib->db->insert_row("com_faq", $_POST);


        return $lib->front->sendMessage("", $lng['addMessage']);
    }
}

function faqForm($lng) {
    global $lib;
    $data = "<div class='com_faq_form'>";

    $myendform = array(
        "formstart" => array(
            "name" => "formstart",
            "type" => "form",
            "acton" => "",
            "method" => "post",
            "name" => "faq_form",
            "class" => "faq_form"
        ),
        "question" => array(
            "name" => "question",
            "type" => "textarea",
            "value" => "",
            "title" => $lng['question']
        ),
        "mysubmit" => array(
            "name" => "mysubmit",
            "type" => "submit",
            "value" => $lng['send'],
            'class' => 'button actions-left'
        ),
        "myreset" => array(
            "name" => "myreset",
            "type" => "reset",
            "value" => $lng['reset'],
            'class' => 'button red actions-left'
        ),
        "myendform" => array(
            "name" => "myendform",
            "type" => "endForm"
        )
    );




    $lib->forms->filds = $myendform;
    $data .= $lib->forms->_render_form();




    $data.="</div>";
    return $data;
}

function linkedStyle($pro, $lng) {
    global $lib;



    $faqs_cats = $lib->db->get_Data("com_faq_categories", "*", "`delete`=0 and `enabled`=1 order by `order`");


    foreach ($faqs_cats as $cat) {
        $faqs = $lib->db->get_Data("com_faq", "*", " cat_id='" . $cat['id'] . "' and `delete`=0 and `enabled`=1 order by `order`");
        $data.="<div class='title totop faq_title '>" . $cat['title'] . "</div>";
        foreach ($faqs as $f) {
            $data.="<div id='faq__" . $f['id'] . "' class=' h5 faqq_question'>" . $f['question'] . "</div>";
        }
    }





    foreach ($faqs_cats as $cat) {
        $faqs = $lib->db->get_Data("com_faq", "*", " cat_id='" . $cat['id'] . "' and `delete`=0 and `enabled`=1 order by `order`");
        $data.="<div class='title faq_title'>" . $cat['title'] . "</div>";
        foreach ($faqs as $f) {
            $data.="
                <div class='faq__" . $f['id'] . " h4 faq_question'><span class='subtitle'>Q.</span> " . $f['question'] . "</div>";
            $data.="<div class='faq_answer bgwhite boxshadow'><span class='subtitle'>A.</span> <p>" . $f['answer'] . "</p></div><a class='totop'>Back to top</a>";
        }
    }
    ?>
    <script>
        $(function() {

            var speed = 500;



            $(".totop").click(function() {


                $('html, body').animate({
                    scrollTop: $(".totop").offset().top
                }, speed);

            })



            $(".faqq_question").click(function() {
                var toClass = $(this).attr("id");

                $('html, body').animate({
                    scrollTop: $("." + toClass).offset().top
                }, speed);

            })


        })


    </script>




    <?php
    return $data;
}

function accordianStyle($lng) {
    global $lib;

    $faqs_cats = $lib->db->get_Data("com_faq_categories", "*", "`delete`=0 and `enabled`=1 order by `order`");



    $faqs = $lib->db->get_Data("com_faq", "*", "`delete`=0 and `enabled`=1 order by `order`");

    foreach ($faqs_cats as $cat) {
        $faqs = $lib->db->get_Data("com_faq", "*", " cat_id='" . $cat['id'] . "' and `delete`=0 and `enabled`=1 order by `order`");
        $data.="<div><div class='title faq_cat_title'><img src='/uploads/images/" . $cat['image'] . "'/>" . $cat['title'] . "</div><div class='myqs'>";
        foreach ($faqs as $f) {
            $data.="
                <div class='faq__" . $f['id'] . " bgwhite h4 faq_question'><span class='subtitle h4'>" . $lng['Q'] . "</span> " . $f['question'] . "</div>";
            $data.="<div class='faq_answer bgwhite '><span class='subtitle h4'>" . $lng['A'] . " </span><p> " . $f['answer'] . "</p></div>";
        }


        $data.="</div></div>";
    }
    ?>


    <style>

        .faq_cat_title img{
            max-height: 100%;
            float:right;
            margin-top: 5px;
            height:50px;
            margin-right: 10px;
            margin-left: 10px;
        }
        .faq_question{
            margin-top: 2px;
            cursor: pointer;
            padding-top: 10px;
            padding-right: 10px;
        }

        .main  {
            background: #f2f2f2;
        }

        .faq_answer{
            padding:10px;
        }
    </style>

    <?php
    $data.="<script>$(function() { accordianAction(); })</script>";
    return $data;
}

function listStyle($pro, $lng) {
    global $lib;

    $faqs = $lib->db->get_Data("com_faq", "*", "`delete`=0 and `enabled`=1 order by `order`");

    foreach ($faqs as $f) {
        $data.="<div class='faq_question'>" . $f['question'] . "</div>";
        $data.="<div class='faq_answer_m'>" . _substr($f['answer'], 30) . "</div>";
        $data.="<div class='faq_answer'>" . $f['answer'] . "</div>";
    }
    ?>


    <style>
        .faq_answer{

            display: none;

        }

        .faq_question{
            cursor: pointer;
        }




    </style>

    <?php
    $data.="<script>$(function() { listTypeactions(); })</script>";
    return $data;
}
?>



<script>



</script>


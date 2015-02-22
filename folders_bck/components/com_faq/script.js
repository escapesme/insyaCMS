/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function accordianAction() {

    $(".myqs").hide();

    /*
     $(".myqs").eq(0).show();
     $(".faq_cat_title").eq(0).addClass("open");
     */

    $(".faq_cat_title").click(function() {


 

        $(".myqs").slideUp("slow");



        if (!$(this).hasClass("open")) {

            $(this).addClass("open");
            $(this).parent().find(".myqs").slideDown("slow");


        }else{
            
            
                $(".faq_cat_title").removeClass("open");
        }


   

    })



}
function listTypeactions() {


    $(".faq_answer_m").click(function() {

        $(this).slideUp("slow");
        $(this).next(".faq_answer").slideDown("slow");
    })


    $(".faq_answer").click(function() {

        $(this).slideUp("slow");
        $(this).prev(".faq_answer_m").slideDown("slow");
    })

}



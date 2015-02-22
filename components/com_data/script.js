/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {

    $(document).on('click', ".updateData", function() {
        var myis = $(this).attr("id");

        var myids = myis.split("__");



        var myi = myids[0];
        var allData = ""
        $("." + myi + ".data").each(function() {
            var val = $(this).val();
            if ($(this).attr("type") == "checkbox") {
                if ($(this).is(':checked')) {
                    val = "1";
                } else {
                    val = "0";
                }
            }
            allData += $(this).attr("id") + "__" + val + ";"
        })




        var query_tabel = $(this).parent().children(".query_tabel").val();
        
        
        
      
        

        getAjax("eng/db_mupdate", "tabel=" + query_tabel + "&field=" + myids[1] + "&data=" + allData, function(d) {
            refresh();
            alert ("update Done...");
        });

    })

    $(document).on('change', ".filterData", function() {

        refresh();
    })






})
function refresh() {


    var fdata = "";



    $(".filterData").each(function() {

        fdata += $(this).val() + ";";

    })
    sendPAjax("index", "main=1&alias=testdata&status=tabelBody&fitlerdata=" + fdata, function(d) {
        $(".chartCont").html(d);
    })


}
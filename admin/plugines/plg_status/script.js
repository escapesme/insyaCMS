/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {




    $(".extype").change(function() {
        var val = $(this).val();


        $(".plg_extensionInputs .checkin").parents(".form_row ").show();



        $(".plg_extensionInputs .package_id").parents(".form_row ").show();

        $(".plg_extensionInputs .checkout").parents(".form_row ").removeClass("col-9");
        $(".plg_extensionInputs .checkout").parents(".form_row ").addClass("col-3");

        $(".plg_extensionInputs .package_id").parents(".form_row ").removeClass("col-9");
        $(".plg_extensionInputs .package_id").parents(".form_row ").addClass("col-3");


        $(".plg_extensionInputs .package_id").parents(".form_row ").removeClass("col-9");

        $(".plg_extensionInputs .package_id").parents(".form_row ").addClass("col-3");



        if (val === "extend") {

            $(".plg_extensionInputs .checkin").parents(".form_row ").hide();

            $(".plg_extensionInputs .package_id").parents(".form_row ").hide();

            $(".plg_extensionInputs .checkout").parents(".form_row ").removeClass("col-3");

            $(".plg_extensionInputs .checkout").parents(".form_row ").addClass("col-9");

        } else if (val === "booking") {

        } else if (val === "transfer") {

        }




    })




    $(".updateex").click(function() {


        var doaj = true;
        var dolist = true;

        var val = $(".extype").val();


        if (val === "extend") {
            if ($(".plg_extensionInputs .checkout").val() == "") {
                doaj = false;
            }

        } else {
            if (
                    $(".plg_extensionInputs .checkout").val() === ""
                    || $(".plg_extensionInputs .package_id").val() === "-1"
                    || $(".plg_extensionInputs .checkin").val() === ""
                    ) {
                doaj = false;
            }

        }
        if (val === "") {

            doaj = false;

        }


        if (getids("list_formfiz_reservation") === "") {
            dolist = false;



        }


        if (!doaj) {
            alert("Error: Required fields cannot be empty!");

        } else if (!dolist) {
            alert("Error: No items selected!");

        } else {

            var url = "checkout=" + $(".checkout").val();
            url += "&checkin=" + $(".checkin").val();
            url += "&package_id=" + $(".package_id").val();
            url += "&ids=" + getids("list_formfiz_reservation");
            url += "&type=" + $(".extype").val();
            var slink = "../getajax.php?file=coms/fiz/extension&" + url;





            $.get(slink, function(retdata) {





                alert(retdata);
            })




          
        }



    })


})
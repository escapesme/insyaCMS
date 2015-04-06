




function d(p, checkinClass, checkoutClass, NightsClass) {

    var d2 = p.find(checkoutClass).val();
    var d1 = p.find(checkinClass).val();





    if (d1 != null && d2 != null) {
        getAjax("daysW2Dates", "d1=" + d1 + "&d2=" + d2, function(f) {
            if (parseFloat(f) >= 0) {

                p.find(NightsClass).val(f)
            } else if (parseFloat(f) < 0) {

                alert("Error: Checkout date cannot be before check in date!");

                p.find(NightsClass).val(0);
            } else {

                p.find(NightsClass).val(0);

            }



        });
    }


}











$(function() {



    var option = {
        dateFormat: "dd/mm/yy"
        , onSelect: function(selectedDate) {

            d($(this).parents(".razaform"), ".ex_checkin", ".ex_checkout", ".ex_nights");
        }};
    $(".ex_checkin,.ex_checkout").datepicker(option);


    /*
     $(".ex_checkin,.ex_checkout").on("input", function(e) {
     d($(this).parents(".razaform"), "ex_checkin", ".ex_checkout", ".ex_nights");
     
     alert($(this).val());
     });
     $(".ex_checkin,.ex_checkout").(function() {
     d($(this).parents(".razaform"), "ex_checkin", ".ex_checkout", ".ex_nights");
     
     alert($(this).val());
     
     });
     
     */

    $(document).on("click", ".update_button", function() {
        var title = $('.raza_type:checked').data("title");
        var id = $('.raza_type:checked').val();

        var hostid = $('.raza_type:checked').parent().find(".host_its_id").val();


        var more = "";

        if (hostid != null && hostid != "") {


            more = "&host_its_id=" + hostid;

        }
        sendPAjax("ajax/coms/fiz/reservations_actions", "status=changertype&value=" + "&rtpy=" + id + more, function(data) {

            $(".razaoptions").hide();
            $(".raza_val_body").show();
            $(".apply_for_raza").hide();
            $(".raza_type_val").data("id", id);
            $(".raza_type_val").data("host_its_id", hostid);
            $(".raza_type_val").text(title);







            $.colorbox.close();


        });



    })

    $(document).on("click", ".change_button", function() {

        $.colorbox({width: "600px", height: "200px", html: "<div class='razaoptions'>" + $(".razaoptions").html() + "</div>", });

    })




    $(document).on("click", ".apply_for_raza ", function() {


        $(".razaoptions").show();

    })



    $(document).on("click", ".add_button", function() {



        var more = "";

        if ($(".raza_type_val").data("host_its_id") != null && $(".raza_type_val").data("host_its_id") != "") {


            more = "&host_its_id=" + $(".raza_type_val").data("host_its_id");

        }

        sendPAjax("ajax/coms/fiz/reservations_actions", "status=getits&value=" + $(".addits").val() + "&rtpy=" + $(".raza_type_val").data("id") + more, function(data) {
            if ($.trim(data) == "0") {
                alert("Error: User data could not be retrieved. Please check if the ITS IS is correct.");


            } else if ($.trim(data) == "-1") {

                alert("Error: User has already registered.");
            } else {
                $(".itsTable tbody").append(data);

            }
        });

    })


    $(document).on("click", ".delete_its", function() {



        var o = $(this);
        sendPAjax("ajax/coms/fiz/reservations_actions", "status=deleteits&value=" + $(".delete_its").data("rid"), function(data) {


            o.parents("tr").remove();

        });

    })







    $(document).on("click", ".next_back", function() {

        var o = $(this);
        window.location = o.data("to");

    })


    $(document).on("click", ".forall", function() {

        var ex_checkin = $(".razaform").eq(0).find(".ex_checkin").val();

        var ex_checkout = $(".razaform").eq(0).find(".ex_checkout").val();

        var airline = $(".razaform").eq(0).find(".airline").val();

        var airline_code = $(".razaform").eq(0).find(".airline_code").val();

        var arriving_from = $(".razaform").eq(0).find(".arriving_from").val();

        var data_h = $(".razaform").eq(0).find(".data_h").val();

        var data_m = $(".razaform").eq(0).find(".data_m").val();

        $(".razaform").each(function() {


            //  if ($.trim($(this).find(".ex_checkin").val()) == "") {

            $(this).find(".ex_checkin").val(ex_checkin);

            //  }

            //  if ($.trim($(this).find(".ex_checkout").val()) == "") {

            $(this).find(".ex_checkout").val(ex_checkout);

            //  }

            //  if ($.trim($(this).find(".airline").val()) == "") {

            $(this).find(".airline").val(airline);

            //   }

            //  if ($.trim($(this).find(".airline_code").val()) == "") {

            $(this).find(".airline_code").val(airline_code);

            //  }

            //if ($.trim($(this).find(".arriving_from").val()) == "") {

            $(this).find(".arriving_from").val(arriving_from);

            // }

            // if ($.trim($(this).find(".data_h").val()) == "00") {

            $(this).find(".data_h").val(data_h);

            /// }


            ///  if ($.trim($(this).find(".data_m").val()) == "00") {

            $(this).find(".data_m").val(data_m);

            //  }


        })

    })










    $(document).on("click", ".next_res", function() {


        var o = $(this);

        if (o.data("do") == "addtosesstion") {

            var j = "";
            var i = 0;
            sendPAjax("ajax/coms/fiz/reservations_actions", "status=clearsesstion&", function(data) {


                $(".razaform").each(function() {

                    j += "remarks=" + $(".remarks").val() + "&";


                    i++;
                    $(this).find("input,select,textarea").each(function() {

                        j += $(this).attr("name") + "=" + $(this).val() + "&";
                    })
                    sendPAjax("ajax/coms/fiz/reservations_actions", "status=addtosesstion&" + j, function(data) {


                        $(".itsTable tbody").append(data);


                        if (i == $(".razaform").size()) {


                            window.location = o.data("to");
                        }

                    });


                })

            })
        } else if (o.data("do") == "save") {




            sendPAjax("ajax/coms/fiz/reservations_actions", "status=save", function(data) {


                window.location = o.data("to");





            });


        } else if (o.data("do") == "logout") {


            sendPAjax("ajax/coms/fiz/reservations_actions", "status=logout", function(data) {
                window.location = o.data("to");
            })

        } else if (o.data("do") == "login") {




            sendPAjax("ajax/coms/fiz/reservations_actions", "status=lgoin&value=" + $(".its_id").val(), function(data) {




                if ($.trim(data) == "0") {
                    alert("Error: User data could not be retrieved. Please check if the ITS IS is correct.");



                } else {


                    window.location = o.data("to");
                }


            });
        }
        else if (o.data("do") == "updatePkg") {

            var id = $('.raza_pkg:checked').val();



            sendPAjax("ajax/coms/fiz/reservations_actions", "status=updatepkg&id=" + id, function(data) {



                window.location = o.data("to");





            });


        } else {

            window.location = o.data("to");


        }





    })





})
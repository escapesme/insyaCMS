


//<editor-fold defaultstate="collapsed" desc="comment">




function  updateFileTable() {

    if ($(".res_id").val() !== undefined) {
        sendPAjax("ajax/coms/fiz/reservations_actions", "status=get_files&" + "&id=" + $(".mylightboxbg").data("id"), function (data) {
            $(".FileTable").html(data);
        })
    }
}
$(document).ready(function () {
    $('#fine-uploader').fineUploader({
        request: {
            endpoint: "/ajax/upload.php"
        },
        // optional feature

        validation: {
            itemLimit: 5,
            sizeLimit: 15000000
        }})

            .on('complete', function (event, id, name, response) {




                sendPAjax("ajax/coms/fiz/reservations_actions", "name=" + name + "&status=add_files" + "&id=" + $(".mylightboxbg").data("id"), function (data) {

                    updateFileTable();
                });


                /*var $fileEl = $(this).fineUploaderS3("getItemByFileId", id),
                 $viewBtn = $fileEl.find(".view-btn");
                 alert("sdfsdf");
                 
                 
                 if (response.success) {
                 alert(response.tempLink);
                 $viewBtn.show();
                 $viewBtn.attr("href", response.tempLink);
                 }*/
            });
});





$(function () {
//mylightbox

    updateTable();

    $(document).on("click", ".upload_filesdata", function () {
        $(".mylightboxbg").show("fast");
        $(".mylightboxbg").data("id", $(this).data("id"));
        $(".qq-upload-success").remove();
        updateFileTable();

    });
    $(document).on("click", "#cboxClose", function () {
        $(".mylightboxbg").hide("fast");


    });










    $(document).on("click", ".delete_file", function () {
        sendPAjax("ajax/coms/fiz/reservations_actions", "name=" + $(this).data("name") + "&status=delete_files&" + "id=" + $(this).data("id"), function (data) {

            updateFileTable()
        });

    })
    $(document).on("click", ".uc_do", function () {
        var to = $(this).data("to");
        sendPAjax("ajax/coms/fiz/reservations_actions", "rid=" + $(".res_id").val() + "&status=update_counect&" + "&email=" + $(".lightboxData .uc_email").val() + "&mobile=" + $(".lightboxData .uc_phone").val(), function (data) {
            window.location = to;
            updateTable();
        });

    })

    $(document).on("click", ".change_button", function () {

        $.colorbox({width: "600px", height: "200px", html: "<div class='razaoptions lightboxData edit'>" + $(".edit.razaoptions").html() + "</div>", });

    })

    $(document).on("click", ".showhtmllightbox", function () {

        $.colorbox({width: "600px", height: "200px", html: "<div class='lightboxData  " + $(this).data("show") + "  '>" + $("." + $(this).data("show")).html() + "</div>", onComplete: function (aa) {


            }});

    })






    $(document).on("click", ".edit .update_button", function () {
        var to = $(this).data("to");
        var more = "";
        var p = $(this).parents(".razaoptions");


        if ($(".lightboxData .host_its_id").val() != null && $(".lightboxData .host_its_id").val() != "") {
            more = "&host_its_id=" + $(".lightboxData .host_its_id").val();

        }
        sendPAjax("ajax/coms/fiz/reservations_actions", "rid=" + $(".res_id").val() + "&status=raza_change&" + "&rtpy=" + p.find(".raza_type:checked").val() + more, function (data) {

            window.location = to;


        });

    })





    $(document).on("click", ".res_actions", function () {
        var status = $(this).data("status");
        var to = $(this).data("to");
        var value = $(".its_id").val();



        getAjax("coms/fiz/reservations_actions", "status=" + status + "&value=" + value, function (f) {

            if ($.trim(f) == "0") {
                window.location = to;


            } else {

                alert("Error: ITS ID incorrect. Please verify the ITS ID you entered");

            }
        });


    });



    $(document).on("click", ".logout_its", function () {

        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=logoures&rid=" + rid, function (f) {

            window.location = "/Raza-Safar/";

        });

    });


    $(document).on("click", ".apply_for_raza", function () {
        $(this).hide("fast");

        $(".add.razaoptions").show("fast");

    })




    $(document).on("click", ".add .add_button_new", function () {
        var more = "";
        var to = $(this).data("to");

        var p = $(this).parents(".razaoptions");



        if ($(".add .host_its_id").val() != null && $(".add .host_its_id").val() != "") {
            more = "&host_its_id=" + $(".add .host_its_id").val();

        }
        sendPAjax("ajax/coms/fiz/reservations_actions", "status=raza_new&" + "&rtpy=" + p.find(".raza_type:checked").val() + more, function (data) {
            if ($.trim(data) == "0") {
                alert("Error: User data could not be retrieved. Please check if the ITS IS is correct.");
            } else if ($.trim(data) == "-1") {

                alert("Error: User has already registered.");
            } else {

                //$(".res_id").val(data);


                window.location = to;

            }
        });

    })





            ;

    function  updateTable() {

        if ($(".res_id").val() !== undefined) {
            sendPAjax("ajax/coms/fiz/reservations_actions", "status=updateTable&" + "&res_id=" + $(".res_id").val(), function (data) {
                $(".restable").html(data);
            })
        }
    }
    ;



    $(document).on("click", ".itsTable .deleteej_bt", function () {


        if (confirm("Are you sure you would like to cancel the Raza application for \"" + $(this).data("name") + "\" ?")) {

            sendPAjax("ajax/coms/fiz/reservations_actions", "rid=" + $(this).data("res_id") + "&status=raza_delete&value=" + $(this).data("id"), function (data) {


                updateTable();


            });

        }
    })




    $(document).on("click", ".itsTable .deleteej_bt", function () {

        sendPAjax("ajax/coms/fiz/reservations_actions", "rid=" + $(this).data("res_id") + "&status=raza_delete&value=" + $(this).data("id"), function (data) {


            updateTable();


        });


    })






    $(document).on("click", ".itsTable .deleteej_bt", function () {

        sendPAjax("ajax/coms/fiz/reservations_actions", "rid=" + $(this).data("res_id") + "&status=raza_delete&value=" + $(this).data("id"), function (data) {


            updateTable();


        });


    })

    $(document).on("click", ".itsTable .add_button", function () {
        var more = "";


        sendPAjax("ajax/coms/fiz/reservations_actions", "rid=" + $(this).data("res_id") + "&status=raza_new&value=" + $(".addits").val() + more, function (data) {
            if ($.trim(data) == "0") {
                alert("Error: User data could not be retrieved. Please check if the ITS IS is correct.");


            } else if ($.trim(data) == "-1") {

                alert("Error: User has already registered.");
            } else {
                updateTable();

            }
        });

    })


})



//</editor-fold>




//<editor-fold defaultstate="collapsed" desc="Temp">


function d(p, checkinClass, checkoutClass, NightsClass) {

    var d2 = p.find(checkoutClass).val();
    var d1 = p.find(checkinClass).val();





    if (d1 != null && d2 != null) {
        getAjax("daysW2Dates", "d1=" + d1 + "&d2=" + d2, function (f) {
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











$(function () {





    var option = {
        dateFormat: "dd/mm/yy"
        , onSelect: function (selectedDate) {

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
    /*
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
     */











    /*
     
     
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
     
     
     */


















    $(document).on("click", ".next_back", function () {

        var o = $(this);
        window.location = o.data("to");

    })


    $(document).on("click", ".forall", function () {

        var ex_checkin = $(".razaform").eq(0).find(".ex_checkin").val();

        var ex_checkout = $(".razaform").eq(0).find(".ex_checkout").val();

        var airline = $(".razaform").eq(0).find(".airline").val();

        var airline_code = $(".razaform").eq(0).find(".airline_code").val();

        var arriving_from = $(".razaform").eq(0).find(".arriving_from").val();

        var data_h = $(".razaform").eq(0).find(".data_h").val();

        var data_m = $(".razaform").eq(0).find(".data_m").val();

        $(".razaform").each(function () {


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










    $(document).on("click", ".next_res", function () {


        var o = $(this);

        if (o.data("do") == "addtosesstion") {

            var j = "";
            var i = 0;
            sendPAjax("ajax/coms/fiz/reservations_actions", "status=clearsesstion&", function (data) {


                $(".razaform").each(function () {

                    j += "remarks=" + $(".remarks").val() + "&";


                    i++;
                    $(this).find("input,select,textarea").each(function () {

                        j += $(this).attr("name") + "=" + $(this).val() + "&";
                    })
                    sendPAjax("ajax/coms/fiz/reservations_actions", "status=addtosesstion&" + j, function (data) {


                        $(".itsTable tbody").append(data);


                        if (i == $(".razaform").size()) {


                            window.location = o.data("to");
                        }

                    });


                })

            })
        } else if (o.data("do") == "save") {




            sendPAjax("ajax/coms/fiz/reservations_actions", "status=save", function (data) {


                window.location = o.data("to");





            });


        } else if (o.data("do") == "login") {



            sendPAjax("ajax/coms/fiz/reservations_actions", "status=lgoin&value=" + $(".its_id").val(), function (data) {




                if ($.trim(data) == "0") {
                    alert("Error: User data could not be retrieved. Please check if the ITS IS is correct.");



                } else {


                    window.location = o.data("to");
                }


            });
        }
        else if (o.data("do") == "updatePkg") {

            var id = $('.raza_pkg:checked').val();



            sendPAjax("ajax/coms/fiz/reservations_actions", "status=updatepkg&id=" + id, function (data) {



                window.location = o.data("to");





            });


        } else {

            window.location = o.data("to");


        }





    })





})
//</editor-fold>

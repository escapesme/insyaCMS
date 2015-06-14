











function updateCountry() {
    var d = "";
    $(".country_select").each(function () {
        d += $(this).val() + ",";
    });
    $(".country").val(d);



    var d = "";
    $(".xrefid").each(function () {
        d += $(this).val() + ",";
    });
    $(".xrefids").val(d);

}



function getStatus(callBack) {
    getAjax("getStatus", "d1=" + d1 + "&d2=" + d2, callBack)








}




function d(go) {

    var d2 = $(".checkout").val();
    var d1 = $(".checkin").val();

    if ($(".tabelRes tbody tr ").size() > 0) {

        if (d1 != null && d2 != null) {
            getAjax("daysW2Dates", "d1=" + d1 + "&d2=" + d2, function (f) {





                if (parseFloat(f) >= 0) {





                    $(".nights").val(f);

                    if (go) {
                        updateCountry();



                        $("form").submit();


                    }
                } else if (parseFloat(f) < 0) {
                    if (go) {
                        alert("Error: Checkout date cannot be before check in date!");
                    }

                    $(".nights").val(0);
                } else {
                    if (go) {
                        alert("Error: Checkout date cannot be before check in date!");
                    }

                    $(".nights").val(0);

                }



            });
        }
    } else {

        alert("Error: There are no members in this booking. Please enter ITS ID to add members to your reservation.");

    }
}

$(function () {

    var urll = "/includes/js/jqueryvalidation/languages/jquery.validationEngine-en.js";

    $.getScript(urll, function () {
        var url = "/includes/js/jqueryvalidation/jquery.validationEngine.js";

        $.getScript(url, function () {
            $("form").validationEngine('attach', {
                onValidationComplete: function (form, status) {


                    if (status == true) {
                        setFormToSesstion($("form"), function () {
                            window.location = "/site/" + getFromUrl("site") + "/Reservations/step/verify-documents/";
                        })
                    }
                }
            });
        });
    })
    $(".checkinDate").datepicker({
        dateFormat: "dd/mm/yy",
        onSelect: function (value, date) {


            $(".checkin").val(value);

            d(false);

        }}).
            datepicker('setDate', $(".checkin").val());



    $(".checkoutDate").datepicker({
        dateFormat: "dd/mm/yy",
        onSelect: function (value, date) {

            $(".checkout").val(value);

            d(false);
        }}).
            datepicker('setDate', $(".checkout").val());



    var ids = $(".Mumin_ids").val();

    if (ids) {
        ids = ids.split(",");
        for (var i = 0; i < ids.length; i++) {

            getAjax("res/chekej", "ej=" + ids[i], function (f) {

                getAjax("coms/fiz/reservations_actions", "status=getcuntry", function (c) {
                    getAjax("coms/fiz/reservations_actions", "status=gtexrefids", function (x) {
                        updateResTable(f, "open", c, x);
                    });
                });
            });
        }


    }










    var clickStatus = true;
    $(document).on("click", ".addMoreBT", function () {

        var me = $(this);

        var eid = me.parent().find(".its_id").val();



        if (isNaN(eid)) {
            alert("Error: ITS ID incorrect. Please verify the ITS ID you entered");
        } else {

            if (clickStatus) {




                if ($(".Mumin_ids").val().indexOf(eid) >= 0) {
                    alert("Error: This ITS number already exists in the booking.");
                } else {
                    clickStatus = false;
                    getAjax("res/chekej", "ej=" + eid, function (f) {

                        if ($.trim(f) !== "0") {

                            getAjax("coms/fiz/reservations_actions", "status=getcuntry", function (c) {


                                updateResTable($.trim(f), "", $.trim(c));
                                clickStatus = true;


                            })

                        } else {

                            alert("Authentication error: The ITS ID and date of birth do not match. ");
                            clickStatus = true;
                        }



                    })
                }
            } else {



            }




        }

    })


    $(document).on("click", ".removeTabelRes", function () {
        var t = $(this);
        var id = t.data('id');

        if (confirm("Are you sure you would like to remove ITS ID " + id + " from your reservation?")) {


            var mep = $(this).parent("td").parent("tr");


            mep.fadeOut(1000, function () {
                mep.remove();



                var res = $(".Mumin_ids").val().replace("," + id, "");

                res = res.replace(id, "");





                $(".Mumin_ids").val(res);




            });
        }



    });
    /*
     * 
     * @param {type} ej
     * @returns {undefined}
     * 
     * Mumin_id: "30385154", FullName: "Mulla Aziz bhai Shaikh Mohammed bhai Shakir ( vasi }", prefix: "Mulla", First_name: "Aziz", Middle_Prefix: "Shaikh"â€¦}
     Age: "31"
     Age1: "31"
     First_name: "Aziz"
     FullName: "Mulla Aziz bhai Shaikh Mohammed bhai Shakir ( vasi }"
     Jamaat: "Cairo_Jamaat"
     Jamiaat: "Al-Khaleej"
     MOBILE_NO: "201222489051"
     Middle_Name: "Mohammed"
     Middle_Prefix: "Shaikh"
     Mumin_id: "30385154"
     Surname: "Shakir ( vasi }"
     dob: "23 Aug 1982 "
     email: "azizms@gmail.com"
     gender: "M"
     prefix: "Mulla"
     */




    function updateCountryToselcet() {
        var cs = $(".country").val().split(",");

        var i = 0;
        $(".country_select").each(function () {
            $(this).val($.trim(cs[i]));
            i++;
        });



        var cs = $(".xrefids").val().split(",");

        var i = 0;
        $(".xrefid").each(function () {


            if (cs[i] === null) {
                cs[i] = "0";
            }
            $(this).val($.trim(cs[i]));
            i++;
        });




    }


    function updateResTable(getdata, status, c, x) {
        //  alert(getdata);
        var data = new Object();
        getdata = getdata.split("[");
        for (var i = 0; i < getdata.length; i++) {
            var a = $.trim(getdata[i]).split("=>");
            var v = a[0].replace("]", "");
            data[$.trim(v)] = $.trim(a[1]);
        }


        getAjax("admin/fillList", "status=countries", function (selectData) {
            if ($(".tabelRes table tbody").length)
            {
                var html = "<tr>\n\
                                <td>" + data['Mumin_id'] + "</td>\n\
                                <td>" + data['FullName'] + "</td><td><input type='hidden' class='xrefid'><select  class='country_select required  validate[required]'  name='country_select'>" + selectData + "</select></td>\n\
                                <td><input class='button removeTabelRes' value='remove'  data-id='" + data['Mumin_id'] + "'  type='button' /></tr>";


                $(".tabelRes table tbody").append(html);

                if (status !== "open") {
                    $(".Mumin_ids").val($(".Mumin_ids").val() + "," + data['Mumin_id']);
                }

            } else {


                var html = "\
                                                <input type='hidden' name='country' value='" + $.trim(c) + "' class='country' />\n\
<input type='hidden' name='xrefids' value='" + $.trim(x) + "' class='xrefids' />\n\
<table class='mainTabel'>\n\
                                                <thead><tr><th>ITS ID</th><th>Name</th><th>Nationality</th></tr></thead>\n\
                                                <tbody><tr><td>" + data['Mumin_id'] + "</td><td>" + data['FullName'] + "</td><td><input  type='hidden'  class='xrefid'><select class='country_select required  validate[required]' name='country_select'>" + selectData + "</select></td><td><input class='button removeTabelRes' value='remove' data-id='" + data['Mumin_id'] + "'  type='button' /></td></tr>\n\
                                                </tbody></table>";
                if (status !== "open") {
                    $(".Mumin_ids").val(data['Mumin_id']);
                }
                $(".tabelRes").html(html);

            }
            updateCountryToselcet();
        });

    }
    ;
});



$(function () {
    $(document).on("change", ".country_select", function () {
        updateCountry();
    });
    $(".wnext").click(function () {
        var o = $(this);
        if ($("form").doesExist()) {
            if (o.data("step") != "reservation-form") {
                return false;
            } else {
                d(true);
            }
            return false;
        }
    })
})







function d() {


    var d2 = $(".checkout").val();
    var d1 = $(".checkin").val();





    if (d1 != null && d2 != null) {
        getAjax("daysW2Dates", "d1=" + d1 + "&d2=" + d2, function(f) {
            if (parseFloat(f) >= 0) {

                $(".nights").val(f)
            } else if (parseFloat(f) < 0) {



                alert("Error: Checkout date cannot be before check in date!");



                $(".nights").val(0);
            } else {

                $(".nights").val(0);

            }



        });
    }
    ;


}

$(function() {



 d() ;

    $(".checkinDate").datepicker({
        dateFormat: "dd/mm/yy",
        onSelect: function(value, date) {


            $(".checkin").val(value);


            d();
        }}).
            datepicker('setDate', $(".checkin").val());
    ;

    $(".checkoutDate").datepicker({
        dateFormat: "dd/mm/yy",
        onSelect: function(value, date) {

            $(".checkout").val(value);

            d();
        }}).
            datepicker('setDate', $(".checkout").val());
    ;









    var ids = $(".Mumin_ids").val();

    if (ids) {
        ids = ids.split(",");
        for (var i = 0; i < ids.length; i++) {
            getAjax("res/chekej", "ej=" + ids[i], function(f) {


                updateResTable(f, "open");

            })
        }


    }








  $(document).on("click", ".new_its", function() {

        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=newres&rid=" + rid, function(f) {


        window.location = "/rex/step/2/";

        })

    })
  $(document).on("click", ".logout_its", function() {

        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=logoures&rid=" + rid, function(f) {
         window.location = "/rex/step/1/";
        })
    })
    
    
    
    /*
     * 
     * 
     * = "lgoin") {
    global $lib;

    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['value'
     */
    
    $(document).on("click", ".edit_its", function() {

        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=editres&rid=" + rid, function(f) {


           window.location = "/rex/step/2/";

        })

    });
    
    
    
    $(document).on("click", ".delete_its", function() {


        var rid = $(this).data("rid");

        getAjax("coms/fiz/reservations_actions", "status=deleteres&rid=" + rid, function(f) {

///rex/step/2/


            window.location = "/Reservations//"

        })

    })



    $(document).on("click", ".addMoreBT", function() {

        var me = $(this);

        var eid = me.parent().find(".its_id").val();

        if (isNaN(eid)) {
            alert("Error: ITS ID incorrect. Please verify the ITS ID you entered");


        } else {
            getAjax("res/chekej", "ej=" + eid, function(f) {

                if ($.trim(f) !== "0") {



                    updateResTable($.trim(f));

                } else {

                    alert("Authentication error: The ITS ID and date of birth do not match. ");

                }



            })


        }

    })


    $(document).on("click", ".removeTabelRes", function() {
        var t = $(this);
        var id = t.data('id');

        if (confirm("Are you sure you would like to remove ITS ID " + id + " from your reservation?")) {


            var mep = $(this).parent("td").parent("tr");


            mep.fadeOut(1000, function() {
                mep.remove();



                var res = $(".Mumin_ids").val().replace("," + id, "");

                res = res.replace(id, "");





                $(".Mumin_ids").val(res);




            });
        }



    })


    /*
     * 
     * @param {type} ej
     * @returns {undefined}
     * 
     * Mumin_id: "30385154", FullName: "Mulla Aziz bhai Shaikh Mohammed bhai Shakir ( vasi }", prefix: "Mulla", First_name: "Aziz", Middle_Prefix: "Shaikh"…}
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






    function updateResTable(getdata, status) {
        //  alert(getdata);
        var data = new Object();
        getdata = getdata.split("[");
        for (var i = 0; i < getdata.length; i++) {
            var a = $.trim(getdata[i]).split("=>");
            var v = a[0].replace("]", "");
            data[$.trim(v)] = $.trim(a[1]);
        }
        if ($(".tabelRes table tbody").length)
        {
            var html = "<tr>\n\
    <td>" + data['Mumin_id'] + "</td>\n\
<td>" + data['FullName'] + "</td>\n\
<td><input class='button removeTabelRes' value='remove'  data-id='" + data['Mumin_id'] + "'  type='button' /></td></tr>";


            $(".tabelRes table tbody").append(html);

            if (status !== "open") {
                $(".Mumin_ids").val($(".Mumin_ids").val() + "," + data['Mumin_id']);
            }

        } else {


            var html = "<table class='mainTabel'>\n\
                                                <thead><tr><th>ITS ID</th><th>Name</th></tr></thead>\n\
                                                <tbody><tr><td>" + data['Mumin_id'] + "</td><td>" + data['FullName'] + "</td><td><input class='button removeTabelRes' value='remove' data-id='" + data['Mumin_id'] + "'  type='button' /></td></tr>\n\
                                                        </tbody></table>";







            if (status !== "open") {
                $(".Mumin_ids").val(data['Mumin_id']);
            }
            $(".tabelRes").html(html);

        }



    }




    /*
     $(document).on("click",".addMoreBT",function(){
     
     alert ("sdfsdf")
     return false;
     
     
     })*/


});

$(function() {


    $(".wnext").click(function() {


        if ($("form").doesExist()) {
            $("form").submit();
            return false;
        }
    })

});
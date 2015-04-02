




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


    $(document).on("click", ".addMoreBT", function() {

        var me = $(this);


        getAjax("res/chekej", "ej=" + me.parent().find(".its_id").val(), function(f) {

            if ($.trim(f) !== "0") {



                updateResTable($.trim(f));

            } else {

                alert("Authentication error: The ITS ID and date of birth do not match. Please check if the ITS ID or date of birth is correct");

            }



        })




    })


    $(document).on("click", ".removeTabelRes", function() {


        var t = $(this);
        var mep = $(this).parent("td").parent("tr");
        mep.fadeOut(1000, function() {
            mep.remove();


            var id = t.data('id');

            var res = $(".Mumin_ids").val().replace("," + id, "");

            res = res.replace(id, "");





            $(".Mumin_ids").val(res);




        });

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


            $(".tabelRes table tbody").append(html).hide().fadeIn(1000);

            if (status !== "open") {
                $(".Mumin_ids").val($(".Mumin_ids").val() + "," + data['Mumin_id']);
            }

        } else {


            var html = "<table class='mainTabel'><thead><tr><th>ITS ID</th><th>Name</th></tr></thead><tbody><tr><td>" + data['Mumin_id'] + "</td><td>" + data['FullName'] + "</td><td><input class='button removeTabelRes' value='remove' data-id='" + data['Mumin_id'] + "'  type='button' /></td></tr></tbody></table>";
            if (status !== "open") {
                $(".Mumin_ids").val(data['Mumin_id']);
            }
            $(".tabelRes").html(html).hide().fadeIn(1000);

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
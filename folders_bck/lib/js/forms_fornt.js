/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */





$(function() {




    $("input:data(min)").each(function() {


        var min = $(this).data("min");

        $(this).focusout(function() {
            var val = $(this).val();
            if (parseFloat(val) < parseFloat(min)) {
               
                $(this).val(min);

            }
        });

    });
    /*
     $("input").each(function() {
     
     var obj=$(this);
     if (obj.date("min")) {
     
     
     }
     
     
     
     
     if (obj.hasData("min")) {
     alert (obj.data("min"));
     
     var min = $(this).data("min");
     alert(min);
     $(this).focusout(function() {
     
     var val = $(this).val();
     if (parseFloat(val) < parseFloat(min)) {
     
     $(this).val(min);
     
     }
     
     })
     
     
     }
     
     
     
     
     }) */
})
function time_input_s() {

    $(function() {

        $(".time_input select").change(function() {



            $(this).parent().find(".time_input_data").val(
                    $(this).parent().find(".data_h").val() + ":" +
                    $(this).parent().find(".data_m").val());
        })


    })

}


function egphone_input_s() {

    $(function() {

        $(".egphone_input input").change(function() {



            $(this).parent().find(".egphone_input_data").val(
                    $(this).parent().find(".phone_perf").val() +
                    $(this).parent().find(".phone_num").val());
        })


    })

}

var msg = "This field is required!";
var vmsg = "Some fields have been entered incorrectly. Please check.";
function validateEmail(email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test(email)) {
        return false;
    } else {
        return true;
    }
}


function chreq(th) {
    var returnData = true;
    var ra = true;
//form_row txt rowfeild phone phone required    validate[custom[phone]]

    $(" input.required").each(function() {

        var myval = $(this).val();
        if ($.trim(myval) == "" || $.trim(myval) == msg) {
            $(this).addClass("required-empty");
            $(this).val(msg);
            returnData = false;
        } else {

            $(this).removeClass("required-empty");
        }
    });
    $(th + " input.phone").each(function() {


        var myval = $(this).val();
        //alert ($.isNumeric(myval));
        if (!$.isNumeric(myval) || $.trim(myval) == "" || $.trim(myval) == msg) {

            //$(this).val(msg);
            if ($.trim(myval) == "" || $.trim(myval) == msg) {
                $(this).val(msg);
                $(this).addClass("required-empty");
            } else {
                $(this).addClass("required-valid");
                ra = false;
            }


            returnData = false;
        } else {
            $(this).removeClass("required-valid");
            $(this).removeClass("required-empty");
        }
    })


    $(th + " input.email").each(function() {

        var myval = $(this).val();
        if (!validateEmail(myval) || $.trim(myval) == "" || $.trim(myval) == msg) {









            if ($.trim(myval) == "" || $.trim(myval) == msg) {
                $(this).addClass("required-empty");
                $(this).val(msg);
            } else {
                $(this).addClass("required-valid");
                ra = false;
            }

            returnData = false;
        } else {
            $(this).removeClass("required-valid");
            $(this).removeClass("required-empty");
        }

    })

    if (ra == false) {
        alert(vmsg);
    }



    return returnData;
}


$(function() {

    /*
     $("input.required").parent().parent().children(".field-label").append('<span class="space" >*</span>');
     
     
     
     
     $("input.required").focus(function() {
     
     
     var myval = $(this).val();
     if ($.trim(myval) == msg) {
     $(this).removeClass("required-empty");
     $(this).val("");
     }
     });
     
     
     $("input.required").click(function() {
     var myval = $(this).val();
     if ($.trim(myval) == msg) {
     $(this).removeClass("required-empty");
     $(this).val("");
     }
     });
     
     
     $("form").submit(function() {
     
     
     var id = $(this).attr("id");
     
     
     if (chreq("#" + id) == true) {
     // $(this).submit(); 
     return true;
     } else {
     return false;
     }
     
     //
     
     });
     
     
     */
})





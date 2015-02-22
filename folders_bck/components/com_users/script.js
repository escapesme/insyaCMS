/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */








function getuserData(status, to) {

    getAjax("coms/users/usersUpdataData", "settings_id=" + $(".settings_id").val() + "&status=" + status, to);

}
function datausers() {
    $(function() {



    })

}


function passwordrepet() {





}


function checkPassword() {




}

$(function() {


    $(".message .msg").hide("slow");
    $(".usersreg .send.submit").click(function() {
        var my = $(this);

        var p = $(this).parent().parent();



        $(".message .msg").hide("slow");
        ifExistingInDB("com_users", "user_name", p.find(".name").val(), function(data) {



            if ($.trim(data) == "1") {

                $(".message .msg.username").show("slow");

                return false;

            } else if (p.find("input.password").val() !== p.find(".repassword").val()) {




                $(".message .msg.reppassword").show("slow");
                return false;
            } else {
               

                my.closest("form").submit();

                return true;
              
            }


        });
        return false;

    });
});



function getData(type) {

    //  sendAjax("coms/users", "status=" + type, ".Datachange");


}


function updateData() {
    getuserData("getData", function(data) {

        $(".userinData").html(data);

    });


}


$(function() {

    updateData();
    $(".userToolsBar .editpassword").click(function() {


        getuserData("getUpdatepassword", function(data)
        {
            $(".Datachange").show();
            $(".Datachange").html(data);
            $(".checkOldPassword").click(function() {



                getAjax("coms/users/usersUpdataData", "status=chkpassword&password=" + $(".oldpassword").val(), function(data) {
                    $(".Datachange").html(data);

                    $(".updatePassword").click(function() {


                        var link = "";
                        $(".updateData input").each(function() {
                            link += "&" + $(this).attr("id") + "=" + $(this).val();
                        });



                        if ($("input.password").val() != $(".rpassword").val()) {

                            $(".message .msg.reppassword").show("slow");
                        } else {


                            getAjax("coms/users/usersUpdataData", "status=savepassword&" + link, function(data) {


                                $(".Datachange").html(data);
                                updateData();




                            });

                        }
                    });
                });




            });
        });

    });

    $(".userToolsBar .editdata").click(function() {


        getuserData("getUpdateData", function(data)
        {
            $(".Datachange").show();
            $(".Datachange").html(data);
            $(".submitUpdateData").click(function() {
                var link = "";
                $(".updateData input").each(function() {
                    link += "&" + $(this).attr("id") + "=" + $(this).val();
                });
                getAjax("coms/users/usersUpdataData", "status=saveData&" + link, function(data) {
                    $(".Datachange").html(data);
                    updateData();
                });
            });
        });
    });
    //  getData("dataedit");

    $(".req_Form").submit(function() {

        var valP = $("#password").val();
        var valrP = $("#rpassword").val();
        if (valP == "" || valrP != valP) {


            $("#password").focus();
            return false;
        }


    })

})


/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */








function getuserData(status, to) {

    getAjax("coms/users/usersUpdataData", "settings_id=" + $(".settings_id").val() + "&status=" + status, to);

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
function updateHtmlData(getData) {
    getuserData(getData, function(data) {

        $(".userinData").html(data);

    });


}


$(function() {












    updateData();


        


    $(document).on("click", ".forgotpassword_send", function() {
        
        
  
        
        getAjax("coms/users/forgotpassword",  "settings_id=" + $(".settings_id").val() +"&email=" +  $("input.forgotpassword_email").val(), function(data){
            $(data).show();
            
            
            
            
            
        });
        
    })

    $(document).on("click", ".updatePassword", function() {




        var link = "";
        $(".updateData input").each(function() {
            link += "&" + $(this).attr("id") + "=" + $(this).val();
        });



        if ($("input.password").val() != $(".rpassword").val()) {

            $(".notmatchMsg").show("slow");




        } else {


            getAjax("coms/users/usersUpdataData", "status=savepassword&" + link, function(data1) {







                getuserData("getUpdatepassword", function(data)
                {
                    $(".Datachangep").show();
                    $(".Datachangep").html(data1 + data);

                });


            });

        }
    });









    $(document).on("click", ".checkOldPassword", function() {


        getAjax("coms/users/usersUpdataData", "status=chkpassword&password=" + $(".oldpassword").val(), function(data) {
            $(".Datachangep").html(data);


        });




    });





    $(".userToolsBar .editpassword").click(function() {


        getuserData("getUpdatepassword", function(data)
        {
            $(".Datachangep").show();
            $(".Datachangep").html(data);

        });

    });



    $(document).on("click", ".submitUpdateData", function() {

        var link = "";
        $(".updateData input").each(function() {
            link += "&" + $(this).attr("id") + "=" + $(this).val();
        });
        getAjax("coms/users/usersUpdataData", "status=saveData&" + link, function(data1) {



            getuserData("getUpdateData", function(data)
            {


                $(".Datachange").show();
                $(".Datachange").html(data1 + data);
            });
        });
    });



    $(".userToolsBar .editdata").click(function() {
        getuserData("getUpdateData", function(data)
        {
            $(".Datachange").show();
            $(".Datachange").html(data);
        });
    });


    $(".req_Form").submit(function() {

        var valP = $("#password").val();
        var valrP = $("#rpassword").val();
        if (valP == "" || valrP != valP) {


            $("#password").focus();
            return false;
        }


    })

})


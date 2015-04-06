<%-- 
    Document   : index
    Created on : Dec 13, 2012, 1:51:03 PM
    Author     : ismeil
--%>

<div class='myData'>

    <div class='DataRow'> <div Class='myLabel'>Enter Current Password</div>
        <input  type="password"       class="input oldPass"/>
        <input value='Check' class="button" type="button" />
        <div class=' inputmsg oldPassmsg'></div></div>
    <div class='line'></div>
    <div class='UpdateData'></div>
    <div class='line'></div>
</div>
<style>       
    .myData{
        margin: 6%;   }

    .DataRow{

        float: left;
        margin: 20px; 




    }

    .input{
        float:left;
    }
    .inputmsg,.newPassmsg{


        float: left;
        line-height: 20px;
        padding: 5px;

    }
</style>
<script>

    function createLodyiong() {

        $("body").append("<div class='lodyiong'></div>");


    }


    function removeLodyiong() {

        $(".lodyiong").remove();


    }


    $('.newPassrep ,.savePassrep').removeAttr('disabled');





    $(function() {




        $(".oldPass").focusout(function() {
            createLodyiong();
            $.get("modules/mod_updatePassword/updateform.jsp?password=" + $(".oldPass").val(), function(Data) {

                removeLodyiong();
                $(".UpdateData").html("");
                $(".oldPassmsg").html("");
                $(".oldPassmsg").removeClass("success");


                var Datas = Data.split("--");

                if ($.trim(Datas[0]) == "error") {


                    $(".oldPassmsg").html(Datas[1]);

                } else {
                    $(".UpdateData").html(Datas[1]);

                    $(".oldPassmsg").addClass("success");
                }



                $(".newPass").focusout(function() {
                    $(".newPassmsg").removeClass("success");
                    $(".newPassmsg").html("");


                    createLodyiong();
                    $.get("modules/mod_updatePassword/updateform.jsp?status=chkuser&password=" + $(".newPass").val(), function(Data5) {

                        removeLodyiong();
                        $(".newPassmsg").removeClass("success");
                        $(".newPassmsg").html("");

                        if ($.trim(Data5) == "success") {

                            $('.newPassrep ,.savePassrep').removeAttr('disabled');

                            $(".newPassmsg").addClass("success");
                        } else {
                            $('.newPassrep ,.savePassrep').attr('disabled', 'disabled');
                            // $(".UpdateData2").html(Data5);
                            $(".newPassmsg").html(Data5);


                        }

                    })

                    $(".savePassrep").click(function() {

                        if ($(".newPass").val() == $(".newPassrep").val()) {
                            createLodyiong();


                            $.get("modules/mod_updatePassword/updateform.jsp?status=UpdatePass&password=" + $(".newPass").val(), function(Data3) {
                                removeLodyiong();
                                alert(Data3);

                                $(".lightBoxBG").hide("slow");
                            })
                        } else {

                            alert("New passwords do not match. Please re-enter new password!");


                        }

                    })




                })

            })

        })
    })


</script>
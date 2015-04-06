

<script>

    $(function() {





        $(".view_crest_do_name.newpass").focusout(function() {
            $(".newPassmsg").removeClass("success");
            $(".newPassmsg").html("");



            $.get("modules/mod_updatePassword/updateform.jsp?status=chkuser&password=" + $(".view_crest_do_name.newpass").val(), function(Data5) {
                $(".newPassmsg").removeClass("success");
                $(".newPassmsg").html("");

                if ($.trim(Data5) == "success") {
                    $('.view_crest_do_name.rnewpass').removeAttr('disabled');
                    $('.Changepass').removeAttr('disabled');
                    $(".newPassmsg").addClass("success");
                } else {
                    $('.view_crest_do_name.rnewpass').attr('disabled', 'disabled');
                    $('.Changepass').attr('disabled', 'disabled');
                    $(".newPassmsg").html(Data5);
                }

            });


        });


        $(".chaeckpass").click(function() {
            var pss = $(".oldpass").val();



            $.get("ajax/admin/passwordChange.jsp?oldpass=" + pss, function(rdata) {

                var r = $.trim(rdata);


                if (r == "true") {
                    $(".oldnew").show("slow");
                    $(".chaeckpass").hide("slow");

                    $(".changpass").parent(".mxWindowPane").css("height", "175px");

                } else {
                    $(".changpass").parent(".mxWindowPane").css("height", "105px");
                    alert("The password entered is incorrect.");

                }



            })

        })

        $(".Changepass").click(function() {
            var pss = $(".newpass").val();
            var pssr = $(".rnewpass").val();

            if (pssr != pss) {

                alert("This password doesn't match the confirmation password.");
            } else {



                $.get("ajax/admin/passwordChange.jsp?newpass=" + pss, function(rdata) {

                    alert("Attention: Your session is being logged out. Please login with your new password.");

                    window.location = "?alias=xact&status=logout"

                })

            }
        })

    })

</script>



<div class="frm_row oldpassword">
    <div class="frm_row do_left">
        <div class="frm_label">Old password</div>
        <div class="frm_input"><input class="view_crest_do_name oldpass"  name="oldpass"   type="password" value=""></div>
    </div>
    <div  style="width: 20%;"   class="frm_row do_right">    <input type="button" class="chaeckpass"  value="Check"/></div>
</div>


<div class="oldnew" >
    <div class="frm_row do_left">
        <div class="frm_label">New password</div>
        <div class="frm_input"><input class="view_crest_do_name newpass input" name="newpass"   type="password" value=""><div class='newPassmsg inputmsg'></div></div>
    </div>
    <div class="frm_row do_left"> 
        <div class="frm_label">Retype New password</div>
        <div class="frm_input"><input class="view_crest_do_name rnewpass input" disabled name="rnewpass" type="password" type="text" value=""></div>
    </div>
    <div style="width: 20%;" class="frm_row do_right">  
        <input type="button" disabled class="Changepass"  value="Change"/>
    </div>

</div> 







<style>
    .oldnew {
        display: none;   
    }
</style>
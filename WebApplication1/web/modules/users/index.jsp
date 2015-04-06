<%@taglib uri="/WEB-INF/tlds/tagslib" prefix="l"%>
<%

    lib.engine.front.properties pro = new lib.engine.front.properties(request);


    xact.users.users us = new xact.users.users();
%>
<div class="ver"> Version : <%=lib.Options.MyVariables.relesVersion%></div>
<div class="rbuild"> Release Build ${releaseManager.formattedDate}</div>
<div class="loginTile"></div>
<div class="logindes"></div>
<%
    out.print("<div class=\"message\">" + us.userLogin(request) + "</div>");
    if (us.userReturn(request, "username").equals("")) {
%>




<div id="dta" title="login">
    <l:forms type="form" name="login" action="" method="post" />
    <l:forms type="text" title="Username" name="username"/>
    <l:forms type="password" title="Password" name="password"/>
    <l:forms type="submit" value="" title="" name="Login"/>
    <l:forms type="end form" name="" />

    <a class='forgotPasswordlink' href="#">Forgot Password</a>
</div>



<!--[if lt IE 9]>
  <div class="iebar_text"> Your internet browser is not supported. Kindly upgrade your browser. </div>
  <![endif]-->

<%} else {
%>

<%
        if (!pro.getProperties("a_login").equals("")) {

            out.print("<meta http-equiv=\"refresh\" content=\"0;url=" + pro.getProperties("a_login") + "\">");
        }

    }

%>


<script>

    $(function() {

        $(".forgotPasswordlink").click(function() {

            makeWinDows("Forgot Password", "forgotPassword", forgotPassword(), 450, 150, 400, 100);

        });

    });


</script>

<style>
    .forgotPasswordlink {
        clear: both;
        display: block;
        font-size: 11px;
        margin-left: 18px;
    }

    .iebar_text{
        background: #FFBD69;
        color:#cc0000;
        width: 80%;
        font-size: 10pt;
        margin: auto
            ;padding: 3px;


    }
    .message{

        color:#888;
        font-size:9pt;
        margin-top:10px


    }.failedmsg{
        color:red;


    }

    .rbuild{
        color: #888;
        position: absolute;
        z-index: 1000;
        top: 270px;
        right: 77px;
        font-size: 5pt;
    }



</style>

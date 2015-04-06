    
<div> 



    <%
        xact.users.users us = new xact.users.users();
        us.useradminLogin(request);
        
        if (session.getAttribute("user_admin_id") != null) {
            out.print("<meta http-equiv=\"refresh\" content=\"0;url=admin.jsp\">");
   
       } else {

    %>



</div>

<div class="div_all">
    <form action="" method="post">
        <div class="from_row"><label></label><input type="text" name="username" value=""  /></div>
        <div class="from_row"><label></label><input type="password" name="password" value=""  /></div>
        <div class="from_row"><input type="submit" value="send" /><input type="reset" value="reset" /></div>
    </form>

</div> 

<%    }

%>


<style>

    .div_all{

        width:300px;
        background: #eee;
        border:5px #ccc  solid
            ;
        position: fixed;
        margin:  auto;
        left:40%;
        top:40%;

    }

    
    .fsdf{
        
    }
</style>
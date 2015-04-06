<%-- 
    Document   : debugBody
    Created on : Feb 25, 2012, 1:47:30 PM
    Author     : ismail
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        <h2>Type:<%= request.getParameter("type") %></h2>
        
        
<%




    out.print( lib.tools.test.getMessages(request.getParameter("type"), request));
%>


<div class="data"></div>
<style>

    .msgids,.msgtitle {
        border:1px #eee solid;
        margin: 5px;
        width: 40%;
        float:left;
    }

    .msgAll{
        clear:both;
        border:1px #888 solid;
        margin: 5px;
          border-bottom: 2px #888 solid;

    }

    .msgbody{
        clear:both;
        width:100%;
        

    }

</style>
    </body>
</html>





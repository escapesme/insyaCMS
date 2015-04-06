<%-- 
    Document   : getTrajectoryTree
    Created on : Feb 13, 2013, 12:48:46 PM
    Author     : ismil
--%>
<%@page import="xact.utils"%>

<script>
    $(function(){
          $(".treein").treeview({
        collapsed: true,
        animated: "fast",
   

    });
        
        
    })
</script>
<%
    
    
    utils u = new utils();
    out.print(u.getTrajectoryTree(request.getParameter("mod_id"),request.getParameter("sid")));
%>
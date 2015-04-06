<%  if (session.getAttribute("user_admin_id") != null) {%>
<%@taglib uri="/WEB-INF/tlds/engine" prefix="engine"%>
<engine:adminStructure /> 

<% } else {
        out.print("<meta http-equiv=\"refresh\" content=\"0;url=admin_in.jsp\">");


    }%>


    
    
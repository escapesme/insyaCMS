<%
    /*
     HttpSession session = request.getSession(true);
    
     */
    
    
    xact.users.users us = new xact.users.users();
    if (session.getAttribute("user_id") != null) {
        out.print("1");
    } else {
        out.print("0");
    }


%>
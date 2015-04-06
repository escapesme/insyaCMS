<%
    String type = request.getParameter("type");
    String data = request.getParameter("data");
    HttpSession s = request.getSession(true);
    s.setAttribute(type, "");
    s.setAttribute(type, data);

%>
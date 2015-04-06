<%
    HttpSession s = request.getSession(true);
    String PastData = (String) s.getAttribute("copyData");
    String r = "0";
    if (PastData != null) {
r="0";
    }
    out.print(r);;
%>
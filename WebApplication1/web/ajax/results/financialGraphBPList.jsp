<%-- 
    Document   : financialGraphBPList
    Created on : Mar 24, 2013, 2:37:23 PM
    Author     : Ahmed
--%>

<%@page import="xact.results.FinancialView"%>
<%String[] res_id = request.getParameter("res_id").split("__");
            FinancialView fnew = new FinancialView();
            out.print(fnew.BPList(res_id[1],res_id[2]));
            %>

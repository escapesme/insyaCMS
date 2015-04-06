
<%
    xact.results.rmv em = new xact.results.rmv(request.getParameter("modid"), request.getParameter("sid"), request.getParameter("point"));
    String status = request.getParameter("status");

    if (status != null && status.equalsIgnoreCase("getparttion")) {
        em.openConnections();
        out.print(em.getParttion(request.getParameter("comps")));
        em.closeConnections();
        
        
        
        
        

    } else if (status != null && status.equalsIgnoreCase("getComps")) {
        em.openConnections();
        out.print(em.getCOMPLEX(request.getParameter("val")));
        em.closeConnections();
    } else if (status != null && status.equalsIgnoreCase("TotalCom")) {
        em.openConnections();
        out.print(em.getTotalCom(request.getParameter("type"), request.getParameter("id"), request.getParameter("part"), request.getParameter("mac")));
        em.closeConnections();
    } else if (status != null && status.equalsIgnoreCase("getACTabel")) {
%>
<table class="rmvbotton_left" >
    <thead class="th_header"><th>Name</th><th>Type</th><th>Throughput</th><th>Response time</th><th>Resource utilization</th><th>a1= Conflicts contentions</th><th>a2= Availability delays</th><th>a3= Database impact on server</th><th>a4= Incidental</th></thead>
        <%
                em.openConnections();
                out.print(em.createResourceTable(request.getParameter("id"), request.getParameter("mac"), request.getParameter("part"), request.getParameter("rc"), request.getParameter("type")) + " </table>");
               
                
                      // out.print(em.out);
                em.closeConnections();

            } else {
                em.openConnections();
                out.print(em.getNames(request.getParameter("modid"), request.getParameter("stype")));
                em.closeConnections();
            }


        %>


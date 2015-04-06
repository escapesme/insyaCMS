
<%
            lib.engine.front.front Front = new lib.engine.front.front();
            String[] returnData = Front.getThisModules(request, response, request.getParameter("module"));
            for (int x = 1; x < returnData.length; x++) {
                String m_link = "/" + returnData[x];
                
              
                pageContext.include(m_link);
                  // out.print(m_link);
               
            }

%>
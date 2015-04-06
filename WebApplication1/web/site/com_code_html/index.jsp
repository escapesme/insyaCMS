
 
<%
lib.engine.propertiesCom proll = new lib.engine.propertiesCom(request);
lib.engine.db.operations prdb = new lib.engine.db.operations();

String [] ret=prdb.getRow("COM_CODE_HTML","id="+proll.getProperties("htmlid"));

out.print("<div class=\"pgtitle\">"+ret[0]+"</div>");

out.print("<div class=\"pgbody\">"+ret[2]+"</div>");
        
        %>









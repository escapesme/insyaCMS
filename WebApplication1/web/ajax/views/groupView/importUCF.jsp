<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.stream.events.XMLEvent"%>
<%@page import="javax.xml.stream.XMLInputFactory"%>
<%@page import="javax.xml.stream.XMLStreamReader"%>
<%@page import="java.net.PasswordAuthentication"%>
<%@page import="java.net.Authenticator"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>

<%@ page import="javax.xml.parsers.*,org.w3c.dom.*" %>
<%
    String doout = "<tr ><td   style='text-align: center' colspan='3'>No jobs found for the date selected</td></tr>";
    String nodid = request.getParameter("nodeid");
    String XmlPath = "https://acruser:Acr14Tek4@acrtek-lab.com/xact-ucf-web-1.0-SNAPSHOT/api/resourceJobs/";
    try {

        try {

            if (request.getParameter("startTime") != null) {

                DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
                Date date = format.parse(request.getParameter("startTime"));

                long sd = date.getTime();

                SimpleDateFormat dt1 = new SimpleDateFormat("dd-MM-YYYY");

                String sDate = dt1.format(date);

                XmlPath += "?startTime=" + sd;

            } else {

            }
        } catch (Exception e) {

        }
%> 


<%
        Authenticator.setDefault(new MyAuthenticator("acruser", "Acr14Tek4"));
        URL url = new URL(XmlPath);
        XMLInputFactory factory = XMLInputFactory.newFactory();

        XMLStreamReader streamReader = factory.createXMLStreamReader(url.openStream());

        int i = 0;
        String myidentifier = "";
        String id = "";
        while (streamReader.hasNext()) {

            int event = streamReader.next();

            if (event == XMLEvent.START_ELEMENT) {

                String name = streamReader.getName().getLocalPart();

                if ("resourceJob".equals(name)) {
                    ;
                   id=streamReader.getAttributeValue(0);

                }
                if ("server".equals(name)) {
                  //  id = streamReader.getAttributeValue(0);
                }

                if ("identifier".equals(name)) {
                    streamReader.next();
                    myidentifier = streamReader.getText();

                }

                if ("startTime".equals(name)) {
                    streamReader.next();
                    String string = streamReader.getText();
                    //  String string = "2014-12-30T13:37:00-06:00";
                    String[] d = string.split("T");

                    DateFormat format = new SimpleDateFormat("yyyyy-mm-dd", Locale.ENGLISH);
                    Date date = format.parse(d[0]);

                    SimpleDateFormat dt1 = new SimpleDateFormat("dd-E-YYYY");

                    String sDate = dt1.format(date);
                    i++;

                    if (i == 1) {

                        doout = "";

                    }
                    doout += "<tr><td>" + i + "</td><td>" + sDate + "</td>";

                    doout += "<td>" + myidentifier + "</td>";

                    doout += "<td><button data-nodeid='" + nodid + "' data-id='" + id + "' class='im' >import</button></td>";

                    doout += "</tr>";

                }

            }

        }

    } catch (Exception e) {

        String g = e.getMessage();
        out.print("Error:" + g);
    }

    out.print(doout);
%>



<%!
    static class MyAuthenticator extends Authenticator {

        private String username, password;

        public MyAuthenticator(String user, String pass) {
            username = user;
            password = pass;
        }

        protected PasswordAuthentication getPasswordAuthentication() {
            System.out.println("Requesting Host  : " + getRequestingHost());
            System.out.println("Requesting Port  : " + getRequestingPort());
            System.out.println("Requesting Prompt : " + getRequestingPrompt());
            System.out.println("Requesting Protocol: " + getRequestingProtocol());
            System.out.println("Requesting Scheme : " + getRequestingScheme());
            System.out.println("Requesting Site  : " + getRequestingSite());
            return new PasswordAuthentication(username, password.toCharArray());
        }
    }
    Document doc;

    String getXMLValue(String name) {
        NodeList nlist = doc.getElementsByTagName(name);
        String value = nlist.item(0).getFirstChild().getNodeValue();
        return value;
    }
%>
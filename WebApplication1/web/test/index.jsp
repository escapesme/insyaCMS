<%@page import="org.apache.http.impl.auth.BasicScheme"%>
<%@page import="org.apache.http.auth.UsernamePasswordCredentials"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Map"%>


<%@page import="java.net.URLConnection"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="javax.xml.stream.events.XMLEvent"%>
<%@page import="javax.xml.stream.XMLInputFactory"%>
<%@page import="javax.xml.stream.XMLStreamReader"%>
<%@page import="java.net.PasswordAuthentication"%>
<%@page import="java.net.Authenticator"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>


<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>


<%@page import="org.apache.http.entity.ContentType"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.entity.StringEntity"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>

<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="org.json.JSONObject"%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>


<%@page import="org.json.simple.parser.ParseException"%>


<%@ page import="javax.xml.parsers.*,org.w3c.dom.*" %>






<%


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

    public String makeHTTPPOSTRequest(String apiURL, String data) throws IOException, ParseException, JSONException {
        String m = "";

        HttpClient c = new DefaultHttpClient();
        HttpPost p = new HttpPost(apiURL);

        UsernamePasswordCredentials creds = new UsernamePasswordCredentials(
                "acruser", "Acr14Tek4");
        p.addHeader(BasicScheme.authenticate(creds, "US-ASCII", false));

        p.setEntity(new StringEntity(data, ContentType.create("application/json")));

        HttpResponse r = c.execute(p);

        BufferedReader rd = new BufferedReader(new InputStreamReader(r.getEntity().getContent()));
        String line = "";
        while ((line = rd.readLine()) != null) {
            //Parse our JSON response               
      /*      JSONParser j = new JSONParser();
             JSONObject o = (JSONObject) j.parse(line);
             Map response = (Map) o.get("response");
             */
            m += "" + line;
        }
        return m;
    }


%>
<%    //String appPath = XmlPath;
    Authenticator.setDefault(new MyAuthenticator("acruser", "Acr14Tek4"));
    //  URL url = new URL(XmlPath);

    
    
    

%>

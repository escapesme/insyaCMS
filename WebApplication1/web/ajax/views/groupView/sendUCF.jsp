
<%@page import="org.apache.http.entity.StringEntity"%>
<%@page import="org.apache.http.entity.ContentType"%>
<%@page import="org.apache.http.impl.auth.BasicScheme"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="org.apache.http.auth.UsernamePasswordCredentials"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%!
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

<%

    String nodeid = request.getParameter("nodeid");
    String jopID = request.getParameter("jopid");

    String XmlPath = "https://acrtek-lab.com/xact-bridge-web-1.0-SNAPSHOT/api/bridge/";
    String data = "{ \"node\": {  \"id\": \"" + nodeid + "\" }, \"job\": { \"id\": \"" + jopID + "\" } }";

    out.print(makeHTTPPOSTRequest(XmlPath, data));

%>
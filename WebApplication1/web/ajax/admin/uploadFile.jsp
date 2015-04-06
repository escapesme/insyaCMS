<%@page import="lib.tools.Utils"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


<%


    ServletContext context = pageContext.getServletContext();



    // String filename = request.getHeader("X-File-Name");

    String urlfilePath = request.getParameter("filePath");


    String filename = request.getParameter("name").trim();

    filename += ".jpg";

    if (request.getParameter("type") != null && request.getParameter("type").equals("crop")) {


        urlfilePath = Utils.getImageFolder() + request.getParameter("filePath").trim();

    }

    // out.print("<br>"+urlfilePath+"<br>");


    String filePath = application.getRealPath(urlfilePath).trim() + "/";



    InputStream is = null;
    FileOutputStream fos = null;





    try {
        is = request.getInputStream();


        String edndFile = Utils.getImageFolder() + "/reporting/";
        out.print(edndFile);

        File newfolder = new File(edndFile, request.getParameter("filePath").trim());
        if (!newfolder.isDirectory()) {

            newfolder.mkdir();
        }







        fos = new FileOutputStream(new File(edndFile + "/" + request.getParameter("filePath").trim() + "/" + filename.trim()));
        IOUtils.copy(is, fos);
        response.setStatus(response.SC_OK);
        out.print("{success: true}");

    } catch (FileNotFoundException ex) {
        response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
        out.print("{success: false}");
        out.print(ex.getMessage());
    } catch (IOException ex) {
        response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
        out.print("{success: false}");
        out.print(ex.getMessage());
    } finally {
        try {
            if (fos != null) {
                fos.close();
            }
            if (is != null) {
                is.close();
            }
        } catch (Exception ignored) {
            out.print("Error happened");
        }
    }

    out.flush();
    out.close();













%>

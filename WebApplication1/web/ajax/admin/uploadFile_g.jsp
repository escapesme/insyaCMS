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
    String separator = System.getProperty("file.separator");

    // String filename = request.getHeader("X-File-Name");
    String urlfilePath = request.getParameter("filePath").trim();
    
    String filename = request.getParameter("qqfile");
    String nodeFileName = filename.substring(0, filename.lastIndexOf("."));
    String extension = filename.substring(filename.lastIndexOf("."));
    if (Utils.mdlFileExists(nodeFileName)) {
        filename = nodeFileName + "_bac" + extension;
    }
    
    filename = Utils.getLegalFileName(filename);
    String filePath = urlfilePath;
    
    InputStream is = null;
    FileOutputStream fos = null;
    
    try {
        
        is = request.getInputStream();
        fos = new FileOutputStream(new File(filePath + separator + filename));
        IOUtils.copy(is, fos);
        response.setStatus(response.SC_OK);
        out.print("{success: true} to " + filePath + separator + filename);
        
    } catch (FileNotFoundException ex) {
        response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
        out.print("{success: false}");
        out.print("file errror" + ex.getMessage());
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
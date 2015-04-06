<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="lib.tools.Utils"%>
<%@page import="xact.MDLOperations"%>
<%
    xact.users.users us = new xact.users.users();
    lib.engine.db.operations db = new lib.engine.db.operations();
    String status = request.getParameter("status");
    String model = request.getParameter("model");
    String modelName = Utils.getModName(model);
    if (status.equalsIgnoreCase("export")) {
        String fName = Utils.getLegalFileName(modelName) + ".xml";
        String fx = MDLOperations.exportModel(fName, model);
        
        RequestDispatcher ds = request.getRequestDispatcher("/files/downloadFile.jsp?file=" + fName);
        ds.forward(request, response);
        out.append(fName);
    } else if (status.equalsIgnoreCase("upload")) {
        String urlfilePath = request.getParameter("filePath").trim();
        
        String filename = request.getParameter("name");
        
        String filePath = urlfilePath;
        InputStream is = null;
        FileOutputStream fos = null;
        filename=Utils.getLegalFileName(filename);
        out.print(filePath+"::"+filename);
        //
        try {
            is = request.getInputStream();
            fos = new FileOutputStream(new File(filePath + "/" + filename));
            
            IOUtils.copy(is, fos);
            response.setStatus(response.SC_OK);
            
            File f = new File(filePath + "/" + filename);
            
            out.print("{success: true}");
            
        } catch (FileNotFoundException ex) {
            response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
            out.print("{success: false}");
            out.print(filePath + filename);
            out.print("file errror" + ex.getMessage());
        } catch (IOException ex) {
            response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
            out.print("{success: false}");
            out.print(filePath + filename);
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
        
    } else if (status.equalsIgnoreCase("import")) {
        
        String urlfilePath = request.getParameter("filePath").trim();
        
        String filename = request.getParameter("name");
        
        String filePath = urlfilePath;
        out.print(filePath + "/" + filename);
        String mid = MDLOperations.importModel(filePath + "/" + filename, us.userReturn(request, "username"));
        String[][] data2 = {{"pid", "mid"}, {request.getParameter("pid"), mid}};
        
        out.print(db.setInsert(XMLDataModel.PMXREF_TABLENAME, data2));
        out.print("Model:" + mid + " Imported Successfully");
        
    }
    
%>

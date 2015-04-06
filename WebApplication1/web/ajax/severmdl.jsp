<%@page import="lib.tools.Utils"%>
<%@page import="java.io.File"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="xact.MDLOperations"%>
<%
    String status = (String) request.getParameter("status");
    String MODEL_ID = (String) request.getParameter("MODEL_ID");
    String nodeId = (String) request.getParameter("id");
    
    lib.engine.db.operations db = new lib.engine.db.operations();

    if (status.equalsIgnoreCase("ExportMDL")) {
        String proId = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + MODEL_ID)[1];
        String fName = MDLOperations.buildFromDB(proId, MODEL_ID, nodeId);

        out.print(proId);
        out.print("<br/>");
        out.print(nodeId);

        RequestDispatcher ds = request.getRequestDispatcher("/files/downloadFile.jsp?file=" + fName);
        ds.forward(request, response);

    } else {

        String originalNodeFileName = (String) request.getParameter("fileName");
        out.print(originalNodeFileName);
        String nodeFileName=originalNodeFileName.substring(0, originalNodeFileName.lastIndexOf("."));
        String extesnion=originalNodeFileName.substring(originalNodeFileName.lastIndexOf("."));
        out.print(nodeFileName+";;;"+extesnion);

        int servers = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + nodeId);
if(Utils.mdlFileExists(nodeFileName)){
        nodeFileName=nodeFileName+"_bac";
    }
        String proId = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + MODEL_ID)[1];
        String[][] data2 = {
            { "MODEL_FILENAME"},
            { nodeFileName}
        };


        out.print(db.setUpdate(XMLDataModel.NODE_TABLENAME, data2, "ID=" + nodeId));
        MDLOperations mdlo = new MDLOperations();
        if (servers >= 1) {
            for (int i = 0; i < servers; i++) {

                mdlo.removeServer(proId, MODEL_ID, nodeId);
            }
        }

    //    out.print(proId + ":" + MODEL_ID + ":" + nodeId + ":" + MODEL_FILENAME);
        out.print(mdlo.importMDL(proId, MODEL_ID, nodeId, nodeFileName.trim()));
        File f=new File(Utils.getModelFolderWorking_directory()+"/"+nodeFileName+extesnion);
        System.out.print(f.getAbsolutePath());
        f.delete();
    }
%>
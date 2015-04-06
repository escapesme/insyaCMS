
<%@page import="xact.ServerNodeOperations"%>
<%@page import="lib.Options.DbInfo"%>
<%@page import="lib.tools.Utils"%>
<%@page import="org.directwebremoting.dwrp.ArrayOutboundVariable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Processor"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="cat.read.Catalog"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String Out = "";

    lib.engine.db.operations db = new lib.engine.db.operations();
    String noid = "";
    
    if(request.getParameter("server_id")!=null){
        ServerNodeOperations s=new ServerNodeOperations();
        noid=s.getConnectedStorageNode(request.getParameter("server_id"));
    }else{
        noid=request.getParameter("nod_id");
    }
    int rowCount = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID='" + noid + "'");
    String nodeName = "";

    String[] nodedata = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + noid);

    if (rowCount > 0) {

        Out += nodedata[1];
        
        
         

        String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);

        nodeName = nodedata[2];
         
        db.openCon();
        Out += "," + data[0];
        
        Out += "," + nodedata[5];

        ///////////////////////
        Catalog c = new Catalog(DbInfo.Host, "3306", lib.Options.DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);

        String catIndex = data[5];
        String constructorIndex = "0";
        String processorIndex ="0";

        c.ListCatalogs();
        c.setCatByOffset(Integer.parseInt(catIndex));
        Manufacturer manufacturer = new Manufacturer(c);
        manufacturer.ListManufacturers();
        manufacturer.setManufacturer(Integer.parseInt(constructorIndex));

        Processor uc = new Processor(c);
        ArrayList pList = uc.ListProcessors();
        try {

            uc.setProcessors(Integer.parseInt(processorIndex));
        } catch (IndexOutOfBoundsException ex) {
            //out.print("The selected processor model isn't available from this manufacturer. Please reselect the processor model");
        }
        String model = "";
        ArrayList list = uc.getData();
        ArrayList param = (ArrayList) list.get(1);

        try {

            model = (String) pList.get(Integer.parseInt(processorIndex));
        } catch (IndexOutOfBoundsException ex) {
            model = "The selected processor model isn't available from this manufacturer. Please reselect the processor model";
        }

        Out += "," + manufacturer.getManufacturerName();
        Out += "," + model;

        ResultSet lds=db.getData(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, "*", "server_inst_id="+data[0]);
        Out+=",";
        while(lds.next()){
            Out+=lds.getString("id")+"__"+lds.getString("NAME")+";";
        }
        
        db.closeCon();

    } else {

    }
    out.print(Out);

%>

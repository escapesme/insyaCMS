<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String nodeDatas = request.getParameter("nodeData");
    String id = request.getParameter("ids");
    String[] nodeData = nodeDatas.split(",");
    String[] ids = id.split(",");
    lib.engine.db.operations db = new lib.engine.db.operations();

    int num = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID='" + nodeData[0] + "'");
System.err.println("edit server number="+num);
    String sid = ids[2];

    String printData = "";

    if (num > 0) {

        String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID='" + nodeData[0] + "'");

        db.openCon();
        ResultSet servercData = db.getData(XMLDataModel.COMPLEX_INST_TABLENAME, "", " SERVER_INST_ID='" + serverData[0] + "'");

        printData += "<div class='mydata'>"
                + "<script>customizeServerActions('" + nodeData[0] + "','" + serverData[0] + "','" + id + "')</script>"
                + "<div class='subTitle'> Physical machine List</div><select class='comName' multiple='multiple'>";
        while (servercData.next()) {

            printData += "<option value='" + servercData.getString("ID") + "'>" + servercData.getString("NAME") + "</option>";

        }
        printData += "</select></div>"
                + "<div class=\"do_center\">";
  printData += "<input type='button' class='deleteComplex' value='Delete'>";
        printData += "<input type='button' class='editComplex' value='Edit'>";

        if (sid.equals("null")) {
            printData += "<input type='button' class='newComplex' value='New'>";

        }

        printData += "</div>";

        db.closeCon();

    } else {

        printData = "No MDL information found for this server";

    }
    out.print(printData);
%>
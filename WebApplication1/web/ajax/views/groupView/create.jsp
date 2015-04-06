 
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%

    String sataus = request.getParameter("sataus");

    lib.engine.db.operations db = new lib.engine.db.operations();

    if (sataus.equalsIgnoreCase("createGroup")) {

        String groupName = request.getParameter("groupName");
        String groupType = request.getParameter("groupType");
        String active = request.getParameter("active");
        String LOCATION_ID = request.getParameter("LOCATION_ID");

        String MODEL_ID = request.getParameter("MODEL_ID");

        String mid = Utils.getNewID();
        String PREFRENCE = "0";
        if (active == "1") {
            PREFRENCE = active;

        }

        String[][] data = {{"ID", "MODEL_ID", "LOCATION_ID", "NAME", "REFERENCE", "TYPE_ID"},
        {mid, MODEL_ID, LOCATION_ID, groupName, PREFRENCE, groupType}};

        out.print(db.setInsert(XMLDataModel.NET_GROUP_TABLENAME, data));

    } else if (sataus.equalsIgnoreCase("createType")) {

        String mid = Utils.getNewID();
        String TypeName = request.getParameter("TypeName");
        int count = db.getRowCount(XMLDataModel.GROUP_TYPE_TABLENAME, "NAME='" + TypeName + "'");

        if (count > 0) {
            out.print("Group type with the same name already exists. Please choose another name.");
        } else {

            String Description = request.getParameter("Description");

            String[][] data = {{"ID", "NAME", "DESCRIPTION"}, {mid, TypeName, Description}};
            out.print("Saved__" + mid);
            out.print(db.setInsert(XMLDataModel.GROUP_TYPE_TABLENAME, data));

        }

    }


%>                   
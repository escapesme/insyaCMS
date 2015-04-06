<%@page import="java.sql.ResultSet"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String Out = "";

    lib.engine.db.operations db = new lib.engine.db.operations();
    String noid = request.getParameter("id");

    String status = request.getParameter("status");

    if (status.equalsIgnoreCase("save_drive")) {

        String modid = request.getParameter("mod_id");
        String name = request.getParameter("name");

        String newId = Utils.getNewID();
        String[][] data = {{"ID", "Model_ID", "SERVER_INST_ID", "NAME"}, {newId, modid, noid, name}};

        out.print(db.setInsert(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, data));

    } else if (status.equalsIgnoreCase("getAvailableDisk")) {

        db.openCon();
        ResultSet diskSub = db.getData(XMLDataModel.LOGICAL_DISK_SUBSYSTEM_INST_TABLENAME, "*", "server_inst_id=" + noid);
        String driveId = request.getParameter("Datastore");

        while (diskSub.next()) {
            ResultSet diskString = db.getData(XMLDataModel.DISK_STRING_INST_TABLENAME, "*", "lds_id=" + diskSub.getString("ID"));
            while (diskString.next()) {

                ResultSet diskGroup = db.getData(XMLDataModel.DISK_GROUP_INST_TABLENAME, "*", "DISK_STRING_INST_ID=" + diskString.getString("ID"));
                while (diskGroup.next()) {

                    ResultSet diskProxy = db.getData(XMLDataModel.DISK_PROXY_TABLENAME, "*", "LOGICAL_DRIVE_INST_ID=" + driveId + " and  DISK_GROUP_INST_ID='" + diskGroup.getString("ID") + "'");

                    if (!diskProxy.next()) {
                        Out += diskGroup.getString("ID") + "__" + diskGroup.getString("NAME") + ";";

                    }

                }
            }
        }
        db.closeCon();
        out.print(Out);

    } else if (status.equalsIgnoreCase("getAssignedDisk")) {

        String driveId = request.getParameter("Datastore");
        db.openCon();
        ResultSet diskProxy = db.getData(XMLDataModel.DISK_PROXY_TABLENAME, "*", "LOGICAL_DRIVE_INST_ID=" + driveId);
        while (diskProxy.next()) {
            String[] diskData = db.getRowNocon(XMLDataModel.DISK_GROUP_INST_TABLENAME, "ID=" + diskProxy.getString("DISK_GROUP_INST_ID"));
            Out += diskData[0] + "__" + diskData[3] + ";";
        }
        db.closeCon();
        out.print(Out);

    } else if (status.equalsIgnoreCase("DiskAdd")) {

        String driveId = request.getParameter("Datastore");
        String modid = request.getParameter("modid");

        String[] noids = noid.split(",");
        for (String id : noids) {

            String newId = Utils.getNewID();
            int rowCount = db.getRowCount(XMLDataModel.DISK_PROXY_TABLENAME, "LOGICAL_DRIVE_INST_ID=" + driveId + " and DISK_GROUP_INST_ID=" + id);
            if (rowCount < 1) {
                String[][] data = {{"ID", "Model_ID", "LOGICAL_DRIVE_INST_ID", "DISK_GROUP_INST_ID"}, {newId, modid, driveId, id}};

                out.print(db.setInsert(XMLDataModel.DISK_PROXY_TABLENAME, data));

            }

        }
    } else if (status.equalsIgnoreCase("DiskRemove")) {

        String[] noids = noid.split(",");
        for (String id : noids) {
            String driveId = request.getParameter("Datastore");
            db.setDelete(XMLDataModel.DISK_PROXY_TABLENAME, "LOGICAL_DRIVE_INST_ID=" + driveId + " and DISK_GROUP_INST_ID=" + id);
        }
    } else if (status.equalsIgnoreCase("removeDatastore")) {

        String driveId = request.getParameter("Datastore");
        db.setDelete(XMLDataModel.DISK_PROXY_TABLENAME, "LOGICAL_DRIVE_INST_ID=" + driveId);

        db.setDelete(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, "ID=" + driveId);

    }

%>
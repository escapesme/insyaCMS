<%@page import="xact.utils"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();

    HttpSession s = request.getSession(true);
    String PastData = (String) s.getAttribute("copyServesData");
    String modID = request.getParameter("modID");
    utils u = new utils();
    String type = request.getParameter("type");;

    String process_id = request.getParameter("process_id");;
    String[] pastData = PastData.split("__");

    String outData = "";

    outData = PastData;

    String allIds = "";

    for (int i = 0; i < pastData.length; i++) {

        String[] pastD = pastData[i].split("/");
        String otype = pastD[0];

        //   out.print(otype);
        if (type.equalsIgnoreCase("serves")) {
            if (pastD.length > 1) {

                String tabelName = XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME;
                String id = pastD[1];
                String[] DataRow = db.getRow(tabelName, "id=" + id);

                if (DataRow[1] != null && !DataRow[1].equalsIgnoreCase("start") && !DataRow[1].equalsIgnoreCase("end")) {

                    if (otype.equalsIgnoreCase("SERVICE_PROCESS_NODES")) {

                        String[] fildesArray = {"ID", "TAG", "NAME", "PARENT_ID", "ATTRIB_ID", "ATTRIB_CLASS", "MODEL_ID", "TYPE", "SELECTOR", "DURATION_1", "OCCURENCE", "DURATION_2", "T_O_D", "THROUGHPUT", "STREAMS", "LEVEL", "COMMENT", "ACTIVE_STATUS"};

                        DataRow[3] = process_id;
                        DataRow[6] = modID;
                        DataRow[4] = "0";
                        String outIds = u.duplicateObject(id, tabelName, fildesArray, DataRow);
                        allIds += outIds + ";";

                        //
                        outData += u.copyServiceObjects(modID, id, outIds.split("__")[1], "3", process_id);

                    }

                }

            }
        }

    }

    //   out.print("<br/>" + allIds + "<br/>");
    for (int i = 0; i < pastData.length; i++) {
        String[] pastD = pastData[i].split("/");
        String otype = pastD[0];

        if (otype.equalsIgnoreCase("SERVICE_PROCESS_LINKS")) {

            String[] fildesArray = {"ID", "TAG", "NAME", "FROM_ID", "TO_ID", "PARENT_ID", "ATTRIB_ID", "ATTRIB_CLASS", "MODEL_ID", "TYPE", "UTILIZATION_FREQUENCY"};
            String tabelName = XMLDataModel.SERVICE_LINK_TABLENAME;
            String id = pastD[1];
            String[] DataRow = db.getRow(tabelName, "id=" + id);

            String newFromId = returnNewIds(DataRow[3], allIds);
            String newToId = returnNewIds(DataRow[4], allIds);

            DataRow[6] = "0";
            DataRow[8] = modID;

            if (!newFromId.equalsIgnoreCase("") && !newToId.equalsIgnoreCase("")) {
                outData = newFromId + "__" + newToId + "<br/>";
                DataRow[3] = newFromId;
                DataRow[4] = newToId;

                DataRow[1] = modID;
                DataRow[5] = process_id;
                outData += u.duplicateObject(id, tabelName, fildesArray, DataRow);

                outData += Arrays.deepToString(DataRow);

            }

        }

    }

    out.print(outData);

%>

<%!
    String returnNewIds(String oldId, String AllIds) {
        String returnData = "";
        String[] ids = AllIds.split(";");

        for (int i = 0; i < ids.length; i++) {
            String[] iids = ids[i].split("__");

            if (iids[0].equalsIgnoreCase(oldId)) {

                returnData = iids[1];

            }

        }

        return returnData;
    }
%>
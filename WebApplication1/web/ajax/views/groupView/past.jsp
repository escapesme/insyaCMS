<%@page import="xact.utils"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();

    HttpSession s = request.getSession(true);
    String PastData = (String) s.getAttribute("copyGroupData");
    String modID = request.getParameter("modID");
    utils u = new utils();
    String groupID = request.getParameter("groupID");

    String type = request.getParameter("type");;
    String[] pastData = PastData.split("__");
    String outData = "";
    String allIds = "";




    for (int i = 0; i < pastData.length; i++) {

        String[] pastD = pastData[i].split("/");
        String otype = pastD[0];

        out.print(pastData[i] + "<br/>");


        if (otype.equalsIgnoreCase("group_node")) {
            String[] fildesArray = {"ID", "MODEL_ID", "HOSTNAME", "MODEL_FILENAME", "GROUP_ID", "NAME", "REFERENCE", "REPETITION", "RESPONSE_TIME", "SERVICE_TIME", "TYPE", "X", "Y", "IMG"
            };
            String tabelName = XMLDataModel.NODE_TABLENAME;
            String id = pastD[1];


            String[] DataRow = db.getRow(tabelName, "id=" + id);

            DataRow[1] = modID;
            DataRow[4] = groupID;
            DataRow[9] = "0";
            String outIds = u.duplicateObject(id, tabelName, fildesArray, DataRow);




            allIds += outIds + ";";
        } else if (otype.equalsIgnoreCase("group")) {
            String tabelName = XMLDataModel.NODE_TABLENAME;

            String[] DataRow = db.getRow(tabelName, "id=" + pastD[4]);

            if (DataRow[1] != null) {


                if (DataRow[1].equalsIgnoreCase(modID)) {


                    allIds += pastD[4] + "__" + pastD[4];



                }
            }



        }
    }










    for (int i = 0; i < pastData.length; i++) {
        String[] pastD = pastData[i].split("/");
        String otype = pastD[0];



        if (otype.equalsIgnoreCase("line")) {

            String[] fildesArray = {"ID", "MODEL_ID", "ERROR_RATE", "LENGTH",
                "NODE_ID1", "NODE_ID2", "OVERHEAD", "PROTOCOL", "REFERENCE", "THROUGHPUT", "IMG", "WIRELESS"};

            String tabelName = XMLDataModel.LINE_TABLENAME;
            String id = pastD[1];


            String[] DataRow = db.getRow(tabelName, "id=" + id);

            String newNode1 = returnNewIds(DataRow[4], allIds);
            String newNode2 = returnNewIds(DataRow[5], allIds);


            outData += newNode2 + "::" + allIds + "<br/>";

            outData += newNode1 + "::" + allIds + "<br/>";
            if (!newNode1.equalsIgnoreCase("") && !newNode2.equalsIgnoreCase("")) {
                DataRow[4] = newNode1;
                DataRow[5] = newNode2;
                DataRow[1] = modID;
                DataRow[11] = "0";
                outData += u.duplicateObject(id, tabelName, fildesArray, DataRow);
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
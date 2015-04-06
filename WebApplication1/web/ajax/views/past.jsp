<%@page import="xact.utils"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();

    HttpSession s = request.getSession(true);
    String PastData = (String) s.getAttribute("copyData");
    String modID = request.getParameter("modID");
    utils u = new utils();


    String type = request.getParameter("type");;
    String[] pastData = PastData.split("__");

    String allIds = "";
    for (int i = 0; i < pastData.length; i++) {

        String[] pastD = pastData[i].split("/");
        String otype = pastD[0];

        out.print(otype);


        if (type.equalsIgnoreCase("corporte")) {





            if (otype.equalsIgnoreCase("BUSINESS_PROCESS")) {
                
                String[] fildesArray = {"ID", "MODEL_ID", "COMMENT", "NAME", "PARENT_BPMN_NAME", "SELECTOR", "DURATION" ,"ACTIVE_STATUS"};

                String tabelName = XMLDataModel.BUSINESS_PROCESS_TABLENAME;
                String id = pastD[1];
                String outIds = u.duplicateObject(modID, id, tabelName, fildesArray, 100000000, 100000000);
                allIds += outIds + ";";

                u.copyServiceObjects(modID, id, outIds.split("__")[1], "1","");

            } else if (otype.equalsIgnoreCase("BUSINESS_ENTITY")) {

                String[] fildesArray = {"ID", "MODEL_ID", "COMMENT", "NAME", "NUMBER", "TYPE", "UNIT_TYPE", "X", "Y"};
                String tabelName = XMLDataModel.BUSINESS_ENTITY_TABLENAME;
                String id = pastD[1];
                allIds += u.duplicateObject(modID, id, tabelName, fildesArray, 7, 8) + ";";

            } else if (otype.equalsIgnoreCase(" ")) {
                String[] fildesArray = {"ID", "MODEL_ID", "NAME", "NUMBER", "UNIT_TYPE", "WINDOW_DURATION", "WINDOW_DURATION_TYPE", "X", "Y"};
                String tabelName = XMLDataModel.CORPORATE_TABLENAME;
                String id = pastD[1];
                allIds += u.duplicateObject(modID, id, tabelName, fildesArray, 7, 8) + ";";



            }



        }
    }



    out.print("<br/>" + allIds + "<br/>");

    String outData = "";


    for (int i = 0; i < pastData.length; i++) {
        String[] pastD = pastData[i].split("/");
        String otype = pastD[0];



        if (otype.equalsIgnoreCase("be_be")) {




            String[] fildesArray = {"ID", "MODEL_ID", "BE_FROM_ID", "BE_TO_ID", "UTILIZATION_FREQUENCY"};
            String tabelName = XMLDataModel.BE_BE_TABLENAME;
            String id = pastD[1];




            String[] DataRow = db.getRow(tabelName, "id=" + id);



            String newFromId = returnNewIds(DataRow[2], allIds);
            String newToId = returnNewIds(DataRow[3], allIds);





            if (!newFromId.equalsIgnoreCase("") && !newToId.equalsIgnoreCase("")) {
                outData = newFromId + "__" + newToId + "<br/>";
                DataRow[2] = newFromId;
                DataRow[3] = newToId;

                DataRow[1] = modID;

                outData += u.duplicateObject(id, tabelName, fildesArray, DataRow);

            }




        } else if (otype.equalsIgnoreCase("CORPORATE_BE")) {
            String[] fildesArray = {"ID", "MODEL_ID", "CORPORATE_FROM_ID", "BE_TO_ID", "UTILIZATION_FREQUENCY"};
            String tabelName = XMLDataModel.CORPORATE_BE_TABLENAME;
            String id = pastD[1];




            String[] DataRow = db.getRow(tabelName, "id=" + id);



            String newFromId = returnNewIds(DataRow[2], allIds);
            String newToId = returnNewIds(DataRow[3], allIds);

            if (!newFromId.equalsIgnoreCase("") && !newToId.equalsIgnoreCase("")) {


                DataRow[2] = newFromId;
                DataRow[3] = newToId;

                DataRow[1] = modID;

                outData = u.duplicateObject(id, tabelName, fildesArray, DataRow);

            }

        } else if (otype.equalsIgnoreCase("BE_BP")) {
            String[] fildesArray = {"ID", "MODEL_ID", "BE_FROM_ID", "BP_TO_ID", "UTILIZATION_FREQUENCY"};
            String tabelName = XMLDataModel.BE_BP_TABLENAME;
            String id = pastD[1];



     //out.print("<br/>" + otype + "<br/>");

            String[] DataRow = db.getRow(tabelName, "id='" + id+"'");

           //   out.print(Arrays.deepToString(DataRow));

            String newFromId = returnNewIds(DataRow[2], allIds);
            String newToId = returnNewIds(DataRow[3], allIds);

            if (!newFromId.equalsIgnoreCase("") && !newToId.equalsIgnoreCase("")) {


                DataRow[2] = newFromId;
                DataRow[3] = newToId;

                DataRow[1] = modID;
                
              //  out.print(Arrays.deepToString(DataRow));

                outData = u.duplicateObject(id, tabelName, fildesArray, DataRow);

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
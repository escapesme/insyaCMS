<%@page import="xact.utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String status = request.getParameter("status");
    lib.engine.db.operations db = new lib.engine.db.operations();

    String row = "";

    if (status.equalsIgnoreCase("del")) {



        String id = request.getParameter("id");


        String[] myids = id.split("__");
        for (int i = 0; i < myids.length; i++) {
            String[] ids = myids[0].split("/");


            String type = ids[0];


            if (type.equalsIgnoreCase("BUSINESS_PROCESS")) {
                row += db.setDelete(XMLDataModel.BE_BP_TABLENAME, "BP_TO_ID=" + ids[1]);
                utils u=new utils();
                u.deleteServiceChildren(ids[1]);
                row += db.setDelete(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "id=" + ids[1]);
            } else if (type.equalsIgnoreCase("BUSINESS_ENTITY")) {
                row += db.setDelete(XMLDataModel.BE_BE_TABLENAME, "BE_TO_ID=" + ids[1]);
                row += db.setDelete(XMLDataModel.BE_BE_TABLENAME, "BE_FROM_ID=" + ids[1]);
                row += db.setDelete(XMLDataModel.BE_BP_TABLENAME, "BP_TO_ID=" + ids[1]);
                row += db.setDelete(XMLDataModel.CORPORATE_BE_TABLENAME, "BE_TO_ID=" + ids[1]);
                row += db.setDelete(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + ids[1]);
            } else if (type.equalsIgnoreCase("corporate")) {
                row = "Corporate object cannot be deleted!";
            } else if (type.equalsIgnoreCase("BE_BP")) {
                row = db.setDelete(XMLDataModel.BE_BP_TABLENAME, "id=" + ids[1]);
            } else if (type.equalsIgnoreCase("CORPORATE_BE")) {
                row = db.setDelete(XMLDataModel.CORPORATE_BE_TABLENAME, "id=" + ids[1]);
            } else if (type.equalsIgnoreCase("BE_BE")) {
                row = db.setDelete(XMLDataModel.BE_BE_TABLENAME, "id=" + ids[1]);
            }
            out.print(row);
        }
    } else if (status.equalsIgnoreCase("edit")) {
        String []ids = request.getParameterValues("ids[]");
        String type = ids[0];
        if (type.equalsIgnoreCase("BUSINESS_PROCESS")) {
            
            
            
            String name = request.getParameter("create_Node_Name");
            String Number = request.getParameter("duration");
            String selector = request.getParameter("selector");
            String comment = request.getParameter("des");
            String days = "0";
            String hrs = "0";
            String mins = "0";
            String seconds = "0";
            if (selector.equals("1")) {
                if (!"".equals(request.getParameter("seconds"))) {
                    seconds = request.getParameter("seconds");
                }
                if (!"".equals(request.getParameter("days"))) {
                    days = request.getParameter("days");
                }
                if (!"".equals(request.getParameter("hours"))) {
                    hrs = request.getParameter("hours");
                }
                if (!"".equals(request.getParameter("minutes"))) {
                    mins = request.getParameter("minutes");
                }
                Number = "" + (Double.parseDouble(days) * (60 * 60 * 24) + Double.parseDouble(hrs) * (60 * 60) + Double.parseDouble(mins) * (60) + Double.parseDouble(seconds));
            }
            String[][] data = {{"COMMENT", "NAME", "DURATION", "SELECTOR"},
                {comment, name, Number, selector}};
            row = db.setUpdate(XMLDataModel.BUSINESS_PROCESS_TABLENAME, data, "id=" + ids[1]);
            
            
            
            
        } else if (type.equalsIgnoreCase("BUSINESS_ENTITY")) {
            String name = request.getParameter("name");
            String Number = request.getParameter("Number");
            String comment = request.getParameter("comment");
            String mtype = "";
            String betype = request.getParameter("beType");
            String unit = "";
            
            if (mtype.equals("bf")) {
                unit = "Business Function";
            } else {
                unit = "Line of business";
            }
            
            
            String[][] data = {{"COMMENT", "NAME", "NUMBER","UNIT_TYPE"},
                {comment, name,Number,betype}};
            row = db.setUpdate(XMLDataModel.BUSINESS_ENTITY_TABLENAME, data, "id=" + ids[1]);
            
            
            
            out.print(row);
        } else if (type.equalsIgnoreCase("corporate")) {
           String name = request.getParameter("name");
            String Number = request.getParameter("Number");
            String corpId = ids[1];
            String mtype = request.getParameter("type");
            String durationtype = request.getParameter("durationtype");
            String windowduration = request.getParameter("windowduration");
            String[][] data = {{"NAME", "NUMBER",
                    "WINDOW_DURATION", "WINDOW_DURATION_TYPE", "UNIT_TYPE"}, {name, Number, windowduration, durationtype, mtype}};
            out.print(row = db.setUpdate(XMLDataModel.CORPORATE_TABLENAME, data, "id=" + corpId));
        }
    } else if (status.equalsIgnoreCase("newconect")) {
        String[] sid = request.getParameter("id").split("/");
        String[] tid = request.getParameter("tid").split("/");
        double link = Double.parseDouble(request.getParameter("UF")) / 100;
        String modelId = sid[3];
        if (sid[0].equals("corporate")) {
            String myid2 = Utils.getNewID();
            String[][] dataxref = {{"ID", "MODEL_ID", "CORPORATE_FROM_ID", "BE_TO_ID", "UTILIZATION_FREQUENCY"},
                {myid2, modelId, sid[1], tid[1], "" + link}};
            db.setInsert(XMLDataModel.CORPORATE_BE_TABLENAME, dataxref);
        } else if (sid[0].equals("BUSINESS_ENTITY")) {
            if (tid[0].equalsIgnoreCase("BUSINESS_ENTITY")) {
                
                
                
                String myid2 = Utils.getNewID();
                String[][] dataxref = {{"ID", "MODEL_ID", "BE_FROM_ID", "BE_TO_ID", "UTILIZATION_FREQUENCY"},
                    {myid2, modelId, sid[1], tid[1], "" + link}};
               out.print("inserting"+ db.setInsert(XMLDataModel.BE_BE_TABLENAME, dataxref));
            } else {
                String myid2 = Utils.getNewID();
                String[][] dataxref = {{"ID", "MODEL_ID", "BE_FROM_ID", "BP_TO_ID", "UTILIZATION_FREQUENCY"},
                    {myid2, modelId, sid[1], tid[1], "" + link}};
                out.print("inserting"+db.setInsert(XMLDataModel.BE_BP_TABLENAME, dataxref));
            }
            
            
            
        }
    } else if (status.equalsIgnoreCase("updateconect")) {
        String[] id = request.getParameter("id").split("/");
        double link = Double.parseDouble(request.getParameter("UF")) / 100;
        String modelId = id[3];
        String[][] dataxref = {{"UTILIZATION_FREQUENCY"}, {"" + link}};
        if (id[0].equals("CORPORATE_BE")) {
            db.setUpdate(XMLDataModel.CORPORATE_BE_TABLENAME, dataxref, "ID=" + id[1]);
        } else if (id[0].equals("BE_BE")) {
            db.setUpdate(XMLDataModel.BE_BE_TABLENAME, dataxref, "ID=" + id[1]);
        } else if (id[0].equals("BE_BP")) {
            db.setUpdate(XMLDataModel.BE_BP_TABLENAME, dataxref, "ID=" + id[1]);
        }
    }

%>
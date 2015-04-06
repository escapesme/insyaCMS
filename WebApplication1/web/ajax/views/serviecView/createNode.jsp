<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Enumeration"%>
<%@page import="xact.utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%!    String MODEL_ID = "";
    String sourceId = "";
    String parentId = "";
    int ParentLevel = 0;
    String[] activityTypes = {"database", "application", "instruction", "human_trans", "human_batch"};
    lib.engine.db.operations db = new lib.engine.db.operations();

    String[] whereFrom(HttpServletRequest req) {

        String musourceId = (String) req.getParameter("sourceId");

        String[] ids = musourceId.split("/");
        MODEL_ID = ids[3];
        sourceId = ids[1];
        parentId = db.getValue(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "PARENT_ID", "id=" + sourceId);
        // ParentLevel = Integer.parseInt(ids[15]);
        return ids;
    }

    String CreatStart(String id) {
        String startid = Utils.getNewID();
        String[][] data3 = {
            {"ID", "MODEL_ID", "NAME", "TYPE", "TAG", "Parent_id", "Level"},
            {startid, MODEL_ID, "start", "start", "start", id, "1"}
        };

        db.setInsert(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, data3);

        String[][] data4 = {{"PARENT_ID", "CHILD_ID"}, {id, startid}};

        db.setInsert(XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME, data4);
        /*
         String linkid = Utils.getNewID();
         String[][] data2 = {
         {"ID", "MODEL_ID", "NAME", "TO_ID", "FROM_ID", "UTILIZATION_FREQUENCY", "TYPE", "TAG", "Parent_id"},
         {linkid, MODEL_ID, "link", "0", startid, "" + 1, "link", "link", parentId}
         };

         return db.setInsert(XMLDataModel.SERVICE_LINK_TABLENAME, data2);*/

        return "";
    }

    String CreatLink(String id, HttpServletRequest req) {
        String linkid = Utils.getNewID();
        DecimalFormat df = new DecimalFormat();
        df.setMaximumFractionDigits(2);

        double linkFU = 1;

        try {

            linkFU = Double.parseDouble(req.getParameter("linkUF")) / 100;

        } catch (Exception e) {

        }

        String[][] data2 = {
            {"ID", "MODEL_ID", "NAME", "TO_ID", "FROM_ID", "UTILIZATION_FREQUENCY", "TYPE", "TAG", "Parent_id"},
            {linkid, MODEL_ID, "link", id, sourceId, df.format(linkFU), "link", "link", parentId}
        };

        return db.setInsert(XMLDataModel.SERVICE_LINK_TABLENAME, data2);

    }

    String addchlidTable(String id) {
        String[][] data2 = {
            {"PARENT_ID", "CHILD_ID"},
            {parentId, id}
        };

        return db.setInsert(XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME, data2);
    }

    String[][] UpdateinData(HttpServletRequest request, String id, String GetType) {
        String ProcessType = request.getParameter("ProcessType");
        String comment = request.getParameter("comment");
        String name = request.getParameter("name");

        String selector = "0";
        double DURATION_1 = 0;
        String OCCURRENCE = "0";
        String type = "";
        String expectedThroughput = "0";
        String Tag = "";
        String timeDeliver = "0";
        String ATTRIB_ID = "0";
        String T_O_D = "00:00:00:00";
        String Stremas = "0";
        if (ProcessType.equalsIgnoreCase("end")) {
            type = request.getParameter("type");
            Tag = "end";

            name = "end";

        } else if (ProcessType.equalsIgnoreCase("process")) {
            selector = request.getParameter("selector");
            T_O_D = request.getParameter("startOffset");
            Stremas = request.getParameter("numberStream");
            OCCURRENCE = request.getParameter("numberOccurances");
            DURATION_1 = (Double.parseDouble(request.getParameter("days")) * 86400) + (Double.parseDouble(request.getParameter("hrs")) * 3600) + (Double.parseDouble(request.getParameter("min")) * 60) + (Double.parseDouble(request.getParameter("sec")));

            Double Dir = (Double.parseDouble(request.getParameter("maxDays")) * 86400) + (Double.parseDouble(request.getParameter("maxHrs")) * 3600) + (Double.parseDouble(request.getParameter("maxMin")) * 60) + (Double.parseDouble(request.getParameter("maxSec")));

            timeDeliver = "" + Dir;
            Tag = "process";
            type = "process";
            ParentLevel++;

            //  out.print(CreatStart(id));
        } else if (ProcessType.equalsIgnoreCase("task")) {

            selector = request.getParameter("selector");
            if (!request.getParameter("expectedThroughput").equalsIgnoreCase("undefined"));
            {
                expectedThroughput = request.getParameter("expectedThroughput");
            }
            timeDeliver = request.getParameter("timeDeliver");
            type = request.getParameter("type");
            OCCURRENCE = request.getParameter("numberOccurances");

            DURATION_1 = (Double.parseDouble(request.getParameter("days")) * 86400) + (Double.parseDouble(request.getParameter("hrs")) * 3600) + (Double.parseDouble(request.getParameter("min")) * 60) + (Double.parseDouble(request.getParameter("sec")));
            Tag = "task";
            ParentLevel++;

        } else if (ProcessType.equalsIgnoreCase("activity")) {
            Enumeration e = request.getParameterNames();
            while (e.hasMoreElements()) {
                System.err.print(e.nextElement());
            }
            String aci2act = request.getParameter("Table");
            //
            if (aci2act != null) {
                if (!aci2act.equals("")) {
                    String[] rows = aci2act.split(";");
                    for (String s : rows) {
                        String newID = Utils.getNewID();
                        String[] rowsData = s.split("__");
                        String[][] xrefData = {
                            {"ID", "SERVICE_ACTIVITY_ID", "AC_INST_ID", "MODEL_ID", "UTILIZATION_FREQ", "FAILOVER_AC_ID", "FAILOVER_DELAY"},
                            {newID, id, "" + rowsData[3], MODEL_ID, rowsData[4], "0", "" + 0}
                        };
                        db.setInsert(XMLDataModel.ACI2ACT_TABLENAME, xrefData);

                        String newID2 = Utils.getNewID();

                        String[] Data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + rowsData[3] + "'");

                        String[][] xrefData2 = {{"ID", "MODEL_ID", "ACTIVITY_ID", "AC_ID", "UTILIZATION_FREQUENCY"}, {newID2, MODEL_ID, id, Data[3], rowsData[4]}};

                        db.setInsert(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, xrefData2);

                    }
                }
            }
            if (request.getParameter("activityType") != null) {
                type = request.getParameter("activityType");
            }

            DURATION_1 = Double.parseDouble(request.getParameter("duration"));
            Tag = "activity";
            ParentLevel++;

        } else if (ProcessType.equalsIgnoreCase("component")) {
            selector = request.getParameter("selector");

            Tag = "component";
            ParentLevel++;
            OCCURRENCE = request.getParameter("numberOccurances");

            if (selector.equalsIgnoreCase("1")) {
                T_O_D = request.getParameter("startOffset");
                OCCURRENCE = "1";
            }
            System.out.print(OCCURRENCE);
            DURATION_1 = (Double.parseDouble(request.getParameter("days")) * 86400) + (Double.parseDouble(request.getParameter("hrs")) * 3600) + (Double.parseDouble(request.getParameter("min")) * 60) + (Double.parseDouble(request.getParameter("sec")));

        } else if (ProcessType.equalsIgnoreCase("collector")) {
            Tag = "collector";
        } else if (ProcessType.equalsIgnoreCase("insertion")) {

            String ATTRIB_IDd = request.getParameter("collector").trim();

            if (ATTRIB_IDd != null && !ATTRIB_IDd.equals("null")) {
                ATTRIB_ID = ATTRIB_IDd;
            }
            Tag = "insertion";
        } else if (ProcessType.equalsIgnoreCase("activity")) {
        } else if (ProcessType.equalsIgnoreCase("service")) {
        } else if (ProcessType.equalsIgnoreCase("message")) {

            Tag = "service";
            type = "simple link";
        } else {
        }
        String[][] data = null;

        if (GetType.equals("edit")) {
            String[][] datau = {
                {"NAME", "SELECTOR", "DURATION_1", "Streams", "OCCURENCE", "TYPE", "TAG", "Level", "COMMENT", "THROUGHPUT", "DURATION_2", "T_O_D", "ATTRIB_ID"},
                {name, selector, "" + DURATION_1, Stremas, OCCURRENCE, type, Tag, "" + ParentLevel, comment, expectedThroughput, timeDeliver, T_O_D, ATTRIB_ID}
            };

            data = datau;
        } else {

            String[][] datau = {
                {"ID", "MODEL_ID", "NAME", "SELECTOR", "DURATION_1", "Streams", "OCCURENCE", "TYPE", "TAG", "Parent_id", "Level", "COMMENT", "THROUGHPUT", "DURATION_2", "T_O_D", "ATTRIB_ID"},
                {id, MODEL_ID, name, selector, "" + DURATION_1, Stremas, OCCURRENCE, type, Tag, parentId, "" + ParentLevel, comment, expectedThroughput, timeDeliver, T_O_D, ATTRIB_ID}
            };
            data = datau;

        }
        return data;
    }
%> 
<%

    String Status = (String) request.getParameter("status");

    if (Status.equalsIgnoreCase("create")) {
        String id = Utils.getNewID();
        String ProcessType = (String) request.getParameter("ProcessType");
        MODEL_ID = "";
        sourceId = "";
        parentId = "";

        whereFrom(request);

        if (ProcessType.equalsIgnoreCase("process")) {
            CreatLink(id, request);
            out.print(CreatStart(id));

        } else if (ProcessType.equalsIgnoreCase("task")) {
            CreatLink(id, request);
            String tasktype = request.getParameter("type");;
            if (!tasktype.equalsIgnoreCase("preparation")) {
                CreatStart(id);
            }
        } else if (ProcessType.equalsIgnoreCase("component")) {
            CreatLink(id, request);
            CreatStart(id);
        } else if (ProcessType.equalsIgnoreCase("collector")) {
            CreatLink(id, request);
        } else if (ProcessType.equalsIgnoreCase("message")) {
            CreatLink(id, request);

        } else if (ProcessType.equalsIgnoreCase("end")) {
            CreatLink(id, request);

        } else if (ProcessType.equalsIgnoreCase("insertion")) {
        } else if (ProcessType.equalsIgnoreCase("activity")) {
            CreatLink(id, request);
        } else if (ProcessType.equalsIgnoreCase("service")) {
        } else {
        }

        out.print(db.setInsert(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, UpdateinData(request, id, "")));
        addchlidTable(id);

    } else if (Status.equalsIgnoreCase("editNode")) {

        whereFrom(request);

        String id = request.getParameter("id");

        out.print(db.setUpdate(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, UpdateinData(request, id, "edit"), "ID='" + id + "'"));

    } else if (Status.equalsIgnoreCase("addLine")) {

        whereFrom(request);
        String[] tid = request.getParameter("tid").split("/");
        double uF = Double.parseDouble(request.getParameter("uF")) / 100;
        DecimalFormat df = new DecimalFormat();
        df.setMaximumFractionDigits(2);
        String linkid = Utils.getNewID();
        String[][] data2 = {
            {"ID", "MODEL_ID", "NAME", "TO_ID", "FROM_ID", "UTILIZATION_FREQUENCY", "TYPE", "TAG", "Parent_id"},
            {linkid, MODEL_ID, "link", tid[1], sourceId, df.format(uF), "link", "link", parentId}
        };

        out.print(db.setInsert(XMLDataModel.SERVICE_LINK_TABLENAME, data2));;

    } else if (Status.equalsIgnoreCase("editLine")) {
        String id = request.getParameter("id");
        double uF = Double.parseDouble(request.getParameter("uF")) / 100;
        DecimalFormat df = new DecimalFormat();
        df.setMaximumFractionDigits(2);
        String[][] data = {
            {"UTILIZATION_FREQUENCY"},
            {"" + df.format(uF)}
        };
        out.print(db.setUpdate(XMLDataModel.SERVICE_LINK_TABLENAME, data, "ID='" + id + "'"));;

    } else if (Status.equalsIgnoreCase("deleteLine")) {

        String id = request.getParameter("id");
        db.setDelete(XMLDataModel.SERVICE_LINK_TABLENAME, "ID='" + id + "'");

    } else if (Status.equalsIgnoreCase("deletNode")) {

        //  String ProcessType = (String) request.getParameter("ProcessType");
        String id = request.getParameter("id");

        String[] data = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, " ID='" + id + "'");

        if (data[1] != null) {
            if (data[1].equalsIgnoreCase("service")) {

                db.openCon();

                ResultSet rs = db.getData(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID='" + id + "'");

                while (rs.next()) {

                    ResultSet rsm = db.getData(XMLDataModel.MESSAGE_TABLENAME, "*", "ID='" + rs.getString("OBJECT_ID") + "'");

                    while (rsm.next()) {

                        db.setDeleteNocon(XMLDataModel.SEGEMENT_TABLENAME, "MESSAGE_ID='" + rsm.getString("ID") + "'");
                    }

                    db.setDeleteNocon(XMLDataModel.MESSAGE_TABLENAME, "ID='" + rs.getString("OBJECT_ID") + "'");

                }

                db.setDeleteNocon(XMLDataModel.S2S_XREF_TABLENAME, "S2S_ID='" + id + "'");

                db.closeCon();

            } else if (data[1].equalsIgnoreCase("activity")) {

                db.setDelete(XMLDataModel.ACI2ACT_TABLENAME, "SERVICE_ACTIVITY_ID=" + id + "");

                db.setDelete(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "  ACTIVITY_ID='" + id + "'");

            }

        }

        utils u = new utils();

        out.print(
                db.setDelete(XMLDataModel.SERVICE_LINK_TABLENAME, "FROM_ID='" + id + "' or TO_ID='" + id + "'"));
        u.deleteServiceChildren(id);
        out.print(db.setDelete(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID='" + id + "'"));

    } else if (Status.equalsIgnoreCase("getData")) {
        String id = request.getParameter("id");
        utils u = new utils();

        out.print(
                db.setDelete(XMLDataModel.SERVICE_LINK_TABLENAME, "FROM_ID='" + id + "' or TO_ID='" + id + "'"));
        u.deleteServiceChildren(id);
        out.print(db.setDelete(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID='" + id + "'"));

    } else if (Status.equalsIgnoreCase("deletexref")) {
        String id = request.getParameter("id");
        String aciId = request.getParameter("aciId");
        db.setDelete(XMLDataModel.ACI2ACT_TABLENAME, "SERVICE_ACTIVITY_ID=" + id + " and AC_INSt_ID=" + aciId);

        String[] Data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + aciId + "'");

        db.setDelete(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "AC_ID='" + Data[3] + "' and ACTIVITY_ID='" + id + "'");
    }
%>

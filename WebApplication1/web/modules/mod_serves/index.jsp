<%--
    Document   : Googlemap
    Created on : May 25, 2011, 1:33:52 PM
    Author     : Sayed Taha
--%>

<%@page import="xact.utils"%>
<%@page import="lib.Options.MyVariables"%>


<%
    String js_link = MyVariables.jsFolder;
%>


<%=js_link%>mxgraph/src/js/mxClient.js


<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>views/serviecViewWindows.js"  type="text/javascript" language="javascript" ></script>
<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>views/serviecViewClass.js"  type="text/javascript" language="javascript" ></script>
<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>mxgraph/serviecViewClass.js"  type="text/javascript" language="javascript" ></script>


<%@page import="lib.Options.XMLDataModel"%>
<script>

    $(function() {

        $("#myseoutlineContainer_con").html("");
        $("#myseoutlineContainer_con").html("<div id=\"seoutlineContainer_con\"style=\" z-index:22;position:absolute;overflow:hidden;top:0px;left:0px;width:100%;height:120px;background:transparent;\"></div>");
    })
</script>


<%@page  import="java.sql.ResultSet,java.util.Arrays" %>
<%
    String[] res_data = request.getParameter("res_data").split("__");
    // out.print(request.getParameter("process_id") );
    String mod_id = res_data[1];
    String sce_id = res_data[0];
    String por_id = request.getParameter("process_id");
    lib.engine.db.operations mydb = new lib.engine.db.operations();
    utils u = new utils();

    xact.drawing.servicesView sview = new xact.drawing.servicesView();
    xact.drawing.mxgraph mx = new xact.drawing.mxgraph();
    // String spn_table = XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME;
    out.print(sview.getStylesArrays() + sview.getStylesSeting());
    mydb.openCon();
//get service process node whose parent id is the business trajectory clicked
    ResultSet rs = mydb.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + por_id + " ");
    lib.tools.test.addMessage("service view", "SV-Init", "Initializing Service  View", "Initializing view with Model ID: " + mod_id + "and Scenario ID: " + sce_id + " and Business Process ID: " + request.getParameter("process_id") + " .", XMLDataModel.successClass);

    String cor[] = mydb.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + mod_id);

    String cl_model_STATUS = mydb.getValueNocon(XMLDataModel.MODEL_TABLENAME, "STATUS", "id=" + mod_id);

    boolean locked = cl_model_STATUS.equals("1");
    xact.users.users usr = new xact.users.users();
    Boolean canEdit = usr.userper(request, "edit");

    out.print("<script type=\"text/javascript\"> $(function(){");
    out.print("if (!mxClient.isBrowserSupported()){ mxUtils.error('Browser is not supported!', 200, false);}\n"
            + "else{ var root = new mxCell();   var layer0 = root.insert(new mxCell()); var model = new mxGraphModel(root);  \nvar "
            + "gra =makGService(\"xactsev\",model,\"" + sce_id + "\",\"" + mod_id + "\",\"" + por_id + "\",\"" + locked + "\",\"" + canEdit + "\" ); var myoutline=dooutline(gra);   var arnods=new Array(); var numb=0;  layoutService(gra, \"leftToRight\");     try{ var layer1 = root.insert(new mxCell());  " + "");

    while (rs.next()) {

        String myTAG = rs.getString("TAG");
        String TYPE = rs.getString("TYPE");

        String sty22[] = null;

        if (myTAG.equalsIgnoreCase("task") || myTAG.equalsIgnoreCase("activity")) {

            sty22 = mydb.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='" + "service_" + myTAG + "_" + TYPE + "'");

            out.print(mx.returnStyle("service_" + myTAG + "_" + TYPE, "style" + rs.getString("id")));

        } else if (myTAG.equalsIgnoreCase("service") && TYPE.equalsIgnoreCase("Simple Link")) {

            sty22 = mydb.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='" + "service_message'");

            out.print(mx.returnStyle("service_message", "style" + rs.getString("id")));

        } else {

            sty22 = mydb.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='" + "service_" + rs.getString("TAG") + "'");

            out.print(mx.returnStyle("service_" + rs.getString("TAG"), "style" + rs.getString("id")));

        }

        if (!sce_id.equals("") && sce_id != null) {

            String[] sedata = mydb.getRowNocon(XMLDataModel.SCENARIO_TABLENAME, "ID='" + sce_id.trim() + "' ");

            if (sedata[7].equals("6")) {
                if (!myTAG.equalsIgnoreCase("start") && !myTAG.equalsIgnoreCase("end") && !myTAG.equalsIgnoreCase("service")) {
                    if (!u.getISScenarioPram(mod_id, sedata[0], rs.getString("ID"), "ACTIVE_STATUS").equalsIgnoreCase("-1")) {
                        sty22[20] = sty22[20].replace(".png", "");
                        sty22[20] += "_notactive.png";
                        if (u.isChildActive(mod_id, sedata[0], rs.getString("ID"))) {
                            sty22[20] = sty22[20].replace("_notactive.png", "_halfactive.png");

                        }
                    }
                } else if (myTAG.equalsIgnoreCase("service")) {
                    //out.print(myTAG);
                    if (!u.serviceProducerActive(rs.getString("ID"), mod_id, sedata[0]).equalsIgnoreCase("-1")) {
                        sty22[20] = sty22[20].replace(".png", "");
                        sty22[20] += "_notactive.png";
                    }

                } else if (myTAG.equalsIgnoreCase("start") || myTAG.equalsIgnoreCase("end")) {
                    //out.print(myTAG);
                    if (!u.getISScenarioPram(mod_id, sedata[0], rs.getString("PARENT_ID"), "ACTIVE_STATUS").equalsIgnoreCase("-1")) {
                        sty22[20] = sty22[20].replace(".png", "");
                        sty22[20] += "_notactive.png";
                    }

                }

            }

        }

        String myid = XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "/" + rs.getString("id") + "/" + sce_id + "/" + mod_id;

        out.print("\n  var l_node" + rs.getString("id") + " =creatDService(gra,\"\",\"" + myid + "\",\"" + rs.getString("NAME") + "\",80,190,100,110,100,style" + rs.getString("id") + ",layer0,\"images/" + sty22[20] + "\");\n");
        lib.tools.test.addMessage("service view,sv-nodes", "SV-Nodes", "Drawing Service View Node", "Drawing SV Node Name: " + rs.getString("NAME") + " ID: " + rs.getString("id") + " Tag: " + myTAG + " Type: " + TYPE + ".", XMLDataModel.successClass);
        // check if this node has children. if it has children this function will create a dummy node under it that will how the expand/collapse button 
        out.print(sview.get_Childrens(rs.getString("id"), sce_id, mod_id));
    }

    ResultSet rsconent = mydb.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "PARENT_ID=" + request.getParameter("process_id") + "  order By id");
    while (rsconent.next()) {
        out.print("\n "
                + "if(typeof  l_node" + rsconent.getString("FROM_ID") + " != \"undefined\" && typeof l_node" + rsconent.getString("TO_ID") + " != \"undefined\"){"
                + " var ed_" + rsconent.getString("id") + " = creatEService(gra ,\"\",l_node" + rsconent.getString("FROM_ID") + " ,l_node" + rsconent.getString("TO_ID") + " ,\"leftToRight\",\"\",\"SERVICE_PROCESS_LINKS/" + rsconent.getString("id") + "/" + sce_id + "/" + mod_id + "/" + rsconent.getString("id") + "\");"
                + "}\n");
        lib.tools.test.addMessage("service view,sv-edges", "SV-Edges", "Drawing Service View Edge", "Drawing SV Edge ID: " + rsconent.getString("id") + " From ID: " + rsconent.getString("FROM_ID") + "TO ID: " + rsconent.getString("TO_ID") + ".", XMLDataModel.successClass);
    }

    out.print("\n"
            + "    /*exportXML(gra);*/"
            + ""
            + ""
            + "}finally {          ");

    out.print(" \n  eventsAfter(gra,\"" + sce_id + "\",\"" + mod_id + "\",\"" + por_id + "\" );   ");

    out.print(" \n  gra.foldCells(true,false,arnods);   ");

    out.print(" \n  gra.fit();  ");

    out.print(" \n  gra.getModel().endUpdate();  ");

    out.print(" \n    } }");

    out.print(" \n }); </script>");

    mydb.closeCon();

    lib.tools.test.setMessage(request);


%>

<div id="xactsev" style="height:900px; margin-top: 30px;  overflow:hidden;width:100%;top:0px;bottom:-2px; background:url('editors/images/grid.gif');cursor:default;"></div>


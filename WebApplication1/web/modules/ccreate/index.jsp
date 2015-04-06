
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.Options.MyVariables"%>
<%
    String js_link = MyVariables.jsFolder;
%>


<%
    lib.tools.MXGraphUtils mxutil = new lib.tools.MXGraphUtils();
    String mod_id = request.getParameter("model_id");

    session.setAttribute("mymodeID", mod_id);

    String data = "";

    String SCENARIOID = "";

    if (request.getParameter("scen_id") != null) {
        SCENARIOID = request.getParameter("scen_id");

    }

    lib.engine.db.operations db = new lib.engine.db.operations();

    db.openDBCon(lib.Options.DbInfo.connectionStringDef);
    String[] s_setting = db.getRowNocon(XMLDataModel.CORPORATE_SETTING_TABLENAME, 1);
    db.closeCon();
    db.openCon();

    String pro_id = db.getValueNocon(XMLDataModel.PMXREF_TABLENAME, "pid", " mid=" + mod_id);

    Object[] sty = mxutil.getStyletext("corporate", "cstyle", pro_id);
    
    
    

    Object[] sty1 = mxutil.getStyletext("Business Function", "beStyle", pro_id);

    Object[] sty2 = mxutil.getStyletext("Line of Business", "lbeStyle", pro_id);

    Object[] sty3 = mxutil.getStyletext("lobm", "be2Style", pro_id);
    Object[] sty4 = mxutil.getStyletext("business_process", "bpStyle", pro_id);

    data += sty[0];
    data += sty1[0];
    data += sty2[0];
    data += sty3[0];
    data += sty4[0];


%>  

<script>
    $(function() {





        $("#outlineContainer_con").html("<div id=\"outlineContainer\"style=\"z-index:1;position:absolute;overflow:hidden;top:0px;left:0px;width:100%;height:120px;background:transparent;\"></div>");
    })
</script>
<%    xact.views.Corporate myCorporate = new xact.views.Corporate();
    String cor[] = db.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + mod_id);

    String cl_model_STATUS = db.getValueNocon(XMLDataModel.MODEL_TABLENAME, "STATUS", "id=" + mod_id);

    boolean locked = cl_model_STATUS.equals("1");
    xact.users.users u = new xact.users.users();
    Boolean canEdit = u.userper(request, "edit");

    
    
    String mydata = sty[0] + " var AllIDs=[]; "
            + "var w= corporateGraph.container.offsetWidth; ;"
            + "  var home = creatD(corporateGraph ,\"corporate/" + cor[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + cor[2] + "\",w/2 - 30,70," + sty[16] + "," + sty[17] + ",mystyle227);";

    ResultSet rs = db.getData(XMLDataModel.CORPORATE_BE_TABLENAME, "*", "MODEL_ID=" + mod_id + " and CORPORATE_FROM_ID=" + cor[0]);

    ArrayList<String> cot3 = new ArrayList<String>();
    int myi = 0;
    Connection coo = db.openDBConNewcon(lib.Options.DbInfo.connectionString);

    while (rs.next()) {
        myi++;
        String bnl1[] = db.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "MODEL_ID=" + mod_id + " and ID=" + rs.getString("BE_TO_ID"));
        //int r = myi + 1;
        double num = 0;
        // if (!cot3.contains(rs.getString("BE_TO_ID"))) {
        cot3.add(rs.getString("BE_TO_ID"));
        if (bnl1[0] != null) {
            if (rs.getString("UTILIZATION_FREQUENCY") != null && !rs.getString("UTILIZATION_FREQUENCY").equals("")) {
                num = Math.round(Double.parseDouble(lib.tools.Utils.getScenarioPram(mod_id, SCENARIOID, rs.getString("ID"), "UTILIZATION_FREQUENCY", rs.getString("UTILIZATION_FREQUENCY"), XMLDataModel.CORPORATE_BE_TABLENAME)) * 100);
            }

            if (bnl1[0] != null && bnl1[5].equalsIgnoreCase("Line of Business") && !bnl1[4].equals("-1")) {
                Object[] sty23 = mxutil.getStyle("lobm", "mycccccs", pro_id);
                mydata += sty23[0] + "\n AllIDs.push('" + bnl1[0] + "'); var l_" + rs.getString("BE_TO_ID") + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bnl1[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bnl1[3] + "\"," + 144 + ",50," + sty23[16] + "," + sty23[17] + ",mycccccs);\n";
            } else {
                Object[] sty18 = mxutil.getStyle(bnl1[5], "mys", pro_id);
                mydata += sty18[0] + "\n AllIDs.push('" + bnl1[0] + "');  var l_" + rs.getString("BE_TO_ID") + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bnl1[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bnl1[3] + "\"," + 144 + ",50," + sty18[16] + "," + sty18[17] + ",mys);\n";
            }

            mydata += "  var ed_" + myi + " = creatE(corporateGraph ,home ,l_" + rs.getString("BE_TO_ID") + ",\"" + num + "%\",\"" + s_setting[3] + "\",\"" + XMLDataModel.CORPORATE_BE_TABLENAME + "/" + rs.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\");"
                    + " corporateGraph.updateCellSize(l_" + rs.getString("BE_TO_ID") + ");\n";
            //leve2
            mydata += myCorporate.leve(bnl1[0], mod_id, s_setting[3], pro_id, SCENARIOID, request, coo);
            mydata += myCorporate.leveb(bnl1[0], mod_id, s_setting[3], pro_id, SCENARIOID, coo, request);

            // }

        }
    }

   // mydata += myCorporate.addOther(mod_id, SCENARIOID, pro_id);

mydata += myCorporate.getOther("", mod_id, s_setting[3], pro_id, SCENARIOID, coo, request);
;
    
    
    
%>





<script>










    var corporateGraph = makg(false, "<%=locked%>", "<%=canEdit%>", "<%=mod_id%>", "<%=SCENARIOID%>");
    var w = corporateGraph.container.offsetWidth;
    var mystyle227 = makstyle("#678a8f", "#3debeb", "#2febdb", "#000000", "Verdana", "1", "1", "1", "", "", "0", true, "", "ellipse", "images/");
    <%=data%>
    <%=mydata%>



    function isSamLine(mygraph, sid, tId, mid) {

        var cells = mygraph.getChildCells(mygraph.getDefaultParent(), true, true);

        var bo = false;
        for (var i = 0; i < cells.length; i++) {

            if (cells[i].isEdge()) {
                if (
                        ((cells[i].source.getId() == sid && cells[i].target.getId() == tId) ||
                                (cells[i].source.getId() == tId && cells[i].target.getId() == sid))
                        && (cells[i].getId() != mid)) {


                    bo = true;

                }


            }


        }
        return bo;
    }






    corporateGraph.addListener(mxEvent.CELLS_ADDED, function(sender, evt)
    {
        var cell = evt.getProperty("cells");

        if (cell[0].isEdge()) {
            var ParentSource = cell[0].source;
            var thisSource = cell[0].target;
            if (thisSource.getId().split("/")[1] == null) {

                if (ParentSource.getId().split("/")[0] !== "BUSINESS_PROCESS") {
                    create_Node(thisSource.getId(), corporateGraph, ParentSource, thisSource);
                }
            } else {
                if (cell[0].source.getValue() != cell[0].target.getValue()) {
                    if (isSamLine(corporateGraph, cell[0].source.getId(), cell[0].target.getId(), cell[0].getId()) == false) {
                        if (!(cell[0].source.getId().split("/")[0] === "corporate" && cell[0].target.getId().split("/")[0] == "BUSINESS_PROCESS")) {
                            creatEdge(cell[0].source.getId(), cell[0].target.getId(), corporateGraph);
                        } else {
                            alert("Can't connect corporate node to business process node");
                            corporateGraph.cellsRemoved(cell);
                        }
                    } else {
                        alert("Oops! Selected objects are already connected!");
                        corporateGraph.cellsRemoved(cell);
                    }
                }
            }

        } else {
            var mx = new mxgraphClass(corporateGraph);
            mx.cells = cell;
            mx.setTitle("new Corporate Node");
            mx.changeStyle({
                STYLE_GRADIENTCOLOR: '#aaaaaa',
                STYLE_STROKECOLOR: '#ffff00',
                STYLE_FONTCOLOR: '#000000',
                STYLE_FILLCOLOR: '#222222',
                STYLE_SHAPE: "circle"
            });
        }
        corporateGraph.refresh();
    })


    //});

</script>




<div id="xactCContainer"></div>
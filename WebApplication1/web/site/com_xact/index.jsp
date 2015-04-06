<%@page import="java.sql.Connection"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>


<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>mxgraph/CorporateClass.js"  type="text/javascript" language="javascript"></script>
<script>
    $(function(){
        $("#outlineContainer_con").html("<div id=\"outlineContainer\"style=\"z-index:1;position:absolute;overflow:hidden;top:0px;left:0px;width:100%;height:120px;background:transparent;\"></div>");
    })
</script>
<%





    lib.engine.db.operations db = new lib.engine.db.operations();
    lib.tools.MXGraphUtils mxutil = new lib.tools.MXGraphUtils();
    xact.views.Corporate myCorporate = new xact.views.Corporate();
    //  xact.drawing.mxgraph mx = new xact.drawing.mxgraph();
    //  xact.scenarios sce = new xact.scenarios();



//get corporate view settings. this has the settings for the graph to be top down or right to left
    lib.tools.test.addMessage("corporate", "c01", "start", "get my setting", XMLDataModel.successClass);
    String mod_id = "";
    db.openDBCon(lib.Options.DbInfo.connectionStringDef);
    String[] s_setting = db.getRowNocon(XMLDataModel.CORPORATE_SETTING_TABLENAME, 1);
    db.closeCon();

//get model id, scenario id

    //  t.addMessage("cor", "c01", "getstting", "here we"+hjk+" get stt"+jk);

    db.openCon();
    mod_id = request.getParameter("model_id");

    String SCENARIOID = "";

    if (request.getParameter("scen_id") != null) {
        SCENARIOID = request.getParameter("scen_id");

    }



//t.addMessage("name1,name2", "msgid", "title", "msg","class");

    lib.tools.test.addMessage("corporate", "c02", "get ides", "get model id:[" + mod_id + "]  scenario id:[" + SCENARIOID + "]", XMLDataModel.successClass);


    String pro_id = db.getValueNocon(XMLDataModel.PMXREF_TABLENAME, "pid", "mid=" + mod_id);
    String cor[] = db.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + mod_id);



    out.print("<script type=\"text/javascript\"> "
            + "$(function(){"
            + "if (!mxClient.isBrowserSupported()){ mxUtils.error('Browser is not supported!', 200, false);}"
            + "else{ var graph =makg(\"" + s_setting[3] + "\");   try{" + "");

    //home
    //get style for corporate object


    

    Object sty[] = mxutil.getStyle("corporate", "mystyle", pro_id);
    
    //create the corporate node 
    out.print(sty[0] + "var w= graph.container.offsetWidth; ;"
            + "var home = creatD(graph ,\"corporate/" + cor[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + cor[2] + "\",w/2 - 30,70," + sty[16] + "," + sty[17] + ",mystyle);");

    

    ResultSet rs = db.getData(XMLDataModel.CORPORATE_BE_TABLENAME, "*", "MODEL_ID=" + mod_id + " and CORPORATE_FROM_ID=" + cor[0]);
    // for (int i = 0; i < be.length; i++) {

    int myi = 0;
    while (rs.next()) {
        myi++;
        String bnl1[] = db.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "MODEL_ID=" + mod_id + " and ID=" + rs.getString("BE_TO_ID"));
        //int r = myi + 1;
        double num = 0;


        if (rs.getString("UTILIZATION_FREQUENCY") != null && !rs.getString("UTILIZATION_FREQUENCY").equals("")) {
            num = Math.round(Double.parseDouble(lib.tools.Utils.getScenarioPram(mod_id, SCENARIOID, rs.getString("ID"), "UTILIZATION_FREQUENCY", rs.getString("UTILIZATION_FREQUENCY"), XMLDataModel.CORPORATE_BE_TABLENAME)) * 100);
        }
        // t.addMassage("corpet,startcopret","cp02", Title, msg)

        //   out.print("alert  (\""+ sce.getSCENARIOPram(mod_id, SCENARIOID, rs.getString("ID"), "UTILIZATION_FREQUENCY", rs.getString("UTILIZATION_FREQUENCY"), XMLDataModel.CORPORATE_BE_TABLENAME)+"\");");

        if (bnl1[5].equalsIgnoreCase("Line of Business") && !bnl1[4].equals("-1")) {
            Object[] sty23 = mxutil.getStyle("lobm", "mycccccs", pro_id);
            out.print(sty23[0] + "\n var l_" + rs.getString("BE_TO_ID") + " = creatD(graph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bnl1[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bnl1[3] + "\"," + 144 + ",0," + sty23[16] + "," + sty23[17] + ",mycccccs);\n");
        } else {
            Object[] sty18 = mxutil.getStyle(bnl1[5], "mys", pro_id);
            out.print(sty18[0] + "\n  var l_" + rs.getString("BE_TO_ID") + " = creatD(graph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bnl1[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bnl1[3] + "\"," + 144 + ",0," + sty18[16] + "," + sty18[17] + ",mys);\n");
        }

        out.print("var ed_" + myi + " = creatE(graph ,home ,l_" + rs.getString("BE_TO_ID") + ",\"" + num + "%\",\"" + s_setting[3] + "\",\"" + XMLDataModel.CORPORATE_BE_TABLENAME + "/" + rs.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\");"
                + " graph.updateCellSize(l_" + rs.getString("BE_TO_ID") + ");\n");
        //leve2
        Connection coo = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        out.print(myCorporate.leve(bnl1[0], mod_id, s_setting[3], pro_id, SCENARIOID, request));
        out.print(myCorporate.leveb(bnl1[0], mod_id, s_setting[3], pro_id, SCENARIOID,coo, request));
        ResultSet rs55 = db.getData(XMLDataModel.BE_BE_TABLENAME, "*", "MODEL_ID=" + mod_id + " and BE_FROM_ID=" + bnl1[0]);


    }







    out.print("}finally { graph.getModel().endUpdate();"
            + " $(\".olv\").parent().parent().parent().parent().parent().parent().attr(\"height\",\"300\"); "
            + "}}"
            + "graph.fit(); exportimage(graph); })    </script>");


    db.closeCon();

    lib.tools.test.setMessage(request);

%>


<div id="xactContainer"></div>

<div id="xactbr"></div>
<style>
    .mymypbpb{
        width:80px;; 
        word-wrap:break-word;

    }
</style>
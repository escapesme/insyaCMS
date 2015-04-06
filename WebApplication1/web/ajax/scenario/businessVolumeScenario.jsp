<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.util.ArrayList"%>
<%@page import="xact.ComputeTester"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.HashMap"%>
<%@page import="xact.BusinessProcessManager"%>


<%!
    lib.engine.db.operations db = new lib.engine.db.operations();

    String getoldValuee(String wehere, lib.engine.db.operations db) {
        String r = "";

        try {
            String[] d = db.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wehere);
            //  db.setDeleteNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wehere);

            if (d[6] != null) {
                r = d[6];
            }
        } catch (Exception e) {

        }
        return r;

    }

%>

<%
    String[] ids = request.getParameter("ids").split("__");

    BusinessProcessManager b = new BusinessProcessManager();
    HashMap<String, String> f = b.getBPList(ids[1]);
    String MODEL_ID = ids[1];
    String SID = ids[2];
    String r = "";
    String s = request.getParameter("status");

    HashMap<String, String> bPdata = new HashMap<String, String>();
    ArrayList<String> useBE = new ArrayList<String>();

    xact.utils u = new xact.utils();

    if (s != null) {
        if (s.equalsIgnoreCase("compute")) {

            String data = request.getParameter("data");
            String[] allData = data.split(";");
            for (String row : allData) {
                String ID = Utils.getNewID();
                String current[] = row.split("__");

                bPdata.put(current[0], current[1]);

            }

            out.print(Arrays.deepToString(bPdata.keySet().toArray()));

        }

        for (String bbid : bPdata.keySet()) {

            double allNumbers = 0;

            String[] XData = db.getRow(XMLDataModel.BE_BP_TABLENAME, "*", "BP_TO_ID='" + bbid + "'");
            db.openCon();
            ResultSet CData = db.getData(XMLDataModel.BE_BP_TABLENAME, "*", "BE_FROM_ID='" + XData[2] + "'");

            String BE_ID = XData[2];

            String[] BEData = db.getRow(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "*", "id='" + BE_ID + "'");

            if (!useBE.contains(XData[2])) {

                useBE.add(XData[2]);

                while (CData.next()) {
                    allNumbers += Double.parseDouble(bPdata.get(CData.getString("BP_TO_ID")));
                }

                out.print("<br/>" + allNumbers + "<br/>");

                u.setScenarioParameters(MODEL_ID, SID, XData[2], "com.acrtek.xact_services.data.bo.BoBusinessEntity", "NUMBER", BEData[4], "" + allNumbers);

                CData.beforeFirst();
                while (CData.next()) {

                    double thisnumber = Double.parseDouble(bPdata.get(CData.getString("BP_TO_ID")));
                    Double per = (thisnumber / allNumbers);

                    out.print(u.setScenarioParameters(MODEL_ID, SID, CData.getString("id"), "com.acrtek.xact.data.bo.BoBEToBP", "UTILIZATION_FREQUENCY", "" + Double.parseDouble(CData.getString("UTILIZATION_FREQUENCY")), "" + per));

                }

                lib.engine.db.operations dbx = new lib.engine.db.operations();

                dbx.openDBCon(lib.Options.DbInfo.connectionStringRes);

                String whaereb = " M_ID='" + SID + "' and BE_ID='" + BE_ID + "'";
                dbx.setDeleteNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, whaereb);

                String[][] Datab = {
                    {"ID", "MODEL_ID", "M_ID", "BE_ID", "BE_NAME", "NUMBER", "INCREMENT", "BE_LIMIT"},
                    {"NULL", MODEL_ID, SID, BE_ID, BEData[3], "" + allNumbers, "1", "100"}
                };

                out.println(dbx.setInsertNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, Datab));

                String wherea = " ID='" + SID + "' and BE_ID='" + BE_ID + "'";
                dbx.setDeleteNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, wherea);

                String[][] Dataa = {
                    {"ID", "PLAN_POINT", "BE_ID", "BE_NUM"},
                    {SID, "0", BE_ID, "" + allNumbers}
                };

                out.println(dbx.ErrorMsg);

                out.println(dbx.setInsertNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, Dataa));

                dbx.closeCon();

                /////////////////////////////////////
            }
        }
        
       ComputeTester com = new ComputeTester();
                int back = com.ComputeWS(ids[0], ids[1], ids[2], 1, 0, 0);


    } else {

        for (String d : f.keySet()) {

            double t = Double.parseDouble(b.getRate(d, ids[1], ids[2]));

            double maxnumber = t * 5;
            double minnumbert = t / 5;

            if (maxnumber < 1) {
                maxnumber = 100;

            }

            r += "<div class='BVCol'>"
                    + "<div class='BVTitle'>" + f.get(d) + "</div>"
                    + "<div id= '" + t + "_" + maxnumber + "_" + minnumbert + "' class='BVSlider'></div>"
                    + "<input class='BVInput' value='" + t + "' />"
                    + "<input id='" + request.getParameter("ids") + "' class='BVIID' type='hidden' value='" + d + "' />"
                    + "</div>";
        }

    }

    out.print(r);


%> <script>
    $(function() {








        $(".BVSlider").each(function() {




            var This = $(this);
            var vals = This.attr("id");

            vals = vals.split("_");






            var slider = This.slider({
                value: Math.round(vals[0]),
                min: Math.round(vals[2]),
                max: Math.round(vals[1]),
                slide: function(event, ui) {
                    This.next(".BVInput").val(ui.value);



                }
            });
            This.next(".BVInput").change(function() {
                slider.slider("value", $(this).val());


            });


            This.next(".BVInput").bind('keypress', function(e) {
                if (e.keyCode == 13) {
                    slider.slider("value", $(this).val());
                }
            });


        });



    });
</script>

<style>

    .BVCol {
        border: 1px solid #666666;
        box-shadow: 0 1px 2px #888888;
        float: left;
        margin: 1%;
        padding: 1%;
        width: 20%;
    }
    .BVInput{
        margin-top: 3px;
    }



</style>
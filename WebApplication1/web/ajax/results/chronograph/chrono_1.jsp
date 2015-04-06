
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.Connection"%>
<%@page import="lib.tools.EndTimeDisplay"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%




    String res_id = request.getParameter("res_id");

    String id = request.getParameter("id");
    String[] results = res_id.split("__");




%>
<%!    lib.engine.db.operations db = new lib.engine.db.operations();
    String results_id = "";
    String modelName = "";
    String bpstart;
    String bpend;
    Date end = getendDate();
    double start = 0;
    String bpName = "ddd";
    Date startdate = getendDate();
    Date bpfifnish = getZeroDate();

    ArrayList<String> getdata(String id, Date todOffset) throws SQLException {


        ArrayList<String> returndata = new ArrayList<String>();

        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "", "PARENT_ID=" + id);



        Date ts1 = todOffset;
        while (rs.next()) {

            String TAG = rs.getString("TAG");
            String type = rs.getString("TYPE");
            if (!TAG.equalsIgnoreCase("Start")
                    && !TAG.equalsIgnoreCase("end")
                    && !TAG.equalsIgnoreCase("activity")
                    && !TAG.equalsIgnoreCase("service")
                    && !TAG.equalsIgnoreCase("insertion")
                    && !TAG.equalsIgnoreCase("collector")
                    && !(TAG.equalsIgnoreCase("task") && type.equalsIgnoreCase("preparation"))) {

                String T_O_D = rs.getString("T_O_D");




                double duration = rs.getDouble("DURATION_1");
                if (duration == 0) {

                    duration = 1;
                }


                if (T_O_D != null) {
                    if (!T_O_D.equalsIgnoreCase("null")) {


                        ts1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(T_O_D));
                        if (ts1.before(todOffset)) {
                            ts1 = calcDate2(todOffset, EndTimeDisplay.calcOffsetInSecond(T_O_D));
                        }


                    }
                } else {
                    if (ts1 == null) {
                        ts1 = getZeroDate();

                    }


                }
                 if (ts1.before(todOffset)) {
                            ts1 = calcDate2(todOffset, EndTimeDisplay.calcOffsetInSecond(T_O_D));
                        }
                String mytod = calcDatet_o_d(ts1);
                String endtime = calcDate(ts1, duration);

                Date currentEnd = calcDate2(ts1, duration);



                Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
                String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + rs.getString("ID") + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'", con);
                String endtime2 = calcDate(ts1, Double.parseDouble(rs2[8]));


                db.closeConNewcon(con);


                if (ts1.before(end)) {
                    bpstart = mytod;
                    startdate = ts1;
                }
                if (currentEnd.after(bpfifnish)) {
                    bpend = endtime;
                    bpfifnish = currentEnd;
                }




                if (!returndata.contains(rs.getString("Name") + "__" + mytod + "__" + endtime)) {
                    returndata.add(rs.getString("Name") + "__" + mytod + "__" + endtime + "__" + endtime2);
                }

                returndata.addAll(getdata(rs.getString("ID"), ts1));
            }











        }

        db.closeCon();
        return returndata;
    }

    String calcDate(Date t_o_d, Double duration) {
        Calendar cal = Calendar.getInstance();
        if (t_o_d == null) {
            t_o_d = getZeroDate();
        }
        cal.setTime(t_o_d);
        int millsecs = (int) (duration * 1000);
        cal.add(Calendar.MILLISECOND, millsecs);
        String pattern = "MM/dd/yyyy hh:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);

        return sdf.format(cal.getTime());
    }

    Date calcDate2(Date t_o_d, Double duration) {
        Calendar cal = Calendar.getInstance();
        if (t_o_d == null) {
            t_o_d = getZeroDate();
        }
        cal.setTime(t_o_d);
        int millsecs = (int) (duration * 1000);
        cal.add(Calendar.MILLISECOND, millsecs);
        return cal.getTime();
    }

    String calcDatet_o_d(Date t_o_d) {
        Calendar cal = Calendar.getInstance();
        if (t_o_d == null) {
            t_o_d = getZeroDate();
        }
        cal.setTime(t_o_d);


        String pattern = "MM/dd/yyyy hh:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);

        return sdf.format(cal.getTime());

    }

    Date getZeroDate() {
        Calendar tc = Calendar.getInstance();
        tc.set(Calendar.HOUR_OF_DAY, 0);
        tc.set(Calendar.MINUTE, 0);
        tc.set(Calendar.SECOND, 0);
        tc.set(Calendar.MILLISECOND, 0);
        return tc.getTime();
    }

    Date getendDate() {
        Calendar tc = Calendar.getInstance();
        tc.set(Calendar.HOUR_OF_DAY, 23);
        tc.set(Calendar.MINUTE, 59);
        tc.set(Calendar.SECOND, 59);
        tc.set(Calendar.MILLISECOND, 0);
        return tc.getTime();
    }

    String udara(String name, String from, String to, String des1, String des2, String color) {

        String mycolor = "ganttGreen";

        if (!color.equalsIgnoreCase("")) {
            mycolor = "ganttRed";


        }
        String data = "";
        if (from != "") {



            data = " {'name':'" + name + "','desc':'" + des1 + "','values':[{'from':\"/Date(" + from + ")/\" ,'to':\"/Date(" + to + ")/\""
                    + ",'desc':'" + des2 + "', 'label':'CRM','customClass':'" + mycolor + "'} ] }";




        }
        return data;
    }

%>

<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>gantt/js/jquery.fn.gantt.js"  type="text/javascript" language="javascript" ></script>

<link rel="stylesheet" href="<%=MyVariables.siteUrl + MyVariables.jsFolder%>gantt/style.css" type="text/css" media="screen" />



<script>
    
    function toTimestamp(strDate){
     
        var datum = Date.parse(strDate);
        
       
        return datum;

    }
</script>

<%

    String data = ""
            + "<script type=\"text/javascript\">  "
            + "<!-- "
            + "\n jQuery(function () {"
            + "var dataPath = location.href.substring(0, location.href.lastIndexOf('/')+1);"
            + " $(\".gantt\").gantt({ ";


    data += " \n source: [";
    results_id = Utils.getResultID(results[1], results[2]);
    modelName = Utils.getModName(results[1], results[2]);
    ArrayList<String> mydata = getdata(id, getZeroDate());
    bpName = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + id)[3];
//out.print("sp_id=" + id + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'");
    db.openConres();
    double bpResponsetime = Double.parseDouble(db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + id+ " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'")[8]);
    //out.print(""+bpResponsetime);
    db.closeCon();
    String bpActualEnd = calcDatet_o_d(calcDate2(startdate, bpResponsetime));
    for (int i = 0; i < mydata.size(); i++) {

        String[] mydataarr = mydata.get(i).split("__");

        String coma = "";
        if (i > 0) {
            coma = ",";

        } else {
            //add here

            data += coma + udara(bpName, "toTimestamp('" + bpstart + "')", "toTimestamp('" + bpend + "')", "", "Name:" + bpName + ";<br/>From:" + bpstart + ";<br/> To:" + bpend + "; ", "");
            coma = ",";
            data += coma + udara("", "toTimestamp('" + bpstart + "')", "toTimestamp('" + bpActualEnd + "')", "", "Name:" + bpName + ";<br/>From:" + bpstart + ";<br/> To:" + bpActualEnd + "; ", "red");
        }

        coma = ",";

        data += coma + udara(mydataarr[0], "toTimestamp('" + mydataarr[1] + "')", "toTimestamp('" + mydataarr[2] + "')", "", "Name:" + mydataarr[0] + ";<br/>From:" + mydataarr[1] + ";<br/> To:" + mydataarr[2] + "; ", "");


        coma = ",";

        data += coma + udara("", "toTimestamp('" + mydataarr[1] + "')", "toTimestamp('" + mydataarr[3] + "')", "", "Name:" + mydataarr[0] + ";<br/>From:" + mydataarr[1] + ";<br/> To:" + mydataarr[3] + "; ", "red");



    }






    data += "\n ]   });}); "
            + "\n-->"
            + "\n</script>";



    out.print(data);
%>

<div class="gantt" />
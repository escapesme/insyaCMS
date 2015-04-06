<%@page import="java.sql.SQLException"%>
<%@page import="lib.Options.XMLDataModel"%>



<%!    lib.engine.db.operations db = new lib.engine.db.operations();
    xact.results.advancedProjection ad = new xact.results.advancedProjection();
    String testreturn = "";

    String getchartsData(String ID, HttpServletRequest rq, String col, int points, String mod_id, String scenario_id) throws SQLException, Exception {

        String retdata = "";

        String mod_name = "";

        String myrid = mod_id;
        mod_name = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4].trim();
       

        db.openConres();
        for (int i = 0; i <= points; i++) {
            String data[] = db.getRowNocon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "TPR_KEY ='" + ID + "_BoBusinessProcess' and MOD_NAME like '%" + mod_name + "_" + i + "%' and RESULT_ID='" + myrid + "'");
            if (col.equalsIgnoreCase("EFFICIENCY")) {

                retdata += data[9] + ";";

            } else if (col.equalsIgnoreCase("SCALABILITY")) {

                retdata += data[8] + ";";

            }
            testreturn += "TPR_KEY like'%" + ID + "%' and MOD_NAME ='" + mod_name + "_" + i + "'" + "<br/>";
        }



        String datasl[] = db.getRowNocon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "TPR_KEY ='" + ID.trim() + "_BoBusinessProcess' and MOD_NAME like'%" + mod_name + "_SL%'");
        if (col.equalsIgnoreCase("EFFICIENCY")) {

            retdata += datasl[9] + ";";

        } else if (col.equalsIgnoreCase("SCALABILITY")) {

            retdata += datasl[8] + ";";

        }
        db.closeCon();



        return retdata;
    }

    String getchartsData2(String ID, HttpServletRequest rq, String point, String col, int points, String mod_id, String scenario_id) throws SQLException, Exception {

        String retdata = "";


        String mod_name = "";

        if (!scenario_id.equalsIgnoreCase("0")) {

            mod_name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID=" + scenario_id)[3];


        } else {

            mod_name = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];



        }

        mod_name = mod_name.trim();

        for (int i = 0; i < points; i++) {


            db.openConres();


            String data[] = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID='" + ID.trim() + "' and NAME ='" + mod_name + "_" + i + "'");

            db.closeCon();
            if (col.equalsIgnoreCase("ELONGATION")) {

                retdata += data[10] + ";";

            } else if (col.equalsIgnoreCase("SERVICE_TIME")) {




                double du = 0;
                if (data[8] != "null" && data[8] != "" && data[8] != null && data[9] != "null" && data[9] != "" && data[9] != null) {

                    du = Double.parseDouble(data[9]) / Double.parseDouble(data[8]);

                }

                retdata += du + ";";



            }


        }
        return retdata;
    }


%>




<%

    String myEFFICIENCY = "";
    String mySCALABILITY = "";
    String myELONGATION = "";
    String mySERVICE_TIME = "";


    String mod_id = request.getParameter("res_id").split("__")[1];
    String sec_id = request.getParameter("res_id").split("__")[2];










    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
    String[] ret = db.getRowNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, " MODEL_ID='" + mod_id + "'");
    db.closeCon();


    int max = Integer.parseInt(ret[5]) + 1;






    String[] allids = request.getParameter("id").split(";");


    for (int i = 0; i < allids.length; i++) {

        myEFFICIENCY += getchartsData(allids[i], request, "EFFICIENCY", max, mod_id, sec_id) + "----";

        mySCALABILITY += getchartsData(allids[i], request, "SCALABILITY", max, mod_id, sec_id) + "----";
        myELONGATION += getchartsData2(allids[i], request, request.getParameter("point"), "ELONGATION", max, mod_id, sec_id) + "----";
        mySERVICE_TIME += getchartsData2(allids[i], request, request.getParameter("point"), "SERVICE_TIME", max, mod_id, sec_id) + "----";



    }







    mySCALABILITY = mySCALABILITY.replace("null", "0");
    myEFFICIENCY = myEFFICIENCY.replace("null", "0");
    myELONGATION = myELONGATION.replace("null", "0");
    mySERVICE_TIME = mySERVICE_TIME.replace("null", "0");

//out.print(myEFFICIENCY );





%>

<div id="chart_div"></div>
<div id="chart_div1"></div>
<div id="chart_div2"></div>
<div id="chart_div3"></div>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script>
    google.load("visualization", "1", {packages: ["corechart"]});
    google.setOnLoadCallback(drawChart);





    var num = "<%=max%>";

    function drawChart() {



        var data3 = new google.visualization.DataTable();




        data3.addColumn('string', 'Year');
        data3.addRows(parseInt(num) + 1);

        //  alert (num);
        for (i = 0; i < parseInt(num); i++) {

            data3.setValue(i, 0, '' + i + '');

        }

        mcraetdata(data3, 'SERVICE_TIME');


        craetchart(data3, 'SERVICE_TIME');
        drawChart2();
        drawChart1();
        drawChart4();
        var buttonAP = window.parent.document.getElementById('checkIn');
        buttonAP.setAttribute("id", "done")
        
    }










    function drawChart1() {

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Year');

        data1.addRows(parseInt(num) + 1);

        //  alert (num);
        for (i = 0; i < parseInt(num); i++) {

            data1.setValue(i, 0, '' + i + '');

        }

        //  data1.setValue(parseInt(num), 0, 'SL');


        mcraetdata(data1, 'SCALABILITY');
        craetchart(data1, 'SCALABILITY');


    }





    function drawChart2() {




        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'Year');



        data2.addRows(parseInt(num) + 1);

        //  alert (num);
        for (i = 0; i < parseInt(num); i++) {

            data2.setValue(i, 0, '' + i + '');

        }

        // data2.setValue(parseInt(num), 0, 'SL');

        //  data2.setValue(parseInt(num), 0, 'SL');


        mcraetdata(data2, 'EFFICIENCY');
        craetchart(data2, 'EFFICIENCY');


    }










    function drawChart4() {




        /* var ddd=[['Age', 'Weight'], [ 8,      12], [ 4,      5.5],[ 11,     14],[ 4,      5],[ 3,      3.5],[ 6.5,    7]
         ] ;   */

        var data4 = new google.visualization.DataTable();

        data4.addColumn('number', 'Year');




        data4.addRows(parseInt(num) + 1);

        //  alert (num);
        for (i = 0; i < parseInt(num); i++) {

            // data4.setValue(i, 0,i);   
            data4.setValue(i, 0, i);



        }




        mcraetdata(data4, 'ELONGATION');


        /*
         
         var data = google.visualization.arrayToDataTable([
         ['Age', 'Weight'],
         [ 8,      12],
         [ 4,      5.5],
         [ 11,     14],
         [ 4,      5],
         [ 3,      3.5],
         [ 6.5,    7]
         ]);
         
         
         
         */

        /*  var data = new google.visualization.DataTable();
         data.addColumn('number','Country');
         data.addColumn('number','Country');
         data.addRows([
         [ 8,      12],
         [ 4,      5.5],
         [ 11,     14],
         [ 4,      5],
         [ 3,      3.5],
         [ 6.5,    7]
         ]);
         
         
         */
        /*
         var data = new google.visualization.DataTable();
         
         data.addColumn('number', 'Population');
         data.addColumn('number', 'Area');
         data.addRows(1);
         
         data.setValue(0, 0, 1324);
         data.setValue(0, 1, 9640821);
         
         */




        craetchart(data4, 'ELONGATION');


    }










    function mcraetdata(data, Type) {
        var col = 0;

        var numms = 0;
        var myretraa = "";


        if (Type == "SERVICE_TIME") {

            numms = parseInt(num);
            myretraa = "<%=mySERVICE_TIME%>";

        } else if (Type == "SCALABILITY") {



            myretraa = "<%=mySCALABILITY%>";

            numms = parseInt(num);


        } else if (Type == "EFFICIENCY") {

            myretraa = "<%=myEFFICIENCY%>";

            numms = parseInt(num);
        } else if (Type == "ELONGATION") {
            // alert ("<%=myELONGATION%>");
            myretraa = "<%=myELONGATION%>";


            numms = parseInt(num);

        }






        var textcol = "<%= request.getParameter("text")%>";


        textcol = textcol.split(";");

        myretraa = myretraa.split("----");
        // alert (myretraa.length);
        for (i = 0; i < myretraa.length; i++) {


            if (myretraa[i] != "") {
                col++;
                data.addColumn('number', textcol[i]);



                var arr = myretraa[i].split(";");
                for (x = 0; x < parseInt(numms); x++)
                {
                    var number2 = arr[x].replace(/[^0-9\.]+/g, "");
                    number2 = Number(number2.replace(" ", ""));

                    data.setValue(x, col, number2);



                }



            }
        }



    }


















    function craetchart(data, type) {

        if (type == "EFFICIENCY") {

            var EFFICIENCYchart = new google.visualization.LineChart(document.getElementById('chart_div'));

            EFFICIENCYchart.draw(data, {width: 500, height: 120, title: 'Throughput Efficiency'});
        } else if (type == "SCALABILITY") {

            var SCALABILITYchart = new google.visualization.LineChart(document.getElementById('chart_div1'));

            SCALABILITYchart.draw(data, {width: 500, height: 120, title: 'Scalability'});

        }



        if (type == "SERVICE_TIME") {

            var SERVICE_TIMEchart = new google.visualization.LineChart(document.getElementById('chart_div2'));

            SERVICE_TIMEchart.draw(data, {width: 500, height: 120, title: 'Quality of Service'});
        } else if (type == "ELONGATION") {

            var ELONGATIONchart = new google.visualization.ScatterChart(document.getElementById('chart_div3'));

            ELONGATIONchart.draw(data, {width: 500, pointSize: 4, height: 120, title: 'Dynamic Complexity (a1)'});

        }



    }























</script>









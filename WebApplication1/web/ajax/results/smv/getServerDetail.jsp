

<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%    
    
    lib.engine.db.operations db = new lib.engine.db.operations();
    String point = request.getParameter("point");
    String act = "";
    String statusact = "";
    ArrayList<String> components = new ArrayList<String>();
    String res_id = request.getParameter("res_id");
    String servername = request.getParameter("servername");
    NumberFormat nf0 = NumberFormat.getInstance(Locale.US);
    nf0.setMaximumFractionDigits(0);
    nf0.setMinimumFractionDigits(0);
    
    NumberFormat nf1 = NumberFormat.getInstance(Locale.US);
    nf1.setMaximumFractionDigits(1);
    nf1.setMinimumFractionDigits(1);
    
    NumberFormat nf2 = NumberFormat.getInstance(Locale.US);
    nf2.setMaximumFractionDigits(2);
    nf2.setMinimumFractionDigits(2);
    
    NumberFormat nf4 = NumberFormat.getInstance(Locale.US);
    nf4.setMaximumFractionDigits(4);
    nf4.setMinimumFractionDigits(4);
    
    String mod_id = res_id.split("__")[1];
    String s_id = res_id.split("__")[2];
    
    String id = request.getParameter("id");
    lib.tools.Utils u = new lib.tools.Utils();
    
    
    String modName = u.getModName(mod_id, s_id) + "_" + point;
    String resut_id = u.getResultID(mod_id, s_id);

    // out.print(modName + ":" + resut_id + ":" + point + ":");

    String disk = "";
    String myclass = "";
    String cache = "";
    ArrayList acs = Utils.getAllAcisForSMVDetail(id);
   // out.print(Arrays.deepToString(acs.toArray()));
    db.openConres();
    double hitRatio = 0;
    double acratio = 1;
    String ac_id = "";
    String chr = "";
    String ratio = "";
   // out.print("Val0='APPLICATION_COMPONENT' and mod_name='" + modName + "' and  val1='" + servername + "' and RESULT_ID='" + resut_id + "'");
    ResultSet rsact = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "Val0='APPLICATION_COMPONENT' and mod_name='" + modName + "' and  val1='" + servername + "' and RESULT_ID='" + resut_id + "'");
    while (rsact.next()) {
        java.sql.Connection ncon = db.openDBConNewcon("");
        myclass = "green";
        
        
        if (acs.contains(rsact.getString("VAL23") )) {
          
            components.add(rsact.getString("val4"));



            //out.print("<br>name:" + rsact.getString("val4") + "^/^" + rsact.getString("val1") + "id:" + ac_id+"type:"+rsact.getString("val5"));
            db.closeConNewcon(ncon);


            // ratio = db.getRowNocon(XMLDataModel.AC_RATIOS_TABLENAME, "AC_ID=" + ac_id + " and MODEL_ID=" + mod_id)[4];
            chr = db.getRowNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "VAl4='" + rsact.getString("VAL4") + "' and Val0='CACHE_A_PER_COMPONENT' and mod_name='" + modName + "' and val1='" + servername + "' and RESULT_ID='" + resut_id + "'")[12];
            
            
            
            if (chr != null) {
                hitRatio = Double.parseDouble(chr);
                
            }
            if (ratio != null) {
                if(!ratio.equals(""))
                acratio = Double.parseDouble(ratio);
                
            }
            if (chr != null) {
                hitRatio = Double.parseDouble(chr);
                
            }
            if (Double.parseDouble(rsact.getString("val8")) > 100 || (hitRatio != 0 && hitRatio < 80)) {
                myclass = "red";
                
                
            } else if (Double.parseDouble(rsact.getString("val8")) > 80 || (hitRatio != 0 && hitRatio > 80) && (hitRatio != 0 && hitRatio < 90)) {
                myclass = "yellow";
            }
            
            act += "<tr><td><div class=\"" + myclass + "\"></div></td>";
            act += "<td>" + rsact.getString("val4") + "</td>";
            act += "<td>" + nf0.format(acratio * 100) + " %" + "</td>";
            act += "<td>" + nf4.format(Double.parseDouble(rsact.getString("val12"))) + "</td>";
            act += "<td>" + nf4.format(Double.parseDouble(rsact.getString("val10"))) + "</td>";
            act += "<td>" + nf2.format(Double.parseDouble(rsact.getString("val6"))) + " %" + "</td>";
            act += "<td>" + nf1.format(Double.parseDouble(rsact.getString("val13")) * 1000) + " ms" + "</td>";
            act += "<td>" + nf1.format(Double.parseDouble(rsact.getString("val14"))) + "</td>";
            if (hitRatio > 0) {
                act += "<td>" + nf0.format(hitRatio) + "%</td>";
            } else {
                act += "<td>n.a.</td>";
            }
            act += "<td>" + nf1.format(Double.parseDouble(rsact.getString("val7")) * 1000) + " ms" + "</td>";
            
            act += "<td>" + nf1.format(Double.parseDouble(rsact.getString("val8"))) + "%</td></tr>";
            
            
        }
        
    }
    ResultSet rs = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "Val0='CACHE_PER_CACHE' and mod_name='" + modName + "' and val1='" + servername + "' and RESULT_ID='" + resut_id + "'");
    myclass = "";
    while (rs.next()) {
        
        if ((rs.getString("val4") != null && Double.parseDouble(rs.getString("val4")) < 80)) {
            myclass = "red";
            
        } else if ((rs.getString("val4") != null && Double.parseDouble(rs.getString("val4")) > 80) && (rs.getString("val4") != null && Double.parseDouble(rs.getString("val4")) < 90)) {
            myclass = "yellow";
            
            
        }
        
        cache += "<tr><td><div class=\"" + myclass + "\"></div></td>";
        cache += "<td>" + rs.getString("val2") + "</td>";
        cache += "<td>" + nf0.format(Double.parseDouble(rs.getString("val5"))) + " kB" + "</td>";
        cache += "<td>" + nf0.format(Double.parseDouble(rs.getString("val4"))) + " %" + "</td>";
        cache += "<td>" + nf2.format(Double.parseDouble(rs.getString("val3"))) + "</td></tr>";
        
    }
    
    ResultSet rsdisk = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "Val0='DISK' and mod_name='" + modName + "' and val1='" + servername + "' and RESULT_ID='" + resut_id + "'");
    
    
    while (rsdisk.next()) {
        String contribution = "";
        ResultSet contrbute = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "Val0='DISTRIBUTION_IO' and mod_name='" + modName + "' and  val1='" + servername + "' and RESULT_ID='" + resut_id + "' and val2='" + rsdisk.getString("val2") + "' and val3='" + rsdisk.getString("val3") + "'and val7='" + rsdisk.getString("val7") + "'");
        while (contrbute.next()) {
            String name = contrbute.getString("VAL8");
            if (components.contains(name)) {
                contribution = contrbute.getString("VAL9");
            }
        }
        //String contribution = db.getRowNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "Val0='DISTRIBUTION_IO' and mod_name='" + modName + "' and  val1='" + servername + "' and RESULT_ID='" + resut_id + "' and val2='" + rsdisk.getString("val2") + "' and val3='" + rsdisk.getString("val3") + "'")[13];
        double elongation = ((Double.parseDouble(rsdisk.getString("val10")) / (Double.parseDouble(rsdisk.getString("val10")) - Double.parseDouble(rsdisk.getString("val11")))) - 1) * 100;
        if (!contribution.equals("")) {
            disk += "<tr><td>" + rsdisk.getString("val2") + "</td>";
            disk += "<td>" + rsdisk.getString("val3") + "</td>";
            disk += "<td>" + rsdisk.getString("val7") + "</td>";
            disk += "<td>" + nf0.format(Double.parseDouble(rsdisk.getString("val9"))) + " %" + "</td>";
            disk += "<td>" + nf2.format(Double.parseDouble(rsdisk.getString("val10"))) + " ms" + "</td>";
            disk += "<td>" + nf2.format(Double.parseDouble(rsdisk.getString("val11"))) + " ms" + "</td>";
            disk += "<td>" + nf0.format(elongation) + "%</td>";
            disk += "<td>" + nf0.format(Double.parseDouble(contribution)) + "%</td></tr>";
            
        }
        
        
    }
    
    
    
    db.closeCon();
    
    
    

%>

<style>

    .red,.yellow,.green{
        border-radius: 15px 15px 15px 15px;
        height: 15px;
        margin: auto;
        width: 15px;

    }
    .red{
        background: red;
    }

    .yellow{
        background: yellow;
    }.green{
        background: green;
    }


</style>


<div style="height:auto;overflow: auto" class="mydata">


    <h2>Application component activity</h2>

    <table>
        <thead>
        <th>Status</th>
        <th>Component</th>
        <th>Weight</th>
        <th>AR</th>
        <th>Throughput</th>
        <th>CPU rate</th>
        <th>CPU</th>
        <th>I/O</th>
        <th>CHR</th>
        <th>RT</th>
        <th>a1</th>

        </thead>

        <%=act%>

    </table>



    <h2>Cache activity</h2>


    <table>
        <thead>
        <th>Status</th>
        <th>Name</th>
        <th>Size</th>


        <th>Hit Ratio</th>

        <th>I/O</th>



        </thead>
        <%=cache%>

    </table>



    <h2>Disk activity</h2>

    <table>
        <thead>
        <th>Machine</th>
        <th>Partition</th>
        <th>DiskName   </th>
        <th>Activty</th>
        <th>Rt</th>
        <th>QT</th>
        <th>a1</th>
        <th>Contribution</th>


        </thead>
        <%=disk%>

    </table>



</div>


<style>

    table{
        width:100%  
    }
    TD{
        border:1px #888 solid    
    }

    th{
        border:1px #888 solid;  
        border-bottom:2px #888 solid    
    }

</style>

<%@page import="lib.Options.XMLDataModel"%>
<%
    String pro_id = request.getParameter("pro_id");


    String[] pro = pro_id.split("/");
    String[] prodata = db.getRow(pro[0], "id=" + pro[1]);
%>



<%!  

   lib.engine.db.operations db = new lib.engine.db.operations();

    String getval(String table, String filde, String id) {
        String arr = db.getValue(table, filde, "id=" + id);
        return arr;
    }
%>



<table class="tb_Property">
    <thead><th colspan=2 >Link</th></thead>
<thead><th class="th_Property">Connection</th><th class="th_Value">Value</th></thead>


<tr  class=""><td>From</td><td><%=getval("location", "NAME", prodata[2])%></td></tr>
<tr  class=""><td>Number of Datacenter</td><td>1</td></tr>


<tr  class="one"><td>TO</td><td><%=getval("location", "NAME", prodata[3])%></td></tr>

<tr  class=""><td>Number of Datacenter</td><td>1</td></tr>



<tr  class="one"><td> Distance (km)</td><td>




        <%



//

            if (getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0]) == "") {


                out.print(request.getParameter("more"));

            } else {


                //    double afterr=Math.round(  Double.parseDouble(getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0]))     );

                double d2 = (int) Math.round(Double.parseDouble(getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0])) * 100) / 100.0;

                out.print(Double.toString(d2));

            }
        %>
        km </td></tr>



<tr><td></td><td></td></tr>
</table>
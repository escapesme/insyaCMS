
<%@page import="lib.Options.MyVariables"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String[] resdata = request.getParameter("res_id").split("__");
    String pro_id = resdata[0];
%>

<%!   

    String myllink = MyVariables.siteUrl + "site/report_wizard/";
    String grnajaxxurl = MyVariables.siteUrl + "ajax/";

String files = "test";
    String jsurl = MyVariables.siteUrl + "includes/js/";
    String ajaxurl = MyVariables.siteUrl + "ajax/results/reports/";


    String filesurl = MyVariables.siteUrl + files;
    
    
    
    lib.engine.db.operations db = new lib.engine.db.operations();

    String finishedReportsList(String pro_id) throws SQLException {
        String retData = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.REPORT_TABLENAME, "distinct(r_id),title", " pro_id='" + pro_id + "' and p_status='1' order by `id` DESC ");
        while (rs.next()) {

            String name = rs.getString("title");
            if (name.trim().equals("") || name.trim().equals("-")) {
                name = "No name entered";


            }



            retData += "<div class='row'>"
                    + "<div class='rep_label'>" + name + "</div>"
                    + "<div id='vid_" + rs.getString("r_id") + "'  class='rep_view'>View</div>"
                    + "<div id='eid_" + rs.getString("r_id") + "'  class='rep_Delete'>Delete</div>"
                    + "</div>";
        }
        db.closeCon();
        return retData;

    }

    String reprotsList(String pro_id) throws SQLException {
        String retData = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.REPORT_TABLENAME, "distinct(r_id),title", " pro_id='" + pro_id + "' and p_status='0'  order by `id` DESC");

        while (rs.next()) {

            String name = rs.getString("title");
            if (name.trim().equals("") || name.trim().equals("-")) {
                name = "No name entered";


            }




            retData += "<div class='row'>"
                    + "<div class='rep_label'>" + name + "</div>"
                    + "<div id='vid_" + rs.getString("r_id") + "'  class='rep_view'>View</div>"
                    + "<div id='eid_" + rs.getString("r_id") + "'  class='rep_edit'>Edit</div>"
                    + "<div id='eid_" + rs.getString("r_id") + "'  class='rep_Delete'>Delete</div>"
                    + "</div>";
        }

        db.closeCon();
        return retData;

    }

    String newReport(String pro_id) {
        String retData = "<div class='Creat_new button'>Create New Report</div>";
        return retData;

    }
%>
<style>

    .rep_label,.rep_view,.rep_edit,.Creat_new,.rep_Delete{
        float:left;
        border-bottom: 1px #0077FF solid;
        font-family: tahoma,arial,verdana,sans-serif;
        font-size: 11px;
        font-weight: bold;margin: 5px;

    }
    .rep_view,.rep_edit,.rep_Delete{
        padding:0px;
        border: 1px #0077FF solid;
        height:22px;
        line-height: 20px;
        width:60px;
    }

    .rep_Delete{
        float:left
    }


    .rep_view,.rep_edit{

        cursor: pointer;
    }
    .row{
        float:left;
        width: 100%;

    }

    .rep_label{
        color: #04468C;
        font-family: tahoma,arial,verdana,sans-serif;
        font-size: 11px;
        font-weight: bold;

        float:left;
        width:30%;
        border-bottom: 1px #0077FF solid;
        height: 22px;
        line-height: 23px;
    }


    .Creat_new.button{

        background-position: center top;
        border: 1px solid #0077FF;
        font-family: Arial;
        font-size: 8pt;
        line-height: 24px;
        padding: 0;
        width: 150px;

    }

    .f_reportes,.u_reportes{
        width:48%
            ;
        float: left;width: 48%;
        float: left;
        overflow: auto;
        height: 65%;

    }
    .f_reportes .title,.u_reportes .title{

        width:90%;
        clear: both;
        background-color: #E3E3E3;
        color:#333;
        font-family: Arial;
        font-size: 10pt;
        padding:  5px 5px 5px 5px;
        font-weight: bold
            ;



    }




    .line{
        width:100%;
        clear: both;
        height:20px
    }
    .vline{
        height:500px;
        border-left: 1px #0077FF solid;
        width:1%;
        float:left
    }

</style>

<div class='n_reportes'><%= newReport(pro_id)%> </div>

<div class='line'></div>
<div class='f_reportes'><div class='title'>Published Reports</div><%= finishedReportsList(pro_id)%></div>
<div class='vline'></div>
<div class='u_reportes'><div class='title'>Reports in Progress</div> <%= reprotsList(pro_id)%></div>


<script>
    
    $(function(){
        $(".Creat_new").click(function(){
             
            window.open('<%=myllink%>?do=new&pro_id='+<%=pro_id%>,'_blank');
            
            
        })
        
        $(".rep_view").click(function(){
            
            var th_id=$(this).attr("id").replace("vid_", ""); 
            window.open('<%=myllink%>viewreport.jsp?id='+th_id,'_blank');
            // /Xact/site/report_wizard/viewreport.jsp?id=1337173201740
        })
        
        
        $(".rep_edit").click(function(){         
   
            var th_id=$(this).attr("id").replace("eid_", ""); 
            window.open('<%=myllink%>?do=edit&pro_id=<%=pro_id%>&id='+th_id,'_blank');
        })

        
        $(".rep_Delete").click(function(){         
   
            var th_id=$(this).attr("id").replace("eid_", ""); 
            $.get("ajax/results/reports/reportdelete.jsp?id="+th_id,function(data){
                var resid="<%=request.getParameter("res_id")%>";
                open_reports(resid,"0");
                
                
            });
        })

        
    })
    
    
    
    
</script>




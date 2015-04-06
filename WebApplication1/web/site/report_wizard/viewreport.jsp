<%@page import="lib.Options.MyVariables"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>

<%!    String filesurl = MyVariables.imagesURL + "/reporting";



    String files = "test";
    lib.engine.db.operations db = new lib.engine.db.operations();

    String getreportData(String id, int filed) {

        String returndta = "-";
        String[] sqldat = db.getRow(XMLDataModel.REPORT_TABLENAME, "r_id='" + id + "'");







        if (sqldat[filed] != null && !sqldat[filed].equalsIgnoreCase("null")) {


            returndta = sqldat[filed];
        }


        return returndta;
    }

    String returndata(String type, String id, String filed, String step) throws SQLException {







        String dtaa = "";

        db.openCon();
        ResultSet sqldat = null;

        if (type.equalsIgnoreCase("report")) {
            sqldat = db.getData(XMLDataModel.REPORT_TABLENAME, "", "r_id='" + id + "'");

        } else if (type.equalsIgnoreCase("images")) {//
            sqldat = db.getData(XMLDataModel.REPORT_IMAGES_TABLENAME, "", "report_id='" + id + "' and data_type='" + step + "' order by `name` ");





        } else if (type.equalsIgnoreCase("data")) {

            sqldat = db.getData(XMLDataModel.REPORT_DATA_TABLENAME, "", "report_id='" + id + "' and data_type='" + step + "'");

        }

        while (sqldat.next()) {

            dtaa += "1&1&1&5&5&5" + sqldat.getString(filed);


        }
        db.closeCon();

        return dtaa;

    }

    String getValue(String names, String Values, String getValue) {

        String returndata = "";

        String[] myName = names.split("!split!");
        String[] myValues = Values.split("!split!");




        for (int i = 0; i < myName.length; i++) {

            String viename = myName[i].replace("[", "");

            viename = viename.replace("]", "");
            viename = viename.replace("1&1&1&5&5&5", "");


            if (getValue.equalsIgnoreCase(viename)) {




                returndata = myValues[i].replace("[", "");

                returndata = returndata.replace("]", "");


                String mydata = returndata.replace("1&1&1&5&5&5", "");


                if (!mydata.trim().equalsIgnoreCase("undefined")) {


                    returndata = mydata;
                } else {

                    returndata = "";
                }



            }



        }

        return returndata;


    }

    String getImage(String id, String[] images) {

        String returndata = "";


        for (int i = 0; i < images.length; i++) {

            if (images[i] != null && !images[i].equalsIgnoreCase("")) {

                returndata += "<img class='p_img' src=" + filesurl + "/" + id + "/" + images[i] + ".jpg />";

                String[] sqldat = db.getRow(XMLDataModel.REPORT_DATA_TABLENAME, "report_id='" + id + "' and name='" + images[i] + "'");

                String mydata = sqldat[5].replace("[!split!]", "");

                if (!mydata.trim().equalsIgnoreCase("undefined")) {


                    returndata += "<div class='imageData'>" + mydata + "</div>";
                }




            }





        }
        return returndata;
    }

    String getUploadedImages(String id, String num) throws SQLException {
        String Step_s_image = returndata("images", id, "name", num);



        return getImage(id, Step_s_image.split("1&1&1&5&5&5"));

    }

    String returnStepData(String id, String step, String name) throws SQLException {

        String Step_1_names = returndata("data", id, "data_name", step);

        String Step_1_values = returndata("data", id, "data_value", step);

        return getValue(Step_1_names, Step_1_values, name);
    }

%>



<%
    String id = request.getParameter("id");

    String[] rep_data = db.getRow(XMLDataModel.REPORT_F_TEXT_TABLENAME, "id=1");


    /*
     * out.print(Arrays.deepToString(rep_data) );
     */
%>


<%
    String Title = "";
    String program = "";

//String f1=

    String Step_1_names = returndata("data", id, "data_name", "1");

    String Step_1_values = returndata("data", id, "data_value", "1");

    String Step_10_names = returndata("data", id, "data_name", "10");

    String Step_10_values = returndata("data", id, "data_value", "10");


//|||;step;rp_id;send_image;Organiztion_Name;Date_of_Issue;Program;Owner;Date_Of_Creation;Executive_Summary;Findings




    String Step_c_image = returndata("images", id, "name", "2");

    String[] Step_c_images = Step_c_image.split("1&1&1&5&5&5");
    /*
     * String Step_im_image = returndata("images", id, "name", "3");
     *
     * String[] Step_im_images = Step_c_image.split("1&1&1&5&5&5");
     */
    ;

    xact.users.users us = new xact.users.users();

    if (!us.userReturn(request, "cid").equalsIgnoreCase(getreportData(id, 10))) {
        out.print("Access Denied!");


    } else {

%>

<style>
    .page{


        page-break-after: always;
        margin:auto;
        position: relative;
        border: 1px #eee solid;
        margin-top: 20px;

        min-height: 250mm;
        width: 210mm;



        padding:3px;


        text-align: justify;

        font-size: 9pt;

        font-family: 'verdana'

    }


    .p_img{
        width:100%;
        margin-left: 5%;
        padding:2px;
        background: #999 ;
        border: 1px #000 solid


    }.imageData{


        width:100%;
        margin-left: 5%;
        padding:2px;
    }




    .label{
        width:50%;
        float:left;
        font-size: 11pt;
        font-weight: bold;
        padding: 2px;

    }

    .title_sub{
        font-size: 15pt;
        margin: auto;
        margin-top: 20px;
        border-bottom: 1px #333 solid;
        font-weight: bold;
        margin-bottom: 5px;
        padding: 2px;

    }
    .title_sub.Program{
        border:none;
        margin-left: 150px;
        margin-top: 80px;

    }

    .title{

        font-size: 22pt;

        margin-top: 100px;

        margin-left: 150px;
    }



    .value{
        width: 90%;
        float: left;
        text-align: justify;
        margin-left: 4%;
        font-size: 9pt;

        font-family: 'verdana'

    }

    .line{
        clear: both;
        width:80%;
        height:20px;
        margin: auto
            ;
        /*  border-bottom: 1px #999 solid*/
    }




    .xact_logo img{
        width:229px;
        height:65px;

    }

    .xact_logo2 img{

        height:65px;

    }


    .xact_logo2{
        float:right;
        position: absolute;
        right:5px; 
        top :5px;
    }


    .p_d{
        float:right;
        position: absolute;
        color:#999;
        bottom:20px;
        right:20px
    }
    .value.page1{
        margin-left: 150px;
    }
</style>





<div class='page'>

    <div class="xact_logo">  <img  src='../../images/xact_logo.png'>    </div>
    <div class="xact_logo2"><img  src='<%=filesurl%>/<%=id%>.jpg'> </div>



    <div class='title'> Organization :<%=getValue(Step_1_names, Step_1_values, "Organiztion_Name")%></div>

    <div class='title_sub Program'> Program :<%=getValue(Step_1_names, Step_1_values, "Program")%></div>


    <div class='value page1'>    <%= rep_data[1]%></div>



    <div class="p_d">


        <div>Date of Issue: <%=  lib.tools.Utils.dateFromDate(getreportData(id, 6))%></div>

        <div>Owner:<%=getValue(Step_1_names, Step_1_values, "Owner")%></div>
        <div>Author:<%=getValue(Step_1_names, Step_1_values, "Author")%></div>
        <div>Date of Creation:<%=getValue(Step_1_names, Step_1_values, "Date_Of_Creation")%></div>

    </div>
</div>
<div class='page'>  

    <div class="title_sub"> Glossary</div>

    <div class="value">     <%= rep_data[2]%></div>



</div>
<div class='page'></div>

<div class='page'>

    <div class="title_sub"> 0. Executive Summary</div>

    <div class="value"> <%=getValue(Step_1_names, Step_1_values, "Executive_Summary")%></div>

</div>

<div class='page'>







    <div class="title_sub">1. Introduction</div>

    <div class="value">  <%=getValue(Step_1_names, Step_1_values, "Introduction")%></div>
    <div class="line"></div>
    <div class="label"> 1.1 Purpose</div>

    <div class="value"> <%=getValue(Step_1_names, Step_1_values, "Purpose")%> </div>
    <div class="line"> </div>
    <div class="label"> 1.2 Scope</div>

    <div class="value"> <%=getValue(Step_1_names, Step_1_values, "Scope")%></div>

    <div class="line"> </div>


</div>
<div class='page'>


    <div class="title_sub"> 2. Model-Based-Architecture Methodology </div>


    <div class="value">  <%= rep_data[3]%> </div>

    <div class="label"> 2.0 Process</div>

    <div class="value">  <%= rep_data[4]%> </div>
    <div class="line"> </div>
    <div class="label"> 2.1 Areas Covered</div>

    <div class="value"> <%= rep_data[5]%> </div>

    <div class="line"> </div>
    <div class="label">Organization</div>

    <div class="value">     <%=   getUploadedImages(id, "2")%> </div>

    <div class="line"> </div>
    <div class="label"> Service</div>


    <div class="value">  <%=   getUploadedImages(id, "3")%></div>

    <div class="line"> </div>
    <div class="label"> Implementation</div>

    <div class="value">  <%=   getUploadedImages(id, "4")%> </div>

    <div class="line"> </div>


    <div class="label"> Groups</div>

    <div class="value">  <%=   getUploadedImages(id, "5")%> </div>

    <div class="line"> </div>





</div>

<div class='page'>



    <div class="title_sub"> 3. Findings</div>



    <div class="label"> 3.0 Definitions </div>

    <div class="value">  <%= rep_data[6]%> </div>
    <div class="line"> </div>
    <div class="label"> 3.1 Diagnosis and Repair</div>

    <div class="value"> <%=   getUploadedImages(id, "6")%>  </div>
    <div class="line"> </div>
    <div class="label"> 3.2 Advance Analysis</div>

    <div class="value"> <%= rep_data[7]%> </div>
    <div class="line"> </div>
    <div class="label"> 3.3 Singularity Discovery</div>

    <div class="value">  <%=   getUploadedImages(id, "7")%> </div>

    <div class="line"> </div>

    <div class="label"> 3.4 Service Management View</div>

    <div class="value"> <%=   getUploadedImages(id, "8")%> </div>

    <div class="line"> </div>
    <div class="label"> 3.5 Resource Management View</div>

    <div class="value">  <%=   getUploadedImages(id, "9")%> </div>

    <div class="line"> </div>
<div class="label"> 3.6 Financial Management View</div>

    <div class="value">  <%=   getUploadedImages(id, "10")%> </div>

    <div class="line"> </div>









</div>
<div class='page'>
    <div class="title_sub"> 4. Critical Analysis</div>



    <div class="value"><%=getValue(Step_10_names, Step_10_values, "Critical_Analysis")%>  </div>
    <div class="line"> </div>

    <div class="label"> Which axis are at risk
    </div>

    <div class="value"><%=getValue(Step_10_names, Step_10_values, "Which_risk")%>  </div>
    <div class="line"> </div>


    <div class="label"> What are the main risk areas
    </div>

    <div class="value"> <%=getValue(Step_10_names, Step_10_values, "What_areas")%>   </div>
    <div class="line"> </div>
    <div class="label"> How urgent the risk should be addressed
    </div>

    <div class="value"><%=getValue(Step_10_names, Step_10_values, "How_addressed")%>  </div>
    <div class="line"> </div>

</div>






<div class='page'>
    <div class="title_sub"> 5. Conclusion</div>

    <div class="value"><%=getValue(Step_10_names, Step_10_values, "Conclusion")%>  </div>
    <div class="line"> </div>

</div>

<% }%>
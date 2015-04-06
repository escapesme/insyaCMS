<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<script type="text/javascript">
    $(function() {
        $("#imtree").treeview({
            collapsed: true,
            animated: "medium",
            control: "#sidetreecontrol",
            persist: "location"
        });
    })





function WaitForThisIFrame() {
        if ($(".n_id").attr('id') != "done") {
            setTimeout("WaitForThisIFrame();", 200);
        } else {
            done();
        }
    }

    function done() {
        var buttonAP= $('.myloading', window.parent.document);
        
         buttonAP.remove();
    }







    function mackmycahat() {



        var mydata = "";
        var text = "";





        $('.n_id:checked').each(function() {

            mydata += $(this).val() + ";";
            text += $(this).next(".mytitle").text() + ";";

        })



      

        var data = "<iframe src=\"" +<%=link%> + "/ajax/results/getmyres.jsp?res_id=<%= request.getParameter("res_data")%>&id=" + mydata + "&text=" + text + "\" style=\"border:none; width:100%;height:100%\"></iframe>";


        $(".me_right").html(data);
        WaitForThisIFrame();

     
    }



    $(".n_id").click(function() {
     
        mackmycahat();
       

    })


   
    mackmycahat();
 












</script>





<%!    lib.engine.db.operations db = new lib.engine.db.operations();
    String link = MyVariables.siteUrl;
    xact.results.imapctPath im = new xact.results.imapctPath();
%>



<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%
    db.openCon();
    //out.print(request.getParameter("res_data"));

    String mod_is = request.getParameter("res_data").split("__")[1];


    ResultSet mynode = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID='" + mod_is + "'");
    out.print("<ul id=\"imtree\" >");
    while (mynode.next()) {
        out.print("<li> <input type=\"checkbox\" id='checkIn' class=\"n_id\" name=\"team\"  checked value=\"" + mynode.getString("ID") + "\"/>");
        out.print("<div class=\"mytitle\">" + mynode.getString("Name") + "</div>");
        out.print(im.get_Childrens3(mynode.getString("ID")));
        out.print("</li>");

    }

    out.print("</ul>");

    db.closeCon();



%>













<style>
    li{
        width:80%;
        clear: both

    }
    li input{
        float: left;
    }


</style>




















</li>
</ul>




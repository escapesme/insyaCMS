
<%@page import="xact.utils"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>

<%

    xact.users.users us = new xact.users.users();
    lib.engine.db.operations db = new lib.engine.db.operations();
    String Cid = us.userReturn(request, "cid");
    String Gid = us.userReturn(request, "gid");

    Boolean CanCraet = us.userper(request, "create");
    utils u = new utils();

    int rs_num = db.getRowCount(XMLDataModel.PROJECT_TABLENAME, "(gid=" + Gid + " and cid=" + Cid + ") or (gid=0 and cid=0) ");

    db.openCon();

    ResultSet rs = db.getData(XMLDataModel.PROJECT_TABLENAME, "*", "(gid=" + Gid + " and cid=" + Cid + ")  or (gid=0 and cid=0) ");

    int i = 0;
    int x = 0;
    out.print("<div class=\"mydata prolist\" >"
            + "<div class='proTabel'>");

    out.print("<table class=\"data_grid projectes\"><thead><th>Name</th><th>Description</th></thead><tbody>");

   // out.print(db.isclose());
    String myclass = "on";
    while (rs.next()) {
        i++;
        x = 0;
        String clss = "";
        String clss2 = "";
        if (i == rs_num) {
            clss = "last";
        }
        if (myclass.equals("")) {
            myclass = "one";
        } else {
            myclass = "";
        }
        String[] cl_pmxref = db.getColumnNOCON("PMXREF", "mid", " pid=" + rs.getString("pid"));
        out.print("<tr class=\"" + myclass + "\"><td  class=\"" + clss + "\">"
                + "<a class=\"prolist_link\" id=\"" + rs.getString("pid") + "\" href=\"?alias=xact&pro_is=" + rs.getString("pid") + "\" ><span class=\"folder\">" + rs.getString("NAME") + "</span></a></td><td>" + rs.getString("descfull") + "</td></tr>");
    }

    db.closeCon();

    out.print("</tbody></table></div></div>"
            + "<div class=\"do_center\">");

    //  out.print(us.userper(request, "admin"));
    //if (Cid.equals("2") && us.userper(request, "admin")) {
    if (Cid.equals("2")) {

        out.print("<input type=\"button\" value=\"Move\" class=\"pro_list_form_move  \">");
    }

    out.print("<input type=\"button\" value=\"Open\" class=\"pro_list_form_open \">");

    out.print("<input type=\"button\"  class=\"import_model\"  value=\"Import Model\">");

    if (CanCraet) {
        out.print("<input type=\"button\"  class=\"deleteProject\"  value=\"Delete\">");

        out.print("<input type=\"button\" value=\"New\" class=\"pro_list_form_creat\">");

    }

    out.print("</div>");

    String mailBodyMsg = "rrrrr";

    out.print("<script> </script>");


%>




<script>


    function sendemailMsg(title, body) {



        showMessage("err", title, body, "Update Email", function() {

            makeWinDows("Update Email", "updateEmail", updateEmail(), 450, 150, 400, null);



        });

    }



    var soonstatus = "<%=us.isPasswordSoon(request)%>";
    var soonDays = "<%=us.daysTillExpeiration(request)%>";

    if (soonstatus == "true") {


        showMessage("wor", "", "<%=MyVariables.PasswordSoon%>" + soonDays + " days", "Update Password", function() {
            $.get("modules/mod_userOptions/index.jsp", function(rdata) {


                makeWinDows("User Options", "changpass", "<div class=\"user_pass mydata\">" + rdata + "</div>", 550, 200, 530);

            })



        });

    }






    $(function() {
        $.ajax({
            type: "POST",
            url: "ajax/users/checkMeil.jsp",
            data: {
            }
        }).done(function(data) {

            if ($.trim(data) == "x") {
                sendemailMsg("", "<%=u.outProp("MAILCONFIG", "missingEmail")%>");
            }

        })

    })
</script>


<style>
    .mxWindowPane .prolist
    {
        height:150px;;
        overflow: auto;
        width: auto;


    }





    .mxWindowPane .pro_list_form .do_center{
        bottom: 45px;
    }



</style>
<%@page import="lib.engine.front.properties"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>

<script>

    $(function(){

        function ndile(){

            var answer = confirm("You are about to close the current project. Please confirm.");
            
            
            if (answer){
             /*   $(".pro_list_form").parent().parent().parent().parent().parent().parent().show("slow");
                $(".models_list .cont ,.modem,.serves,#xactContainer,#outlineContainer,#Properties_con,#seoutlineContainer_con").html("");
                $("#div_serves").hide();*/
             
             location.reload(true);
            }
           
    

        }



        $(".NewFile").click(function(){
    
  
        })

        $(".NewFile a").click(function(){




 
 
     ndile();
            return false;
        })
        // $(".File").click(function(){return false; })

        $(".menu li").hover(
        function(){
    
            $(this).children(".submenu").stop(false,true).show("fast");
        },
        function(){
            $(this).children(".submenu").stop(false,true).hide("fast");
    
        }

    )




    })


</script>


<div>
    <%! lib.engine.db.operations db = new lib.engine.db.operations();%>
    <div class="menu dark_bg"><ul>
            <%
        properties pro = new properties(request);
                //request.getParameter("alias");
                db.openDBCon(lib.Options.DbInfo.connectionStringDef);
                ResultSet rs = db.getData(XMLDataModel.DEF_MENUSITEMS_TABLENAME, "*", " parent_id=" + pro.getProperties("menu") + " and enable=1 and cat_id=0 ORDER BY  `order`");
                while (rs.next()) {

                    out.print(returnmen(rs, request));
                }
                db.closeCon();
            %>
        </ul></div></div>


<%!
    String subMenu(String id, HttpServletRequest rq) throws java.sql.SQLException {

        String returnData = "";

        int dd = db.getRowCountNocon(XMLDataModel.DEF_MENUSITEMS_TABLENAME, " cat_id=" + id + " and enable=1");

        if (dd != 0) {
            returnData += "<div  class=\"submenu\">";
            ResultSet rs = db.getData(XMLDataModel.DEF_MENUSITEMS_TABLENAME, "*", " cat_id=" + id + " and enable=1 ORDER BY  `order`");
            returnData += "<ul class=\"sub\">";
            while (rs.next()) {

                returnData += returnmen(rs, rq);
            }
            returnData += "</ul></div>";
        }


        return returnData;


    }

    String returnmen(ResultSet rs, HttpServletRequest rq) throws java.sql.SQLException {

        String a_class = "";
        String returnData = "";

        if (rq.getParameter("alias").equals(rs.getString("th_alias"))) {
            a_class = "button act";
        } else {
            a_class = "";

        }
        if (rs.getString("link_type").equals("ex")) {
            returnData += "<li class=\" " + rs.getString("th_alias") + "  " + a_class + "\">"
                    + "<a href=\"?alias=" + rs.getString("th_alias") + "\">" + rs.getString("title") + "</a>"
                    + subMenu(rs.getString("id"), rq) + "</li>";
        } else {

            returnData += "<li  class=\"" + rs.getString("th_alias") + "\" ><a href=\"" + rs.getString("link") + "\">"
                    + "" + rs.getString("title") + "</a>"
                    + subMenu(rs.getString("id"), rq) + "</li>";
        }

        return returnData;


    }
%>



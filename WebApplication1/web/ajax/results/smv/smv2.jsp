<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String retdata = "<div class='mydata'>";
    retdata += "<div class='frm_row do_left'>"
            + "<div class='frm_label'>Choose Template</div>"
            + "<div class='frm_input'><select class='temp_id'>";

    lib.engine.db.operations db = new lib.engine.db.operations();

    String[] res_id = request.getParameter("res_id").split("__");

    String mod_id = res_id[1];

    if (mod_id == null || mod_id.equals("")) {


        mod_id = res_id[2];

    }

    retdata += mod_id;

    db.openCon();
    
    ResultSet rs = db.getData(XMLDataModel.PATH_TEMPLATE_TABLENAME, "", "MODEL_ID=" + mod_id);

    retdata += "<option value='0'>No Template</option>";




    while (rs.next()) {
        retdata += "<option value='" + rs.getString("ID") + "'>" + rs.getString("NAME") + "</option>";
    }
    retdata += "  </select></div></div></div>";

    db.closeCon();





    retdata += "<div class='do_center'>"
            + "<input type='button' value='Show SMV' class='SMV_Tempalets_send2 '>"
            + "<input type='button' value='Cancel' class='SMV_Tempalets_cancel  '></div>";
%>



<script>





    $(function() {

        getSesstion("smv_template", function(mytep) {


           
            if (mytep == null || $.trim(mytep) == "null") {





                makeWinDows("SMV Templates", "SMV_Tempalets", "<%=retdata%>", 420, 220, 400, null);
                $(".SMV_Tempalets_send2").click(function() {

                    call(10, "#show_datasmv2");
                    setSesstion("smv_template", $(".temp_id").val());
                    loadAjax("ajax/results/smv/smvs2.jsp?template="  + $(".temp_id").val() + "&id= <%=request.getParameter("id")%>  &res_id=<%=request.getParameter("res_id")%>&point= <%=request.getParameter("point")%>&state=<%=request.getParameter("state")%>", ".datasmv2", "start,main");

 $("#show_datasmv2").addClass("act");
            $("#show_datasmv").removeClass("act");

                    closeWindows("SMV_Tempalets");




                });



                $(".SMV_Tempalets_cancel").click(function() {


                    closeWindows("SMV_Tempalets");

                })
            } else {


                loadAjax("ajax/results/smv/smvs2.jsp?template=" + mytep + "& id=" +<%=request.getParameter("id")%> + "&res_id=<%=request.getParameter("res_id")%>&point=" +<%=request.getParameter("point")%>+"&state=" +<%=request.getParameter("state")%>, ".datasmv2", "start,main");



            }
        })
       

    })



</script>
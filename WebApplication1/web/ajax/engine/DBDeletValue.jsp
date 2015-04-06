<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();

    if (request.getParameter("values") == "") {
        String fff = db.setDelete(request.getParameter("table"), "ID=" + request.getParameter("id"));

    } else {
        String[] Vls = request.getParameter("values").split(";");
        String[] Fls = request.getParameter("fildes").split(";");
        String wheredata = "";


        for (int i = 0; i < Fls.length; i++) {

            String myand = "";
            if (i > 0) {

                myand = " and ";

            }

            wheredata += myand + Fls[i] + "='" + Vls[i] + "'";

        }



        String table = request.getParameter("table");
        if (XMLDataModel.STATUS == "upper") {
            table = table.toUpperCase();
        } else {
            table = table.toLowerCase();
        }



        String fff = db.setDelete(table, wheredata);


        out.print(fff);

        // String fff = db.setDelete(request.getParameter("table"), request.getParameter("where"));
    }


%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    deletesch(request.getParameter("id"));
    out.print(Test);
%>



<%!    String Test = "";
    lib.engine.db.operations db = new lib.engine.db.operations();

    void delece(String id) {

        db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "SCENARIO_ID=" + id);

        db.setDelete(XMLDataModel.SCENARIO_TABLENAME, "ID=" + id);


    }

    void deletesch(String id) throws SQLException {


        db.openCon();

        ResultSet rs = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "PARENT_ID=" + id);

        Test += "" + rs.getMetaData().getColumnCount();

        while (rs.next()) {

            Test += ">>" + rs.getString("ID");

            delece(rs.getString("ID"));
            deletesch(rs.getString("ID"));

        }


        delece(id);


        db.closeCon();







    }
%>
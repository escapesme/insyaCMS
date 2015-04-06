<%@page import="java.text.Format"%>
<%@page import="com.sun.org.apache.xerces.internal.dom.DeepNodeListImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lib.tools.files"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="reports.wizard_steps"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "java.util.Map" %>




<%!    lib.engine.db.operations db = new lib.engine.db.operations();

    private String thisDate() {
        String returnDate = "";

        Date now = new Date();

        Format formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd");



        returnDate = "" + formatter.format(now);


        return returnDate;


    }


%>

<%
    xact.users.users us = new xact.users.users();

    String rp_id = request.getParameter("rp_id");

    String datasql = "";



    if (request.getParameter("type") == null || !request.getParameter("type").equalsIgnoreCase("end")) {




        String mynames = request.getParameter("mynames");
        String values = request.getParameter("values");
        String pro_id = request.getParameter("pro_id");
        String mydo = request.getParameter("mydo");
        String pid = "0";







        String user_id = "0";
        String status = "1";
        String last_modify = thisDate();

        String step = request.getParameter("step");
        String title = request.getParameter("title");
        String user_name = us.userReturn(request, "username");
        String cid = us.userReturn(request, "cid");
        String gid = us.userReturn(request, "gid");



        out.print(pro_id);
        wizard_steps w = new wizard_steps();



        if (step.equals("1")) {

            /*
             * out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
             * + step);
             * out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
             * + step);
             */


            datasql += db.setDelete(XMLDataModel.REPORT_TABLENAME, " r_id='" + rp_id + "'  ");

            String[][] data = new String[][]{{"title", "pid", "user_id", "r_id", "status", "last_modify", "user_name", "cid", "gid", "pro_id"},
                {title, pid, user_id, rp_id, status, last_modify, user_name, cid, gid, pro_id}};


            datasql += db.setInsert(XMLDataModel.REPORT_TABLENAME, data);











            String[][] data_rep = new String[][]{
                {"report_id", "data_name", "data_value", "user", "data_type", "user_name", "cid", "gid", "pro_id"},
                {rp_id, mynames, values, user_id, step, user_name, cid, gid, pro_id}};



            datasql += db.setDelete(XMLDataModel.REPORT_DATA_TABLENAME,
                    " report_id='" + rp_id + "' and "
                    + " user='" + user_id + "' and "
                    + " data_type='" + step + "' and "
                    + " pro_id='" + pro_id + "'"
                    + "");

            datasql += db.setInsert(XMLDataModel.REPORT_DATA_TABLENAME, data_rep);






        } else {

            String in_name = "-";


            if (request.getParameter("send_image") != null) {

                in_name = request.getParameter("send_image");

            }


            String[][] data_rep = new String[][]{
                {"report_id", "data_name", "data_value", "user", "data_type", "user_name", "cid", "gid", "pro_id", "name"},
                {rp_id, mynames, values, user_id, step, user_name, cid, gid, pro_id, in_name}};

            db.setDelete(XMLDataModel.REPORT_DATA_TABLENAME,
                    " report_id='" + rp_id + "' and "
                    + " name='" + in_name + "' and "
                    + " user='" + user_id + "' and "
                    + " data_type='" + step + "' and "
                    + " pro_id='" + pro_id + "'"
                    + "");



            datasql += db.setInsert(XMLDataModel.REPORT_DATA_TABLENAME, data_rep);







            if (request.getParameter("send_image") != null) {














                String[][] data_image = new String[][]{
                    {"report_id", "name", "order", "data_type", "user_name", "cid", "gid", "pro_id"},
                    {rp_id, request.getParameter("send_image"), "0", step, user_name, cid, gid, pro_id}};


                db.setDelete(XMLDataModel.REPORT_IMAGES_TABLENAME,
                        " report_id='" + rp_id + "' and "
                        + " name='" + request.getParameter("send_image") + "' and "
                        + " data_type='" + step + "' and "
                        + " pro_id='" + pro_id + "'"
                        + "");



                datasql += db.setInsert(XMLDataModel.REPORT_IMAGES_TABLENAME, data_image);


            }



        }

    } else {
        String status = "";
        String creation_date = "";

        if (request.getParameter("status") != null) {

            status = request.getParameter("status");
            creation_date = thisDate();
        }


        if (status.equals("0")) {
            creation_date = "";


        }

        String enddate = returnTime(request);

        String[][] data_update = new String[][]{
            {"p_status", "enddate", "creation_date"},
            {status, enddate, creation_date}};
        ;
        out.print(Arrays.deepToString(data_update));

        //creation_date


        datasql += db.setUpdate(XMLDataModel.REPORT_TABLENAME, data_update, " r_id='" + rp_id + "'");
        //creation_date

    }
    out.print(datasql);





%>

<%!    String returnTime(HttpServletRequest request) throws Exception {
        String returnData = "";
        java.util.Locale locale = request.getLocale();


        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", locale);


        returnData = "" + formatter.format(new java.util.Date());
        return returnData;

    }

%>



















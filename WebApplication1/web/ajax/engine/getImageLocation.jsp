<%@page import="java.util.Properties"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="lib.tools.Utils"%>
<%

    String stat = request.getParameter("stat");
    String separator = System.getProperty("file.separator");
    String moreData = "";

    if (stat.equalsIgnoreCase("group")) {
        moreData = "/group_images";
    } else if (stat.equalsIgnoreCase("cloud")) {
        moreData = "/cloud_images/";
    } else if (stat.equalsIgnoreCase("report")) {
        moreData = "/reporting/";
    } else if (stat.equalsIgnoreCase("exports")) {

        out.print(Utils.getModelFolder());
    } else if (stat.equalsIgnoreCase("working_directory")) {
        out.print(Utils.getModelFolderWorking_directory());
    }
    if (!stat.equalsIgnoreCase("exports") && !stat.equalsIgnoreCase("working_directory")) {
        out.print(Utils.getImageFolder() + moreData);
    }
%>
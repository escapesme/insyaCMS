<%@page import="java.sql.SQLException"%>
<%@page import="lib.tools.files"%>
<%@page import="xact.ServerNodeOperations"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String status = request.getParameter("status");
    String outData = "";
    String id = "";
    String[] rdata = null;
    String idins = "";
    ResultSet srdata = null;

    //<editor-fold defaultstate="collapsed" desc="Buffer">
    if (status.equalsIgnoreCase("getBufferexpot")) {

        db.openCon();
        id = request.getParameter("id");
        srdata = db.getData(XMLDataModel.LOGBUF_INST_TABLENAME, "*", "DB_INST_ID='" + id + "'");

        outData = "Pool Name,Pool Size ,Page size,Page Per IO,Logical Drive\n";

        while (srdata.next()) {

            rdata = db.getRowNocon(XMLDataModel.LOGBUF_DESC_TABLENAME, "ID='" + srdata.getString("LOGBUF_DESC_ID") + "'");
            outData += rdata[3];
            outData += "," + rdata[4];
            outData += "," + rdata[5];
            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("PGS_PER_IO")), 0);
            outData += "," + srdata.getString("LOGICAL_DRIVE_NAME");
            outData += "\n";

        }
        files f = new files();
        out.print(f.exportCSV("LogBuf-" + id + ".csv", outData, request, response));
        db.closeCon();
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Table">
    if (status.equalsIgnoreCase("tableDataexport")) {

        db.openCon();
        id = request.getParameter("id");
        srdata = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", "DB_NAMESPACE_INST_ID='" + id + "'");

        outData += " Table Name,Useful Size,Row Length,Cache Name,Other Access,Min IO Per Tran,Occupation Rate,Disk \n";

        while (srdata.next()) {
            rdata = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, "ID='" + srdata.getString("TABLE_DESC_ID") + "'");

            outData += rdata[1];
            double u = 0;

            if (!rdata[4].equalsIgnoreCase("") && !rdata[4].equalsIgnoreCase("") && !rdata[4].equalsIgnoreCase("null")) {

                u = Double.parseDouble(rdata[4]);

                if (u > 0) {
                    u = u / 1024;

                }

            }

            outData += "," + u;
            outData += "," + rdata[6];

            outData += "," + getCacheXref(srdata.getString("ID"));;

            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0);

            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("MIN_IO_PER_TRAN")), 0);
            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("OCCUP_RATE")), 0);
            outData += "," + srdata.getString("LOGICAL_DRIVE_NAME");
            outData += "\n";

        }

        files f = new files();
        out.print(f.exportCSV("Table-" + id + ".csv", outData, request, response));
        db.closeCon();
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Index">
    if (status.equalsIgnoreCase("indexDataexport")) {

        db.openCon();
        id = request.getParameter("id");

        ResultSet tablesrdata = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", "DB_NAMESPACE_INST_ID='" + id + "'");

        outData = "Index Name,Table Name,Useful Size,Row Length,Cache Name,Other Access,Min IO Per Tran,Occupation Rate,Index Type,Logical Disk Name\n";

        while (tablesrdata.next()) {

            rdata = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, "ID='" + tablesrdata.getString("TABLE_DESC_ID") + "'");

            String tbaleName = rdata[1];
            srdata = db.getData(XMLDataModel.INDEX_INST_TABLENAME, "*", "TABLE_INST_ID='" + tablesrdata.getString("id") + "'");

            while (srdata.next()) {

                rdata = db.getRowNocon(XMLDataModel.INDEX_DESC_TABLENAME, "ID='" + srdata.getString("INDEX_DESC_ID") + "'");
            //    String cache = "";

                /*
                
                 String cacheId = db.getRowNocon(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + srdata.getString("ID") + "'")[2];
                 if (cacheId != null) {
                 String cacheins = db.getRowNocon(XMLDataModel.CACHE_INST_TABLENAME, "ID='" + cacheId + "'")[1];
                 cache = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + cacheins + "'")[3];
                 }
                 */
                // outData += "<tr  data-insid='" + srdata.getString("ID") + "' data-decid='" + rdata[0] + "'  >";
                outData += rdata[1];
                outData += "," + tbaleName;
                outData += "," + rdata[3];
                outData += "," + rdata[5];
                outData += "," + getCacheXref(srdata.getString("ID"));
                outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0);
                outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("MIN_IO_PER_TRAN")), 0);
                outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("OCCUP_RATE")), 0);
                outData += "," + rdata[4];
                outData += "," + srdata.getString("LOGICAL_DRIVE_NAME");
                outData += "\n";

            }

        }

        files f = new files();
        out.print(f.exportCSV("Index-" + id + ".csv", outData, request, response));
        db.closeCon();
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Cache">
    if (status.equalsIgnoreCase("getCacheDataexport")) {

        db.openCon();
        id = request.getParameter("id");
        srdata = db.getData(XMLDataModel.CACHE_INST_TABLENAME, "*", "DB_INST_ID='" + id + "'");

        outData = "Cache Name,Cache Size (KB),Page Size (KB),Nb of Other IO,Nb Pages Per IO,CPU per IO (ms),Level\n";
        while (srdata.next()) {

            //id = request.getParameter("id");
            rdata = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + srdata.getString("CACHE_DESC_ID") + "'");
            //    outData += "<tr  data-insid='" + srdata.getString("ID") + "' data-decid='" + rdata[0] + "'  >";
            outData += rdata[3];
            outData += "," + rdata[4];
            outData += "," + rdata[5];
            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0);

            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("PGS_PER_IO")), 0);
            outData += "," + Utils.numberFormat(Double.parseDouble(srdata.getString("CPU")), 0);
            outData += ",0";
            outData += "\n";

        }

        files f = new files();
        out.print(f.exportCSV("cache-" + id + ".csv", outData, request, response));
        db.closeCon();

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="NAMESPACE">
    //</editor-fold>
    //</editor-fold>

%> 
<%!
    lib.engine.db.operations db = new lib.engine.db.operations();

    String getCacheXref(String ID) throws SQLException {

        String r = "";

        ResultSet srdata = db.getData(XMLDataModel.CACHE_XREF_TABLENAME, "*", "CACHE_USER_ID='" + ID + "'");
        while (srdata.next()) {

            if (srdata.getString("CACHE_INST_ID") != null) {
                if (!r.equals("")) {
                    r += ":";
                }
                String[] insData = db.getRowNocon(XMLDataModel.CACHE_INST_TABLENAME, "ID='" + srdata.getString("CACHE_INST_ID") + "'");
                String[] Data = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + insData[1] + "'");

                r += Data[3];
            }
        }

        //  db.closeCon();
        return r;

    }


%>







<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String Type = request.getParameter("type");
    String outData = "";
    String pro_id = request.getParameter("pro_id");;

    lib.engine.db.operations db = new lib.engine.db.operations();
//this is what is called when changing the namespace drop down list

    if (Type.equalsIgnoreCase("Namespace")) {
       

        String[] namedescs = db.getRow(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "PROJECT_ID='" + pro_id + "'");
        String[] namespace = db.getRow(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "DB_NAMESPACE_DESC_ID='" + namedescs[0] + "'");
        db.openCon();
        String descId = "";
        if (request.getParameter("desc_id") != null && !request.getParameter("desc_id").equalsIgnoreCase("null")) {
            descId = request.getParameter("desc_id");
        } else {
            descId = namespace[0];
        }



        outData += "<thead><th>Name</th><th>Cache</th><th>Row Length</th><th>Useful Size</th><th>Index Type</th><th>Default Index</th></thead>";


        HashMap<String, String> cacheList = new HashMap<String, String>();

        ResultSet itCache = db.getData(XMLDataModel.CACHE_DESC_TABLENAME, "*", "PROJECT_ID=" + pro_id);
        while (itCache.next()) {
            String cd = itCache.getString("CACHE_NAME");
            cacheList.put(cd, cd);
        }
// Cache value to be used with child rows         
        String cache = (String) cacheList.values().toArray()[0];
        ResultSet resTable = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", "DB_NAMESPACE_INST_ID='" + descId + "'");
        while (resTable.next()) {
            String[] tableDesc = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME,
                    "id=" + resTable.getString("TABLE_DESC_ID"));
            String[] cach = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME,
                    "ID='" + tableDesc[3] + "'");

            outData += "<tr><td>" + tableDesc[1] + "</td><td>" + cach[2] + "</td><td>" + tableDesc[6] + "</td><td>"
                    + tableDesc[4] + "</th><th>"
                    + tableDesc[5] + "</td><td>"
                    + tableDesc[8] + "</td></tr>";


            ResultSet resch = db.getData(XMLDataModel.INDEX_DESC_TABLENAME, "",
                    "TABLE_DESC_ID='" + tableDesc[0] + "'");

            while (resch.next()) {
                outData += "<tr class='chrow'><td class='chrowftd'>" + resch.getString("Name") + "</td><td>" + cache
                        + "</td><td>" + resch.getString("ROW_LEN") + "</td><td>"
                        + resch.getString("USEFUL_SIZE") + "</th><th>"
                        + resch.getString("INDEX_TYPE_NUM") + "</td><td>"
                        + resch.getString("DEFAULT_IND") + "</td></tr>";

            }
        }
        db.closeCon();
// fill the namespace drop down list
    } else if (Type.equalsIgnoreCase("Database_Namespaces")) {

        String[] namedescs = db.getRow(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "PROJECT_ID='" + pro_id + "'");
        String[] namespace = db.getRow(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "DB_NAMESPACE_DESC_ID='" + namedescs[0] + "'");
        db.openCon();
        String descId = "";
        //if the parameter desc_id is set use it, else use the first one in the drop down list
        if (request.getParameter("desc_id") != null && !request.getParameter("desc_id").equalsIgnoreCase("null")) {
            descId = request.getParameter("desc_id");
        } else {
            descId = namespace[0];
        }

        ResultSet res = db.getData(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "*", "PROJECT_ID='" + pro_id + "'");
        while (res.next()) {
            String[] namespaces = db.getRowNocon(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "DB_NAMESPACE_DESC_ID='" + res.getString("ID") + "'");
            outData += "<option value='" + namespaces[0] + "'>" + res.getString("Name") + "</option>";

        }
        outData += "<thead><th>Name</th><th>Cache</th><th>Row Length</th><th>Useful Size</th><th>Index Type</th><th>Default Index</th></thead>";

        HashMap<String, String> cacheList = new HashMap<String, String>();
        ResultSet itCache = db.getData(XMLDataModel.CACHE_DESC_TABLENAME, "*", "PROJECT_ID=" + pro_id);
        while (itCache.next()) {
            String cd = itCache.getString("CACHE_NAME");
            cacheList.put(cd, cd);
        }
// Cache value           
        String cache = (String) cacheList.values().toArray()[0];
        ResultSet resTable = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", "DB_NAMESPACE_INST_ID='" + descId + "'");
        while (resTable.next()) {
            String[] tableDesc = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME,
                    "id=" + resTable.getString("TABLE_DESC_ID"));
            String[] cach = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME,
                    "ID='" + tableDesc[3] + "'");

            outData += "<tr><td>" + tableDesc[1] + "</td><td>" + cach[2] + "</td><td>" + tableDesc[6] + "</td><td>"
                    + tableDesc[4] + "</th><th>"
                    + tableDesc[5] + "</td><td>"
                    + tableDesc[8] + "</td></tr>";


            ResultSet resch = db.getData(XMLDataModel.INDEX_DESC_TABLENAME, "",
                    "TABLE_DESC_ID='" + tableDesc[0] + "'");

            while (resch.next()) {
                outData += "<tr class='chrow'><td class='chrowftd'>" + resch.getString("Name") + "</td><td>" + cache
                        + "</td><td>" + resch.getString("ROW_LEN") + "</td><td>"
                        + resch.getString("USEFUL_SIZE") + "</th><th>"
                        + resch.getString("INDEX_TYPE_NUM") + "</td><td>"
                        + resch.getString("DEFAULT_IND") + "</td></tr>";

            }
        }
        db.closeCon();

    }
// display the database cache table
    if (Type.equalsIgnoreCase("Database_Cache")) {

        outData = "<thead><th>Name</th><th>Cache Size</th><th>Page Size</th></thead>";


        db.openCon();

        ResultSet resch = db.getData(XMLDataModel.CACHE_DESC_TABLENAME, "", "PROJECT_ID='" + pro_id + "'");
        while (resch.next()) {
            outData += "<tr><td>" + resch.getString("CACHE_NAME") + "</td><td>" + resch.getString("CACHE_SIZE") + "</td><td>" + resch.getString("PAGE_SIZE") + "</td></tr>";

        }

        db.closeCon();



    }

    //dispaly the log buffer table
    if (Type.equalsIgnoreCase("Log_Buffers")) {

        outData = "<thead><th style='width: 30%;'>Name</th><th>Pool Size</th><th>Page Size</th></thead>";
        db.openCon();
        ResultSet resch = db.getData(XMLDataModel.LOGBUF_DESC_TABLENAME, "", "PROJECT_ID='" + pro_id + "'");
        while (resch.next()) {
            outData += "<tr><td>" + resch.getString("NAME") + "</td><td>" + resch.getString("BUFPOOL_SIZE") + "</td><td>" + resch.getString("PAGE_SIZE") + "</td></tr>";

        }
        db.closeCon();
    }

    out.print(outData);

%>
<script>
    $(function(){
        
  
        
        
        var  pro_id="<%= pro_id%>";
        $(".NameSpaes").change(function(){
            datado(this,pro_id);
         
             
        })
    })</script>




<style>
    .chrowftd{

        padding-left: 20px;
        text-align: center;
    }
    .chrow{

        background: #fff;
    }
    td{
        text-align: center;
    }

</style>
<%@page import="lib.Options.DbInfo"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Catalog"%>
<%    
    String serverId = request.getParameter("serverId");
    String sataus = request.getParameter("status");
    lib.engine.db.operations db = new lib.engine.db.operations();
    String id = request.getParameter("id");
    String[] ids = id.split(",");
    String sid=ids[2];
    String []serverData=db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID="+serverId);
    String catIndex=serverData[5];
    if (sataus.equals("getCats")) {
          if (!sid.equals("null")) {
        catIndex = Utils.getScenarioPram(ids[3], sid, serverId, "CATALOG", serverData[5], "SERVER_INST");
    }
        Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
        ArrayList cats = c.ListCatalogs();
        String printData = "";
        printData += "<script>changeCatalogActions('" + serverId + "','"+id+"') </script><div class='mydata'><script></script>"
                + "<div >Catlog List</div><select class='catList' >";
        for (int i = 0; i < cats.size(); i++) {
            String selected="";
             if (Integer.parseInt(catIndex) == i) {
                selected = "selected='selected'";
            }
            printData += "<option value='" + i + "'"+selected+">" + cats.get(i) + "</option>";
            
        }
        printData += "</select>";
        
        printData += "</div><div class='do_right'><input type='button' id='0' class='CatalogUChange' value='Change'></div>";
        out.print(printData);
        
        
        
    } else if (sataus.equals("getCatsChange")) {
        String index = request.getParameter("catIndex");
        if (!sid.equals("null")) {
            String outData = "";
            out.print(sid + "scenario");
            String where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + serverId + "' and  S_PARAMETER='CATALOG' ";
            outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            
            String inData[][] = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, serverId, "CATALOG", catIndex, index, "SERVER_INST", ids[3]}};
            outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData);
            out.print(outData);
            
        }else{
        
        String udata[][] = {{"CATALOG"}, {index}};
        
        out.print(Arrays.deepToString(udata));
        
        out.print(db.setUpdate(XMLDataModel.SERVER_INST_TABLENAME, udata, "ID='" + serverId + "'"));
        }
        
    }
    
    
    
    
    
%>

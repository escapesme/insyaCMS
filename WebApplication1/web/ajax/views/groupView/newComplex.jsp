<%@page import="lib.Options.DbInfo"%>
<%@page import="lib.tools.Utils"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Processor"%>
<%@page import="cat.read.Catalog"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%
    String serverId = request.getParameter("serverId");


    String sataus = request.getParameter("status");
    lib.engine.db.operations db = new lib.engine.db.operations();

    String printData = "";

    String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID='" + serverId + "'");
    
    
    
    
    Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
    c.ListCatalogs();
    c.setCatByOffset(Integer.parseInt(serverData[5]));
    Manufacturer manufacturer = new Manufacturer(c);
    ArrayList cList = manufacturer.ListManufacturers();
    //manufacturer.setManufacturer(Integer.parseInt(htis_complex[9]));
    Processor uc = new Processor(c);
    ArrayList pList = uc.ListProcessors();
    // uc.setProcessors(Integer.parseInt(htis_complex[10]));
    ArrayList list = uc.getData();
    ArrayList param = (ArrayList) list.get(1);


    if (sataus.equals("create")) {





        printData += "<script>newComlexActions('" + serverId + "','"+serverData[5]+"'); </script><div class='mydata'>"
                + "";


        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">Name:</div><div class=\"frm_input\">"
                + "<input type=\"text\"  class=\"name\"  value='' /></div></div>";


        printData += "<input type=\"hidden\"  class=\"name1\"  value='Name1'/>";

        printData += " <input type=\"hidden\"  class=\"name2\"  value='Name2'/>";

        printData += "<input type=\"hidden\"  class=\"REAL_STORAGE\"  value='1000'/>";

        printData += " <input type=\"hidden\"  class=\"EXT_STORAGE\"  value='500'/>";




        printData +=  "<input type=\"hidden\"  class=\"comOption\" value='1' />";

        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">Virtual Platform:</div><div class=\"frm_input\">"
                + "<select class=\"Virtual_Platform\"  >"
                + "<option value='-1'>None</option>"
                + "<option value='0'>Virtual Server</option>"
                + "<option value='1'>VMware</option>"
                + "<option value='2'>XenEnterprise</option>"
                + "</select>"
                + "</div></div>";




        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">Constructor</div><div class=\"frm_input\">"
                + "<select class=\"CAT_CONSTRUCTOR_INDEX\">";
        for (int i = 0; i < cList.size(); i++) {
            printData += "<option value='" + i + "'>" + cList.get(i) + "</option>";
        }
        printData += "</select>"
                + "</div></div>";



        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">CPU: </div><div class=\"frm_input\">"
                + "<select class=\"CAT_CPU_INDEX\"  >";
        for (int i = 0; i < pList.size(); i++) {
            printData += "<option value='" + i + "'>" + pList.get(i) + "</option>";
        }
        printData += "</select>"
                + "</div></div>";




        printData += "</div><div class='do_center'>"
                + "<input type='button' class='newComOk' value='Ok'>"
                + "<input type='button'  class='newComCancel' value='Cancel'>"
                + "</div>";
        out.print(printData);
    } else if (sataus.equals("save")) {





        String name = request.getParameter("name");
        String REAL_STORAGE = request.getParameter("REAL_STORAGE");
        String name1 = request.getParameter("name1");
        String name2 = request.getParameter("name2");
        String option = request.getParameter("comOption");


        String EXT_STORAGE = request.getParameter("EXT_STORAGE");
        String Virtual_Platform = request.getParameter("Virtual_Platform");

        
        String ID = Utils.getNewID();
        String MODEL_ID = serverData[2];


        String CAT_CONSTRUCTOR_INDEX = request.getParameter("CAT_CONSTRUCTOR_INDEX");

        
        
        
        String CAT_CPU_INDEX = request.getParameter("CAT_CPU_INDEX");
        
        
        
        
        
        uc.setProcessors(Integer.parseInt(CAT_CPU_INDEX));

        int n_pro = Integer.parseInt((String)(uc.getData().get(2).toArray())[1]);
        
        
        
        
        
        String comType = "1";
       /* if (n_pro == 1) {
            comType = "UP";


        } else if (n_pro > 1) {

            comType = "MP";

        }

*/


        String[][] mydata = {
            {"ID", "MODEL_ID", "SERVER_INST_ID", "NAME", "NAME1", "NAME2", "VSNAME", "OPTION", "CAT_CONSTRUCTOR_INDEX", "CAT_CPU_INDEX", "REAL_STORAGE", "EXT_STORAGE", "NUM_PROCESSORS", "COMPLEX_TYPE", "PART_TYPE", "CAT_TYPE", "TOT_LOGICAL_PROC", "START_IO_OVHD", "PROC_IO_OVHD", "PERIPH_IO_OVHD", "AUX_IO_OVHD", "ES_PG_XFER"},
            {ID, MODEL_ID, serverId, name, name1, name2, Virtual_Platform, option, CAT_CONSTRUCTOR_INDEX, CAT_CPU_INDEX, REAL_STORAGE, EXT_STORAGE, "" + n_pro, "" + comType,
                "0", "3", "0", "0", "0", "0", "0", "0"}
        };
      printData += db.setInsert(XMLDataModel.COMPLEX_INST_TABLENAME, mydata);
       // out.print(n_pro);
       out.print(ID);
    }


%>

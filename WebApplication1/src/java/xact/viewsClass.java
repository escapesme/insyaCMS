/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class viewsClass {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /*
    
    
     select 
     SQL_APPLICATION_DESC.NAME AS SQL_APPLICATION_DESC_NAME
     ,SQL_COMPONENT_DESC.`NAME`  AS SQL_COMPONENT_DESC_NAME
     ,SQL_COMPONENT_INST.ORDER_FREQ  AS SQL_COMPONENT_INST_ORDER_FREQ
     ,SQL_COMPONENT_DESC.WEIGHT  AS SQL_COMPONENT_DESC_WEIGHT 

     ,BASE_SQL_DESC.`NAME`  AS BASE_SQL_DESC_NAME
     ,BASE_SQL_DESC.TABLE_DESC_ID  AS BASE_SQL_DESC_TABLE_DESC_ID
     ,BASE_SQL_DESC.INDEX_DESC_ID  AS BASE_SQL_DESC_INDEX_DESC_ID
     ,BASE_SQL_DESC.NUM_MONOTONIES AS BASE_SQL_DESC_NUM_MONOTONIES
     ,BASE_SQL_INST.JOIN_MISSES AS BASE_SQL_INST_JOIN_MISSES 
     ,BASE_SQL_INST.DISPERSMENT AS BASE_SQL_INST_DISPERSMENT 
     ,BASE_SQL_DESC.ORDER_TYPE AS BASE_SQL_DESC_ORDER_TYPE
     ,BASE_SQL_INST.PREFETCH AS BASE_SQL_INST_PREFETCH
     ,BASE_SQL_INST.ORDER_FREQ AS BASE_SQL_INST_ORDER_FREQ
     ,COMPLEX_SQL_DESC.`NAME` AS COMPLEX_SQL_DESC_NAME
     ,COMPLEX_SQL_DESC.`TYPE` AS COMPLEX_SQL_DESC_TYPE
     ,COMPLEX_SQL_INST.ORDER_FREQ AS COMPLEX_SQL_INST_ORDER_FREQ
     from APPLICATION_COMPONENT_INST
     LEFT JOIN   SQL_APPLICATION_INST ON(SQL_APPLICATION_INST.AC_INST_ID=APPLICATION_COMPONENT_INST.ID)
     LEFT JOIN  SQL_APPLICATION_DESC ON(SQL_APPLICATION_DESC.ID=SQL_APPLICATION_INST.SQL_APPLICATION_DESC_ID)
     LEFT JOIN  SQL_COMPONENT_INST ON(SQL_COMPONENT_INST.SQL_APPLICATION_INST_ID=SQL_APPLICATION_INST.ID)
     LEFT JOIN  SQL_COMPONENT_DESC ON(SQL_COMPONENT_INST.SQL_COMPONENT_DESC_ID=SQL_COMPONENT_DESC.ID)
     LEFT JOIN   BASE_SQL_INST ON(SQL_COMPONENT_INST.ID=BASE_SQL_INST.SQL_COMPONENT_INST_ID)
     LEFT JOIN  BASE_SQL_DESC ON(BASE_SQL_DESC.ID=BASE_SQL_INST.BASE_SQL_DESC_ID)
     LEFT JOIN    COMPLEX_SQL_INST ON(COMPLEX_SQL_INST.SQL_COMPONENT_INST_ID=SQL_COMPONENT_INST.ID)
     LEFT JOIN   COMPLEX_SQL_DESC ON(COMPLEX_SQL_DESC.ID=COMPLEX_SQL_INST.COMPLEX_SQL_DESC_ID)
     WHERE APPLICATION_COMPONENT_INST.LOGICAL_SERVER_INST_ID= 1392422637834 ORDER BY SQL_APPLICATION_DESC_NAME, SQL_COMPONENT_DESC_NAME,BASE_SQL_DESC_NAME
     */
    public String SQLEXPORT(String LOGICAL_SERVER_INST_ID) {
//
        String SQL = " select \n"
                + "`" + XMLDataModel.SQL_APPLICATION_DESC_TABLENAME + "`.NAME AS SQL_APPLICATION_DESC_NAME\n"
                + ",`" + XMLDataModel.SQL_COMPONENT_DESC_TABLENAME + "`.`NAME`  AS SQL_COMPONENT_DESC_NAME\n"
                + ",`" + XMLDataModel.SQL_COMPONENT_INST_TABLENAME + "`.ORDER_FREQ  AS SQL_COMPONENT_INST_ORDER_FREQ\n"
                + ",`" + XMLDataModel.SQL_COMPONENT_DESC_TABLENAME + "`.WEIGHT  AS SQL_COMPONENT_DESC_WEIGHT \n"
                + ",`" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "`.`NAME`  AS BASE_SQL_DESC_NAME\n"
                + ",`" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "`.TABLE_DESC_ID  AS BASE_SQL_DESC_TABLE_DESC_ID\n"
                + ",`" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "`.INDEX_DESC_ID  AS BASE_SQL_DESC_INDEX_DESC_ID\n"
                + ",`" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "`.NUM_MONOTONIES AS BASE_SQL_DESC_NUM_MONOTONIES\n"
                + ",`" + XMLDataModel.BASE_SQL_INST_TABLENAME + "`.JOIN_MISSES AS BASE_SQL_INST_JOIN_MISSES \n"
                + ",`" + XMLDataModel.BASE_SQL_INST_TABLENAME + "`.DISPERSMENT AS BASE_SQL_INST_DISPERSMENT \n"
                + ",`" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "`.ORDER_TYPE AS BASE_SQL_DESC_ORDER_TYPE\n"
                + ",`" + XMLDataModel.BASE_SQL_INST_TABLENAME + "`.PREFETCH AS BASE_SQL_INST_PREFETCH\n"
                + ",`" + XMLDataModel.BASE_SQL_INST_TABLENAME + "`.ORDER_FREQ AS BASE_SQL_INST_ORDER_FREQ\n"
                + ",`" + XMLDataModel.COMPLEX_SQL_DESC_TABLENAME + "`.`NAME` AS COMPLEX_SQL_DESC_NAME\n"
                + ",`" + XMLDataModel.COMPLEX_SQL_DESC_TABLENAME + "`.`TYPE` AS COMPLEX_SQL_DESC_TYPE\n"
                + ",`" + XMLDataModel.COMPLEX_SQL_INST_TABLENAME + "`.ORDER_FREQ AS COMPLEX_SQL_INST_ORDER_FREQ \n"
                + "from  `" + XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME + "`  \n"
                + "LEFT JOIN `" + XMLDataModel.SQL_APPLICATION_INST_TABLENAME + "` ON(`" + XMLDataModel.SQL_APPLICATION_INST_TABLENAME + "`.AC_INST_ID= `" + XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME + "`.ID)\n"
                + "LEFT JOIN `" + XMLDataModel.SQL_APPLICATION_DESC_TABLENAME + "` ON(`" + XMLDataModel.SQL_APPLICATION_DESC_TABLENAME + "`.ID=`" + XMLDataModel.SQL_APPLICATION_INST_TABLENAME + "`.SQL_APPLICATION_DESC_ID)\n"
                + "LEFT JOIN `" + XMLDataModel.SQL_COMPONENT_INST_TABLENAME + "`  ON(`" + XMLDataModel.SQL_COMPONENT_INST_TABLENAME + "`.SQL_APPLICATION_INST_ID=`" + XMLDataModel.SQL_APPLICATION_INST_TABLENAME + "`.ID)\n"
                + "LEFT JOIN `" + XMLDataModel.SQL_COMPONENT_DESC_TABLENAME + "`  ON(`" + XMLDataModel.SQL_COMPONENT_INST_TABLENAME + "`.SQL_COMPONENT_DESC_ID=`" + XMLDataModel.SQL_COMPONENT_DESC_TABLENAME + "`.ID)\n"
                + "LEFT JOIN `" + XMLDataModel.BASE_SQL_INST_TABLENAME + "` ON(`" + XMLDataModel.SQL_COMPONENT_INST_TABLENAME + "`.ID=`" + XMLDataModel.BASE_SQL_INST_TABLENAME + "`.SQL_COMPONENT_INST_ID)\n"
                + "LEFT JOIN `" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "` ON(`" + XMLDataModel.BASE_SQL_DESC_TABLENAME + "`.ID=`" + XMLDataModel.BASE_SQL_INST_TABLENAME + "`.BASE_SQL_DESC_ID)\n"
                + " LEFT JOIN `" + XMLDataModel.COMPLEX_SQL_INST_TABLENAME + "`  ON(COMPLEX_SQL_INST.SQL_COMPONENT_INST_ID=`" + XMLDataModel.SQL_COMPONENT_INST_TABLENAME + "`.ID)\n"
                + "LEFT JOIN `" + XMLDataModel.COMPLEX_SQL_DESC_TABLENAME + "` ON(`" + XMLDataModel.COMPLEX_SQL_DESC_TABLENAME + "`.ID=COMPLEX_SQL_INST.COMPLEX_SQL_DESC_ID)\n"
                + "WHERE  `" + XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME + "` .LOGICAL_SERVER_INST_ID=" + LOGICAL_SERVER_INST_ID + " ORDER BY SQL_APPLICATION_DESC_NAME, SQL_COMPONENT_DESC_NAME,BASE_SQL_DESC_NAME";

        return SQL;
    }

    public void ImplmentationView() {

        String myGet = "`" + XMLDataModel.LINE_TABLENAME + "`.`ID` AS `ID`,`" + XMLDataModel.LINE_TABLENAME + "`.`MODEL_ID` AS `MODEL_ID`,`" + XMLDataModel.NET_GROUP_TABLENAME + "`.`LOCATION_ID` AS `LOCATION_ID1`,`NET_GROUP_1`.`LOCATION_ID` AS `LOCATION_ID2`";
        String myfrom = "((((`" + XMLDataModel.LINE_TABLENAME + "` join `" + XMLDataModel.NODE_TABLENAME + "` on((`" + XMLDataModel.LINE_TABLENAME + "`.`NODE_ID1` = `NODE`.`ID`)))"
                + "join `" + XMLDataModel.NODE_TABLENAME + "` `NODE_1` on((`" + XMLDataModel.LINE_TABLENAME + "`.`NODE_ID2` = `NODE_1`.`ID`)))"
                + "join `" + XMLDataModel.NET_GROUP_TABLENAME + "` on((`" + XMLDataModel.NODE_TABLENAME + "`.`GROUP_ID` = `" + XMLDataModel.NET_GROUP_TABLENAME + "`.`ID`)))"
                + "join `" + XMLDataModel.NET_GROUP_TABLENAME + "` `NET_GROUP_1` on((`NODE_1`.`GROUP_ID` = `NET_GROUP_1`.`ID`)))";

        String mywhere = "(`" + XMLDataModel.NET_GROUP_TABLENAME + "`.`LOCATION_ID` <> `NET_GROUP_1`.`LOCATION_ID`)";
        db.creatview(XMLDataModel.CONNECTORS_TABLENAME, myGet, myfrom, mywhere);

    }

    public void serverdata() {

        String myGet
                = " `" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`ID` AS `ID`, "
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`DISK_STRING_INST_ID` AS `DISK_STRING_INST_ID`,"
                + " `" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`MODEL_ID` AS `MODEL_ID`,"
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`NAME` AS `NAME`,"
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`WRITE_TYPE` AS `WRITE_TYPE`,"
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`DUAL_COPY` AS `DUAL_COPY`, "
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`NUM_ACTUATORS` AS `NUM_ACTUATORS`, "
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`DEVICE_TYPE` AS `DEVICE_TYPE`, "
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`CHNL_PATH_GRP` AS `CHNL_PATH_GRP`, "
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`MAP_INDEX` AS `MAP_INDEX`, "
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`HOT_SPOT` AS `HOT_SPOT`,"
                + "`" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`DEVICE_BUF` AS `DEVICE_BUF`,"
                + "`" + XMLDataModel.DISK_PROXY_TABLENAME + "`.`LOGICAL_DRIVE_INST_ID` AS `LOGICAL_DRIVE_INST_ID`";
        String myfrom = "`" + XMLDataModel.DISK_PROXY_TABLENAME + "` , `" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "` ";
        String mywhere = "(`" + XMLDataModel.DISK_PROXY_TABLENAME + "`.`DISK_GROUP_INST_ID` = `" + XMLDataModel.DISK_GROUP_INST_TABLENAME + "`.`ID`)";
        db.creatview(XMLDataModel.LOGICAL_DRIVE_VIEW_ITEM_TABLENAME, myGet, myfrom, mywhere);

    }

    public void impactpathView(String parentID) {

        /*cheild
         * 
         * 
         * 
         String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
         + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
         + "on(`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`FROM_ID` or `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`TO_ID`))";
        
         String mywhere = "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID`='" + parentID + "'";
        
        
         String myGet = "" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + ".ID AS `nodes_ID`,"
         + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`Name` AS `Name`,"
         + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TAG` AS `TAG`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`ID`AS `link_ID1`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`FROM_ID` AS `FROM_ID`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`PARENT_ID` AS `PARENT_ID`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`TO_ID` AS `TO_ID`,"
         + "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID` AS `PID`";
         * 
         *      String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
         + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
         + "on(`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`FROM_ID` or `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`TO_ID`))";
        
         String mywhere = "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID`='" + parentID + "'";
        
        
         String myGet = "" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + ".ID AS `nodes_ID`,"
         + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`Name` AS `Name`,"
         + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TAG` AS `TAG`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`ID`AS `link_ID1`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`FROM_ID` AS `FROM_ID`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`PARENT_ID` AS `PARENT_ID`,"
         + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`TO_ID` AS `TO_ID`,"
         + "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID` AS `PID`";
        
         * 
         * 
         */
        String returnData = "";
        String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`FROM_ID` or `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`TO_ID`))";
        String mywhere = "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID`='" + parentID + "'";
        String myGet = "" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + ".ID AS `nodes_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`Name` AS `Name`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TAG` AS `TAG`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`ID`AS `link_ID1`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`FROM_ID` AS `FROM_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`PARENT_ID` AS `PARENT_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`TO_ID` AS `TO_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID` AS `PID`";

        returnData += db.creatview(XMLDataModel.SERVICE_DATA_VIEW, myGet, myfrom, mywhere);

    }

    public void group() {

        String myGet = "`" + XMLDataModel.LINE_TABLENAME + "`.`ID` AS `ID`,`" + XMLDataModel.LINE_TABLENAME + "`.`MODEL_ID`"
                + " AS `MODEL_ID`,`" + XMLDataModel.LINE_TABLENAME + "`.`NODE_ID1` AS `NODE_ID1`,`" + XMLDataModel.LINE_TABLENAME + "`.`NODE_ID2` AS `NODE_ID2`,`" + XMLDataModel.NODE_TABLENAME + "`.`GROUP_ID` "
                + "AS `GROUP_ID1`,`node_1`.`GROUP_ID` AS `GROUP_ID2`";
        String myfrom = "((`" + XMLDataModel.LINE_TABLENAME + "` join `" + XMLDataModel.NODE_TABLENAME + "` on((`" + XMLDataModel.LINE_TABLENAME + "`.`NODE_ID1` = `NODE`.`ID`)))"
                + " join `" + XMLDataModel.NODE_TABLENAME + "` `node_1` on((`" + XMLDataModel.LINE_TABLENAME + "`.`NODE_ID2` = `node_1`.`ID`)))";
        String mywhere = " ((`" + XMLDataModel.NODE_TABLENAME + "`.`ID` <> `node_1`.`ID`) and (`" + XMLDataModel.NODE_TABLENAME + "`.`GROUP_ID` <> `node_1`.`GROUP_ID`))";

        db.creatview(XMLDataModel.GROUP_CONNECTORS_TABLENAME, myGet, myfrom, mywhere);

    }

    public void services(String parentID) {

        String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`FROM_ID` or `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`TO_ID`))";

        /*
         String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
         + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
         + ")";*/
        String mywhere = "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID`='" + parentID + "'";

        String myGet = "" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + ".ID AS `nodes_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`Name` AS `Name`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TAG` AS `TAG`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`ID`AS `link_ID1`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`FROM_ID` AS `FROM_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`PARENT_ID` AS `PARENT_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`TO_ID` AS `TO_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID` AS `PID`";

        db.creatview(XMLDataModel.SERVICE_DATA_VIEW, myGet, myfrom, mywhere);

    }
}

/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package lib.Options;

/**
 *
 * @author A7med
 */
public class XMLDataModel {

    public static final String[] DEBUGTYPE = {"corporate", "be to bp", "be to be", "implementation", "locations", "locationConnectors", "service view", "sv-nodes", "sv-edges", "sv-child-nodes", "group view", "gv-nodes", "gv-group-nodes"};
    public static final String[] ORIGINAL_FILES={"NT-configb","Unix-configb","MVS-configb","HANA-config","WITO","NITO_D","cisco_D","MECA","VEHI"};
    public static final String successClass = "success";
    public static final String STATUS = "upper";
    public static final String COMPUTE_MSG_LOG_TABLENAME = "COMPUTE_MSG_LOG".toUpperCase();
    public static final String LOGINDATA_TABLENAME = "audit_log".toUpperCase();
    public static final String ACTION_TABLENAME = "ACTION".toUpperCase();
    public static final String ACTION_RULE_TABLENAME = "ACTION_RULE".toUpperCase();
    public static final String APPLICATION_COMPONENT_TABLENAME = "APPLICATION_COMPONENT".toUpperCase();
    public static final String AUTHORIZATION_TABLENAME = "AUTHORIZATION".toUpperCase();
    public static final String BC_BC_TABLENAME = "BC_BC".toUpperCase();
    public static final String BC_BP_TABLENAME = "BC_BP".toUpperCase();
    public static final String BE_BE_TABLENAME = "BE_BE".toUpperCase();
    public static final String BE_BP_TABLENAME = "BE_BP".toUpperCase();
    public static final String BP_BC_TABLENAME = "BP_BC".toUpperCase();
    public static final String BP_BP_TABLENAME = "BP_BP".toUpperCase();
    public static final String BPMN_TABLENAME = "BPMN".toUpperCase();
    public static final String BUSINESS_COMPONENT_TABLENAME = "BUSINESS_COMPONENT".toUpperCase();
    public static final String COMPUTE_CONTROL_TABLENAME = "compute_control".toUpperCase();
    public static final String BUSINESS_ENTITY_TABLENAME = "BUSINESS_ENTITY".toUpperCase();
    public static final String BUSINESS_PROCESS_TABLENAME = "BUSINESS_PROCESS".toUpperCase();
        public static final String COUNTER_TABLENAME = "COUNTER".toUpperCase();

    
    
    
    
    public static final String CORPORATE_TABLENAME = "CORPORATE".toUpperCase();
    public static final String CORPORATE_BE_TABLENAME = "CORPORATE_BE".toUpperCase();
    public static final String COST_TABLENAME = "COST".toUpperCase();
    public static final String COST_TYPE_TABLENAME = "COST_TYPE".toUpperCase();
    public static final String DIAGNOSIS_TABLENAME = "DIAGNOSIS".toUpperCase();
    public static final String DIAGNOSIS_RULE_TABLENAME = "DIAGNOSIS_RULE".toUpperCase();
    public static final String GROUP_TABLENAME = "NET_GROUP".toUpperCase();
    public static final String GROUP_TYPE_TABLENAME = "GROUP_TYPE".toUpperCase();

    public static final String logbuff_desc_TABLENAME = "logbuff_desc".toUpperCase();
    public static final String buffer_inst_TABLENAME = "buffer_inst".toUpperCase();

    public static final String cache_desc_TABLENAME = "cache_desc".toUpperCase();
    public static final String cache_inst_TABLENAME = "cache_inst".toUpperCase();

    public static final String JPOX_TABLES_TABLENAME = "JPOX_TABLES".toUpperCase();
    public static final String LINE_TABLENAME = "LINE".toUpperCase();
    public static final String LOCATION_TABLENAME = "LOCATION".toUpperCase();
    public static final String MESSAGE_TABLENAME = "MESSAGE".toUpperCase();
    public static final String MODEL_TABLENAME = "MODEL".toUpperCase();
    public static final String NODE_TABLENAME = "NODE".toUpperCase();
    public static final String NODE_EXT_TABLENAME = "NODE_EXTENSION".toUpperCase();
    public static final String PRICE_TABLENAME = "PRICE".toUpperCase();
    public static final String PATH_TEMPLATE_TABLENAME = "PATH_TEMPLATE".toLowerCase();
    public static final String PROFILE_TABLENAME = "PROFILE".toLowerCase();
    public static final String RULE_TABLENAME = "RULE".toUpperCase();
    public static final String SEGMENT_TABLENAME = "SEGMENT".toUpperCase();
    public static final String SEQUENCE_TABLE_TABLENAME = "SEQUENCE_TABLE".toUpperCase();
    public static final String SERVICE_TABLENAME = "SERVICE".toUpperCase();
    public static final String SLG_TABLENAME = "SLG".toUpperCase();
    public static final String USER_TABLENAME = "USER".toLowerCase();
    public static final String USER_PROFILE_TABLENAME = "USER_PROFILE".toLowerCase();
    public static final String CONNECTORS_TABLENAME = "CONNECTORS".toUpperCase();
    public static final String GROUP_CONNECTORS_TABLENAME = "GROUP_CONNECTORS".toUpperCase();
    public static final String SCENARIO_TABLENAME = "SCENARIO".toUpperCase();
    public static final String SCENARIO_PARAMETERS_TABLENAME = "SCENARIO_PARAMETERS".toUpperCase();
    public static final String ACTIVITY_AC_XREF_TABLENAME = "ACT_AC_XREF".toUpperCase();
    /**
     * Following definitions added using views instead of tables to provide
     * access to the SERVICE_PROCESS_NODES table by object types.
     */
    public static final String SERVICE_PROCESS_TABLENAME = "SERVICE_PROCESS".toUpperCase();
    public static final String SERVICE_COMPONENT_TABLENAME = "SERVICE_COMPONENT".toUpperCase();
    public static final String SERVICE_TASKS_TABLENAME = "SERVICE_TASKS".toUpperCase();
    public static final String SERVICE_ACTIVITY_TABLENAME = "SERVICE_ACTIVITY".toUpperCase();
    public static final String SERVICE_SERVICE_TABLENAME = "SERVICE_SERVICE".toUpperCase();
    public static final String SERVICE_LINK_TABLENAME = "SERVICE_PROCESS_LINKS".toUpperCase();
    public static final String ACTIVITY_AC_TABLENAME = "ACT_AC_XREF".toUpperCase();
    public static final String SERVICE_END_TABLENAME = "SERVICE_END".toUpperCase();
    public static final String SERVICE_START_TABLENAME = "SERVICE_START".toUpperCase();
    public static final String SERVICE_2_SERVICE_TABLE = "S2S_XREF".toUpperCase();
    public static final String SERVICE_INSERTION_TABLENAME = "SERVICE_INSERTION".toUpperCase();
    public static final String SERVICE_COLLECTOR_TABLENAME = "SERVICE_COLLECTOR".toUpperCase();
    public static final String AC_RATIOS_TABLENAME = "AC_RATIOS".toUpperCase();
    public static final String AVAILABILITY_EVENT_LOG_TABLENAME = "AVAILABILITY_EVENT_LOG".toUpperCase();
    public static final String BP_ADJ_THROUGHPUT_TABLENAME = "BP_ADJ_THROUGHPUT".toUpperCase();
    public static final String BP_THROUGHPUT_RESULTS_TABLENAME = "BP_THROUGHPUT_RESULTS".toUpperCase();
    public static final String CAPACITY_PLAN_TABLENAME = "CAPACITY_PLAN".toUpperCase();
    public static final String CHANNEL_INST_TABLENAME = "CHANNEL_INST".toUpperCase();
    public static final String CHILD_NODE_VIEW_TABLENAME = "CHILD_NODE_VIEW".toUpperCase();
    public static final String CHNL_INST_TABLENAME = "CHNL_INST".toUpperCase();
    public static final String CHNL_NUMBERS_INST_TABLENAME = "CHNL_NUMBERS_INST".toUpperCase();
    public static final String CORPORATE_SETTING_TABLENAME = "CORPORATE_SETTING".toLowerCase();
    public static final String CP_TRAFFIC_INST_TABLENAME = "CP_TRAFFIC_INST".toUpperCase();
    public static final String CU_OVERHEAD_INST_TABLENAME = "CU_OVERHEAD_INST".toUpperCase();
    public static final String DC_LIST_INST_TABLENAME = "DC_LIST_INST".toUpperCase();
    public static final String DEF_INSTALL_TABLENAME = "DEF_INSTALL".toLowerCase();
    public static final String DEF_MENUREL_TABLENAME = "DEF_MENUREL".toLowerCase();
    public static final String DEF_MENUS_TABLENAME = "DEF_MENUS".toLowerCase();
    public static final String DEF_MENUSITEMS_TABLENAME = "DEF_MENUSITEMS".toLowerCase();
    public static final String DEF_MODULES_TABLENAME = "DEF_MODULES".toLowerCase();
    public static final String DEF_TEMPLATES_TABLENAME = "TEMPLATES".toLowerCase();
    public static final String DETAIL_RESULTS_TABLENAME = "DETAIL_RESULTS".toUpperCase();
    public static final String DISK_GROUP_INST_TABLENAME = "DISK_GROUP_INST".toUpperCase();
    public static final String DISK_INST_TABLENAME = "DISK_INST".toUpperCase();
    public static final String DISK_STRING_INST_TABLENAME = "DISK_STRING_INST".toUpperCase();
    public static final String DVCTR_INST_TABLENAME = "DVCTR_INST".toUpperCase();
    public static final String GROUP_SVC_RATES_TABLENAME = "GROUP_SVC_RATES".toUpperCase();
    public static final String HOST_DIR_INST_TABLENAME = "HOST_DIR_INST".toUpperCase();
    public static final String IMPCTPATH_TABLENAME = "IMPCTPATH".toUpperCase();
    public static final String IMPELEMENTATION_SETTING_TABLENAME = "implementation_setting".toLowerCase();
    public static final String LBANK_INST_TABLENAME = "LBANK_INST".toUpperCase();
    public static final String LOGICAL_DISK_SUBSYSTEM_INST_TABLENAME = " LOGICAL_DISK_SUBSYSTEM_INST".toUpperCase();
    public static final String MBXUTIL_INST_TABLENAME = "MBXUTIL_INST".toUpperCase();
    public static final String MBX_DIST_INST_TABLENAME = "MBXUTIL_INST".toUpperCase();
    public static final String MYDD252_TABLENAME = "MYDD2522".toUpperCase();
    public static final String NET_GROUP_TABLENAME = "NET_GROUP".toUpperCase();
    public static final String CLOUD_TABLENAME = "cloud".toLowerCase();
    public static final String CLOUD_LOC_XREF_TABLENAME = "cloud_loc_xref".toLowerCase();
    public static final String NEW_BP_THROUGHPUT_RESULTS_TABLENAME = "NEW_BP_THROUGHPUT_RESULTS".toUpperCase();
    public static final String NEW_DETAIL_RESULTS_TABLENAME = "NEW_DETAIL_RESULTS".toUpperCase();
    public static final String PARAMSYSTEM_TABLENAME = "PARAMSYSTEM".toUpperCase();
    public static final String PARENTS_TABLENAME = "PARENTS".toUpperCase();
    public static final String PD_LIST_INST_TABLENAME = "PD_LIST_INST_inst".toUpperCase();
    public static final String PGROUP_INST_TABLENAME = "PGROUP_INST".toUpperCase();
    public static final String PHUNIT_INST_TABLENAME = "PHUNIT_INST".toUpperCase();
    public static final String PMXREF_TABLENAME = "PMXREF".toUpperCase();
    public static final String PROJECT_TABLENAME = "PROJECT".toUpperCase();
    public static final String RBANK_INST_TABLENAME = "RBANK_INST".toUpperCase();
    public static final String REPORT_TEMPLATES_TABLENAME = "REPORT_TEMPLATES".toUpperCase();
    public static final String RESOURCE_BPRT_TABLENAME = "RESOURCE_BPRT".toUpperCase();
    public static final String S2S_XREF_TABLENAME = "S2S_XREF".toUpperCase();
    public static final String SECTOR_INST_TABLENAME = "SECTOR_INST".toUpperCase();
    public static final String SEGEMENT_TABLENAME = "SEGMENT".toUpperCase();
    public static final String SERVER_INST_TABLENAME = "SERVER_INST".toUpperCase();
    public static final String SERVICE_ACRT_TABLENAME = "SERVICE_ACRT".toUpperCase();
    public static final String SERVICE_BPRT_TABLENAME = "SERVICE_BPRT".toUpperCase();
    public static final String SERVICE_CPC_TABLENAME = "SERVICE_CPC".toUpperCase();
    public static final String SERVICE_DISK_TABLENAME = "SERVICE_DISK".toUpperCase();
    public static final String SERVICE_PROCESS_CHILDREN_TABLENAME = "SERVICE_PROCESS_CHILDREN".toUpperCase();
    public static final String SERVICE_PROCESS_NODES_TABLENAME = "SERVICE_PROCESS_NODES".toUpperCase();
    public static final String SP_RESULTS_TABLENAME = "SP_RESULTS".toUpperCase();
    public static final String new_svr_use_results_TABLENAME = "new_svr_use_results".toUpperCase();
    public static final String STRING_CONNEX_INST_TABLENAME = " STRING_CONNEX_INST".toUpperCase();
    public static final String STYLES_TABLENAME = "STYLES".toLowerCase();
    public static final String SVR_USE_RESULTS_TABLENAME = "SVR_USE_RESULTS".toUpperCase();
    public static final String TRAFFIC_INST_TABLENAME = "TRAFFIC_INST".toUpperCase();
    public static final String UNIT_NUM_YABLE_INST_TABLENAME = "UNIT_NUM_YABLE_INST".toUpperCase();
    public static final String VERTUAL_STRING_INST_TABLENAME = "VERTUAL_STRING_INST".toUpperCase();
    public static final String VKCU_INST_TABLENAME = "VKCU_INST".toUpperCase();
    public static final String VCKU_OVERHEAD_INST_TABLENAME = "VCKU_OVERHEAD_INST".toUpperCase();
    public static final String SERVICE_DATA_VIEW = "SERVICEDATAVIEW".toUpperCase();
    public static final String COST_RESULTS_TABLENAME = "COST_RESULTS".toUpperCase();
    /**
     * Following definitions added to support MDL in the X-Act database.
     */
    public static final String REPORT_DATA_TABLENAME = "report_data".toLowerCase();
    public static final String REPORT_IMAGES_TABLENAME = "report_images".toLowerCase();
    public static final String REPORT_TABLENAME = "report".toLowerCase();
    public static final String REPORT_F_TEXT_TABLENAME = "report_f_text".toLowerCase();
    public static final String GROUP_SVC_RATES_INST_TABLENAME = "GROUP_SVC_RATES_INST".toUpperCase();
    public static final String CONTROL_UNIT_INST_TABLENAME = "CONTROL_UNIT_INST".toUpperCase();
    public static final String CHTPS_INST_TABLENAME = "CHTPS_INST".toUpperCase();
    public static final String COMPLEX_INST_TABLENAME = "COMPLEX_INST".toUpperCase();
    public static final String CHPATHG_INST_TABLENAME = "CHPATHG_INST".toUpperCase();
    public static final String VKCU_OVERHEAD_INST_TABLENAME = "VKCU_OVERHEAD_INST".toUpperCase();
    public static final String VIRTUAL_STRING_INST_TABLENAME = "VIRTUAL_STRING_INST".toUpperCase();
    public static final String UNIT_NUM_TABLE_INST_TABLENAME = "UNIT_NUM_TABLE_INST".toUpperCase();
    public static final String LOGICAL_SERVER_TABLENAME = "LOGICAL_SERVER".toUpperCase();
    public static final String LOGICAL_SERVER_DESC_TABLENAME = "LOGICAL_SERVER_DESC".toUpperCase();
    public static final String LOGICAL_SERVER_INST_TABLENAME = "LOGICAL_SERVER_INST".toUpperCase();
    public static final String AC2LS_LIST_TABLENAME = "AC2LS_LIST".toUpperCase();
    public static final String LSI2ACI_TABLENAME = "LSI2ACI".toUpperCase();
    public static final String APPLICATION_COMPONENT_INST_TABLENAME = "APPLICATION_COMPONENT_INST".toUpperCase();
    public static final String ACI2ACT_TABLENAME = "ACI2ACT".toUpperCase();
    public static final String ACD2LS_LIST_TABLENAME = "acd2ls_list".toUpperCase();
    public static final String application_component_desc_TABLENAME = "application_component_desc".toUpperCase();

    public static final String SOFTWARE_LOCK_TABLENAME = "SOFTWARE_LOCK".toUpperCase();
    public static final String SOFTWARE_LOCK_INST_TABLENAME = "SOFTWARE_LOCK_INST".toUpperCase();
    public static final String APPLICATION_PRIO_TABLENAME = "APPLICATION_PRIO".toUpperCase();
    public static final String APPLICATION_PRIO_INST_TABLENAME = "APPLICATION_PRIO_INST".toUpperCase();
    public static final String PERIPHERIAL_GRP_APP_TABLENAME = "PERIPHERIAL_GRP_APP".toUpperCase();
    public static final String PERIPHERIAL_GRP_APP_INST_TABLENAME = "PERIPHERIAL_GRP_APP_INST".toUpperCase();
    public static final String APP_DISK_GROUP_INST_TABLENAME = "APP_DISK_GROUP_INST".toUpperCase();
    public static final String DB_NAMESPACE_INST_TABLENAME = "DB_NAMESPACE_INST".toUpperCase();
    public static final String DB_NAMESPACE_DESC_TABLENAME = "DB_NAMESPACE_DESC".toUpperCase();
    public static final String CACHE_INST_TABLENAME = "CACHE_INST".toUpperCase();
    public static final String CACHE_DESC_TABLENAME = "CACHE_DESC".toUpperCase();
    public static final String LOGBUF_INST_TABLENAME = "LOGBUF_INST".toUpperCase();
    public static final String LOGBUF_DESC_TABLENAME = "LOGBUF_DESC".toUpperCase();
    public static final String DB_INST_TABLENAME = "DB_INST".toUpperCase();
    public static final String TABLE_DESC_TABLENAME = "TABLE_DESC".toUpperCase();
    public static final String TABLE_INST_TABLENAME = "TABLE_INST".toUpperCase();
    public static final String INDEX_DESC_TABLENAME = "INDEX_DESC".toUpperCase();
    public static final String INDEX_INST_TABLENAME = "INDEX_INST".toUpperCase();
    public static final String LOGICAL_DRIVE_INST_TABLENAME = "LOGICAL_DRIVE_INST".toUpperCase();
    public static final String DISK_PROXY_TABLENAME = "DISK_PROXY".toUpperCase();
    public static final String LDI_GDI_XREF_TABLENAME = "LDI_GDI_XREF".toUpperCase();
    public static final String CACHE_XREF_TABLENAME = "CACHE_XREF".toUpperCase();
    public static final String LOGICAL_DRIVE_VIEW_ITEM_TABLENAME = "LOGICAL_DRIVE_VIEW_ITEM".toUpperCase();
    public static final String CACHE_INST_XREF_VIEW_TABLENAME = "CACHE_INST_XREF_VIEW".toUpperCase();
    public static final String SQL_APPLICATION_DESC_TABLENAME = "SQL_APPLICATION_DESC".toUpperCase();
    public static final String SQL_APPLICATION_INST_TABLENAME = "SQL_APPLICATION_INST".toUpperCase();
    public static final String SQL_COMPONENT_DESC_TABLENAME = "SQL_COMPONENT_DESC".toUpperCase();
    public static final String SQL_COMPONENT_INST_TABLENAME = "SQL_COMPONENT_INST".toUpperCase();
    public static final String BASE_SQL_DESC_TABLENAME = "BASE_SQL_DESC".toUpperCase();
    public static final String BASE_SQL_INST_TABLENAME = "BASE_SQL_INST".toUpperCase();
    public static final String INDEX_ACCESS_INST_TABLENAME = "INDEX_ACCESS_INST".toUpperCase();
    public static final String CSQL2BSQL_TABLENAME = "CSQL2BSQL".toUpperCase();
    public static final String COMPLEX_SQL_DESC_TABLENAME = "COMPLEX_SQL_DESC".toUpperCase();
    public static final String COMPLEX_SQL_INST_TABLENAME = "COMPLEX_SQL_INST".toUpperCase();
    public static final String INITIAL_VALUE_INST_TABLENAME = "INITIAL_VALUE_INST".toUpperCase();
    public static String TRAJECTORY_RATES_TABLENAME = "TRAJECTORY_RATES".toUpperCase();
    public static String COMP2TRAJ = "COMP2TRAJ".toUpperCase();
}

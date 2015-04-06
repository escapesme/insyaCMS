/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.util.HashMap;
import org.w3c.dom.NodeList;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import lib.Options.XMLDataModel;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author empcl_000
 */
public class XML {

    private String serverId;
    private String modelId;
    files f = new files();
    HashMap<String, String> tagTableXref = new HashMap<>();

    private NodeList n;

    private String fileName;

    public XML(String fileName) {
        this.fileName = fileName;
        fillMap();
        //  this.getXmlNodes();
    }

    public String startTage = "complexInstance";

    public ArrayList<HashMap<String, String>> retrunData = new ArrayList<HashMap<String, String>>();

    String test = "";
    String complexId = "";
    String aciId = "";
    String AcdId = "";
    String lsiId = "";
    String lsdid = "";
    String ModID = "";

    public String test_d() {

        final StringBuffer r = new StringBuffer();
        try {

            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();

            DefaultHandler handler = new DefaultHandler() {

                boolean inLSD = false;

                boolean inLSDEnded = false;

                public void startElement(String uri, String localName, String qName,
                        Attributes attributes) throws SAXException {

                    HashMap<String, String> o = new HashMap<String, String>();

                    if (qName.equalsIgnoreCase(startTage)) {
                        for (int i = 0; i < attributes.getLength(); i++) {

                            o.put(attributes.getQName(i), attributes.getValue(i));
                        }

                        test += "\n";

                    }
                    retrunData.add(o);
                }

                @Override
                public void endElement(String uri, String localName,
                        String qName) throws SAXException {

                }

                @Override
                public void characters(char ch[], int start, int length) throws SAXException {

                }

            };

            saxParser.parse(fileName, handler);
            System.out.println(test);
        } catch (ParserConfigurationException | SAXException | IOException e) {
            e.printStackTrace();
        }
        return "";
    }
    
    
    
    
    
    
    lib.engine.db.operations db = new lib.engine.db.operations();

    public String readAllTags() {

        final StringBuffer r = new StringBuffer();
        try {

            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();

            DefaultHandler handler = new DefaultHandler() {

                boolean inLSD = false;

                boolean inLSDEnded = false;

                public void startElement(String uri, String localName, String qName,
                        Attributes attributes) throws SAXException {

                    doSave(qName, attributes);

                }

                @Override
                public void endElement(String uri, String localName,
                        String qName) throws SAXException {

                }

                @Override
                public void characters(char ch[], int start, int length) throws SAXException {

                }

            };

            saxParser.parse(fileName, handler);
            System.out.println(test);
        } catch (ParserConfigurationException | SAXException | IOException e) {
            e.printStackTrace();
        }
        return r.toString();
    }


    ArrayList<HashMap<String, String>> logicalServerInstance() {

        ArrayList<HashMap<String, String>> retrunData = new ArrayList<HashMap<String, String>>();
        this.startTage = "applicationComponentInstance";

        return retrunData;
    }

    ArrayList<HashMap<String, String>> getComplexInstance() {
        retrunData.clear();
        this.startTage = "complexInstance";
        this.test_d();
        logicalServerInstance();
        return retrunData;

    }

    private void fillMap() {
        tagTableXref.put("applicationComponentInstance", XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME);
        tagTableXref.put("complexInstance", XMLDataModel.COMPLEX_INST_TABLENAME);
        tagTableXref.put("logicalServerInstance", XMLDataModel.LOGICAL_SERVER_INST_TABLENAME);
        tagTableXref.put("logicalServerDescription", XMLDataModel.LOGICAL_SERVER_TABLENAME);
        tagTableXref.put("applicationComponentDescription", XMLDataModel.application_component_desc_TABLENAME);
        tagTableXref.put("dbInstance", XMLDataModel.DB_INST_TABLENAME);
        tagTableXref.put("dbNamespaceInstance", XMLDataModel.DB_NAMESPACE_INST_TABLENAME);
        tagTableXref.put("dbNamespaceDescription", XMLDataModel.DB_NAMESPACE_DESC_TABLENAME);
        tagTableXref.put("tableInstance", XMLDataModel.TABLE_INST_TABLENAME);
        tagTableXref.put("tableDescription", XMLDataModel.TABLE_DESC_TABLENAME);
        tagTableXref.put("indexInstance", XMLDataModel.INDEX_DESC_TABLENAME);
        tagTableXref.put("indexDescription", XMLDataModel.INDEX_DESC_TABLENAME);

    }

    void doSave(String qName, Attributes attributes) {

        if (qName.equalsIgnoreCase("complexInstance")) {

            complexId = Utils.getNewID();

            String[][] Data = {
                {"Id", "NAME","SERVER_INST_ID", "MODEL_ID", "VSNAME", "COMPLEX_TYPE", "TOT_LOGICAL_PROC", "NUM_PROCESSORS", "OPTION", "CAT_TYPE","PART_TYPE","CAT_CONSTRUCTOR_INDEX",
                    "CAT_CPU_INDEX","NAME1","NAME2","REAL_STORAGE","EXT_STORAGE","START_IO_OVHD","PROC_IO_OVHD","PERIPH_IO_OVHD","AUX_IO_OVHD","ES_PG_XFER"},
                {complexId, attributes.getValue("name"),serverId, modelId, attributes.getValue("vsName"), attributes.getValue("complexType"),
                    attributes.getValue("totalLogicalProcessors"), "6", attributes.getValue("numberOfProcessors"), "0", "3","1","0","0","0","0","1","0","0","1","0","1","1"}
            };

            System.out.println(Arrays.deepToString(Data) + "\n");

             System.out.println( db.setInsert(XMLDataModel.COMPLEX_INST_TABLENAME, Data));
        } else if (qName.equalsIgnoreCase("logicalServerInstance")) {
            lsiId = Utils.getNewID();
            lsdid = Utils.getNewID();
            String[][] Data = {
                {"Id", "LOGICAL_SERVER_ID", "COMPLEX_INST_ID", "MODEL_ID", "LOGICAL_PROCESSORS", "TOTAL_PRIO", "TIME_SLICE", "CPU_LIMIT", "CPU_QUANTUM"},
                {lsiId, lsdid, complexId, modelId, attributes.getValue("logicalProcessors"), "0", "0", "0", "0"}
            };
            
                System.out.println(Arrays.deepToString(Data) + "\n");
            

            db.setInsert(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, Data);
        } else if (qName.equalsIgnoreCase("logicalServerDescription")) {
            String[][] Data = {
                {"Id", "NAME", "MODEL_ID", "VM"},
                {lsdid, attributes.getValue("name"), modelId, "0"}
            };

            
                System.out.println(Arrays.deepToString(Data) + "\n");
             db.setInsert(XMLDataModel.LOGICAL_SERVER_TABLENAME, Data);
        } else   if (qName.equalsIgnoreCase("applicationComponentInstance")) {

            aciId = Utils.getNewID();
             AcdId = Utils.getNewID();

            String[][] Data = {
                {"Id", "ACD_ID","AC_ID", "MODEL_ID", "LOGICAL_SERVER_INST_ID", "DISK_VOL_ID", "INST_NAME", "INST_MULTIPRO", "ARRIVAL_RATE", "TOTAL_CPU","MEAN_DASD_IO","MEAN_AUX_DELAY",
                    "AVG_AUX_DELAY","MEAN_EXT_STORAGE","AVG_PAGE_XFER","PGRP_OVERLAP","DGRP_OVERLAP","MEAN_IO","MEAN_LOCK_REQ","TEMP","DISTANCE","FAILOVER_DELAY","ACTIVE_STATUS","NUM_TERMINAL"},
                {aciId, AcdId,"0", modelId, lsiId, attributes.getValue("instanceName")+"_LD",
                    attributes.getValue("instanceName"), "1", attributes.getValue("arrivalRate"), attributes.getValue("totalCPU"), attributes.getValue("meanIO"),"1","0","0","0","0","1","0","0","1","0","1","1","1","0"}
            };

            System.out.println(Arrays.deepToString(Data) + "\n");

             System.out.println( db.setInsert(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, Data));
        }  else if (qName.equalsIgnoreCase("applicationComponentDescription ")) {
            String[][] Data = {
                {"Id", "NAME", "MODEL_ID", "CPU_FACTOR","IO_FACTOR","WORKLOAD_TYPE","NUM_TERMINAL","VIRTUAL","MPL"},
                {AcdId, attributes.getValue("name"), modelId, "0","0","1","1","0",attributes.getValue("multiProcessingLevel")}
            };

            
                System.out.println(Arrays.deepToString(Data) + "\n");
             System.out.println(db.setInsert(XMLDataModel.application_component_desc_TABLENAME, Data));
        }

    }

    public String getServerId() {
        return serverId;
    }

    public void setServerId(String serverId) {
        this.serverId = serverId;
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

}

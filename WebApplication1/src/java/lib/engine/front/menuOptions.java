/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lib.engine.front;

import lib.tools.forms;
import org.w3c.dom.*;

/**
 *
 * @author es
 */
public class menuOptions implements lib.Options.MyVariables {
      forms form = new forms();
  
      
      public String getOptions (String data){
        
       
          
         String XmlFile = siteUrl + frontFolder + "/" + data + "/com_properties.xml";
         lib.tools.xml.readingXml getxml = new lib.tools.xml.readingXml(XmlFile, "field");
     NodeList Fildes = getxml.getListTags();
        
     
      return  craetData( Fildes);
        
        
    }
    
    
    
    
    
    
    
    
     private String craetData(NodeList Fildes) {
        String returnData = "";

        for (int s = 0; s < Fildes.getLength(); s++) {


            // 
            String type = (String) this.retrnattr(Fildes, s, "type");
            String[] filds = {"text", "editor", "number", "autocomplete", "date", "time", "password", "checkbox", "textarea", "select", "radio", "upload", "pic", "label", "hidden", "image"};
            for (int i = 0; i < filds.length; i++) {
                if (type.equals(filds[i])) {
                    type = filds[i];
                }
            }


            returnData += getform(type, "menus_options@@"+this.retrnattr(Fildes, s, "name"), "", "", this.retrnattr(Fildes, s, "class"), this.retrnattr(Fildes, s, "title"),
                    this.retrnattr(Fildes, s, "selectQuery"),
                    this.retrnattr(Fildes, s, "selectDataTable"),
                    this.retrnattr(Fildes, s, "selectTexttField"),
                    this.retrnattr(Fildes, s, "selectValueField"),
                    this.retrnattr(Fildes, s, "selectData"),
                    this.retrnattr(Fildes, s, "required"),
                    this.retrnattr(Fildes, s, "data"));


        }


        return returnData;

    }
     
      private String getform(String type, String name, String value, String method, String myclass, String title,
            String selectQuery, String selectDataTable, String selectTexttField, String selectValueField, String selectData, String required, String data) {

        form.name = name;
        form.type = type;
        form.value = value;
        form.method = method;
        form.title = title;
        form.myclass = myclass;
        form.selectQuery = selectQuery;
        form.selectDataTable = selectDataTable;
        form.selectTexttField = selectTexttField;
        form.selectValueField = selectValueField;
        form.selectData = selectData;
        form.required = required;
        form.data = data;
        return form.getForm();
    }
    
    
    
    private String retrnattr(NodeList Fildes, int num, String attr) {
        String returnData = "";
        Node returnDatan = Fildes.item(num);
        if (returnDatan.getNodeType() == Node.ELEMENT_NODE) {
            Element getattr = (Element) returnDatan;
            returnData = (String) getattr.getAttribute(attr);
        }
        return returnData;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

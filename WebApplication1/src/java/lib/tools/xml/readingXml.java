/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lib.tools.xml;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author empcl_000
 */
public class readingXml {
    
    String XmlFile = "";
    String filsname = "field";
    String TagName="";
  public   readingXml (String XmlFile , String TagName){
    
    this.XmlFile= XmlFile;
    this.TagName= TagName;
    }
    
    

    
    private Document getDoc() {
        String retdd = "";

        Document doc = null;
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            doc = docBuilder.parse(XmlFile);
            //out.print();
        } catch (SAXException ex) {
            Logger.getLogger(readingXml.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(readingXml.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(readingXml.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doc;

    }

    public NodeList getListTags() {
        NodeList listOfTG = this.getDoc().getElementsByTagName(filsname);
        return listOfTG;

/*
 * 
         * 
         *     
        int totalPersons = listOfAnimals.getLength();
        for (int s = 0; s < listOfAnimals.getLength(); s++) {
            Node returnDatan = listOfAnimals.item(s);
            if (returnDatan.getNodeType() == Node.ELEMENT_NODE) {
                Element firstAnimalElement = (Element) returnDatan;
                returnData += firstAnimalElement.getAttribute("name");
            }
        }
 */

    }
}

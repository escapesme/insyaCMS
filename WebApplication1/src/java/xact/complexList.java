/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import lib.Options.urls;

/**
 *
 * @author empcl_000
 */
public class complexList implements urls {

    public ArrayList<HashMap<String, String>> getAllIdAttrs() {
        lib.tools.XML x = new lib.tools.XML(complexWebserviec);
        x.test_d();

        return x.retrunData;

    }
    /*   

     x.Elements.add("complexInstance");
     x.startTage = "complexInstances";
     x.endTage = "complexInstances";
        

     String d = x.xmlText.toString();

     String[] ds = d.split(";;");

     for (String s : ds) {

     String[] d2 = s.split("__");
     if (d2[0].equals("id")) {

     r.add(getAttrs(d2[1]));

     }

     }

     return r;

     }

     Map getAttrs(String id) {
     lib.tools.xml x = new lib.tools.xml(complexWebserviec + id);

     x.Elements.add("complexInstance");

     x.startTage = "complexInstance";
     x.endTage = "logicalServerInstances";

     x.afetrEndToEndTag();

     String rSatrin = x.xmlText.toString();
     String[] d = rSatrin.split(";;");
     Map<String, String> m = new HashMap<String, String>();

     m.put("id", id);

     for (String s : d) {

     if (!s.equals("")) {
     String[] d2 = s.split("__");
     if (d2.length > 1) {
     m.put(d2[0], d2[1]);
     }
     }

     }
     return m;

     }*/
}

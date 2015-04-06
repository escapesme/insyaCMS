/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.front;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


public class propertiesCom extends HttpServlet {

    HttpServletRequest rq = null;

    public propertiesCom(HttpServletRequest request) {
        this.rq = request;

    }
String retData="";
    public String getProperties(String prot) {


      String pro = rq.getParameter("properties");

        String[] ret = pro.split("@@");


        for (int X = 0; X < ret.length; X++) {
            
            
if (ret[X] != null) {
           
    
   
               
                if (ret[0].equals(prot)) {
                    retData= ret[1]; 
                }
            


        }


        
        }


        return retData;


    }

   
}

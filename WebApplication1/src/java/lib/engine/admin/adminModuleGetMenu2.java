/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lib.engine.admin;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author es
 */
public class adminModuleGetMenu2 {
public String  doTag2() {
        
String ret="";
    
       
           lib.engine.db.operations db= new   lib.engine.db.operations ();
      
            db.openCon();
           
          ResultSet res= db.getData("def_menus");
            try {
                while(res.next()){
               
                ret+="<select name=\"admin_module_menu\" id=\"Select1\" size=\"4\" multiple=\"multiple\">"
                    +"<option value=\"-1\">"+res.getString("title")+"</option>";
                       
                       
                       
                   
                    
                        ResultSet res_m= db.getData("def_menusitems" ,"*","parent_id="+res.getString("id") );
                       
                        while(res_m.next()){
                        
                    
                            ret+="<option value=\""+ res_m.getString("id")+"\">>>"+res_m.getString("title")+"</option>";
                        
                        }
                        
                        
                        
                            ret+="<option value=\"22\">>>jkljkl</option>";
                        
                        
                           ret+="</select>";

                    
                }
            } catch (SQLException ex) {
              
            }
          
           
           db.closeCon();
           return  ret;

     
    }
}

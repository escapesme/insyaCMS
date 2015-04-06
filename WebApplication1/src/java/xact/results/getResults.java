/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.results;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import java.lang.*;

/**
 *@deprecated 
 * @author ismail
 */
public class getResults {

    lib.engine.db.operations db = new lib.engine.db.operations();

    public String getvalueformfile(HttpServletRequest request, String file, String value, String order) throws IOException {
        String returndata = "";



        lib.tools.files f = new lib.tools.files();

        String[] all_lines = f.raedFile_toarray(request, file);
        // returndata=Integer.toString(all_lines.length);

        for (int i = 0; i < all_lines.length; i++) {


            String[] myarr = all_lines[i].split(";");
            String[] val_arr = value.split(";");
            String[] order_arr = order.split(";");


            //   returndata = Integer.toString(order_arr.length);

            if (order_arr.length == 1) {
                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])) {
                    returndata += all_lines[i] + "|||";

                }

            } else if (order_arr.length == 2) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0]) && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])) {
                    returndata += all_lines[i] + "|||";

                }

            } else if (order_arr.length == 3) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])
                        && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])
                        && myarr[Integer.parseInt(order_arr[2])].equalsIgnoreCase(val_arr[2])) {
                    returndata += all_lines[i] + "|||";

                }

            } else if (order_arr.length == 4) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])
                        && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])
                        && myarr[Integer.parseInt(order_arr[2])].equalsIgnoreCase(val_arr[2])
                        && myarr[Integer.parseInt(order_arr[3])].equalsIgnoreCase(val_arr[3])) {
                    returndata += all_lines[i] + "|||";

                }

            } else if (order_arr.length == 5) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])
                        && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])
                        && myarr[Integer.parseInt(order_arr[2])].equalsIgnoreCase(val_arr[2])
                        && myarr[Integer.parseInt(order_arr[3])].equalsIgnoreCase(val_arr[3])
                        && myarr[Integer.parseInt(order_arr[4])].equalsIgnoreCase(val_arr[4])) {
                    returndata += all_lines[i] + "|||";

                }

            }






        }


        return returndata;
    }

    public String[] getvalueformDBarrays(String value, String order,String point ) throws IOException {
        
        
        
        
        String returndata = "";
        String[] val_arr = value.split(";");
        String[] order_arr = order.split(";");
        for (int i = 0; i < order_arr.length; i++) {
            String an = "";
            if (i > 0) {
                an = " and ";
            }
            
            
            
            
            returndata += an +"VAL"+ order_arr[i] + " = '" +val_arr[i]+"'" + "  and MOD_NAME ='ReferenceModel_0'" ;
        }
     String[] data= db.getRow("new_detail_results", returndata);
       return data;
    }
    
    
    
    

    public String[] getvalueformfilearrays(HttpServletRequest request, String file, String value, String order) throws IOException {
        String returndata = "";
        lib.tools.files f = new lib.tools.files();
       // String[] val_arr = value.split(";");
        //    String[] order_arr = order.split(";");
        String[] val_arr = value.split(";");
        String[] order_arr = order.split(";");

        String[] all_lines = f.raedFile_toarray2(request, file, val_arr[0]);

        // String[] myarr = all_lines[i].split(";");

        // returndata=Integer.toString(all_lines.length);





        for (int i = 0; i < all_lines.length; i++) {


            String[] myarr = all_lines[i].split(";");


            //   returndata = Integer.toString(order_arr.length);

            if (order_arr.length == 1) {
                if (Integer.parseInt(order_arr[0]) < myarr.length) {

                    if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])) {
                        returndata += all_lines[i] + "---";

                    }
                }



            } else if (order_arr.length == 2) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0]) && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])) {
                    returndata += all_lines[i] + "---";

                }

            } else if (order_arr.length == 3) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])
                        && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])
                        && myarr[Integer.parseInt(order_arr[2])].equalsIgnoreCase(val_arr[2])) {
                    returndata += all_lines[i] + "---";

                }

            } else if (order_arr.length == 4) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])
                        && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])
                        && myarr[Integer.parseInt(order_arr[2])].equalsIgnoreCase(val_arr[2])
                        && myarr[Integer.parseInt(order_arr[3])].equalsIgnoreCase(val_arr[3])) {
                    returndata += all_lines[i] + "---";

                }

            } else if (order_arr.length == 5) {

                if (myarr[Integer.parseInt(order_arr[0])].equalsIgnoreCase(val_arr[0])
                        && myarr[Integer.parseInt(order_arr[1])].equalsIgnoreCase(val_arr[1])
                        && myarr[Integer.parseInt(order_arr[2])].equalsIgnoreCase(val_arr[2])
                        && myarr[Integer.parseInt(order_arr[3])].equalsIgnoreCase(val_arr[3])
                        && myarr[Integer.parseInt(order_arr[4])].equalsIgnoreCase(val_arr[4])) {
                    returndata += all_lines[i] + "---";

                }

            }






        }




        String[] data = returndata.split("---");
        return data;
    }
}

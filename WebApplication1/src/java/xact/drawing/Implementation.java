/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.drawing;

/**
 *
 * @author ismail
 */
public class Implementation {
    
    public String parsedeg(String value) {
        
        double total_s = 0;
        if (!value.equals("NULL") && value != null) {
            
            String fff[] = value.split("D");
            String deg = fff[0];
            String fff2[] = fff[1].split("\'");
            String fff4[] = fff[1].split("`");
            String fff3[] = fff[1].split("\"");
            
            int min = 0;
            int sss = 0;
            
            
            if (fff2.length == 2 || fff4.length == 2) {
                
                
                
                if (fff2.length == 2) {
                    
                    if (!fff2[0].equals("")) {
                        min = Integer.parseInt(fff2[0]);
                    }
                } else {
                    //  min = Integer.parseInt(fff4[0]);
                }
                
                
            } else {
                
                
                if (fff3[0] == null && fff3[0] == "" && fff3[0].length() == 0) {
                    
                    sss = 0;
                    
                } else {
                    sss = Integer.parseInt(fff3[0]);
                }
                
            }
            
            total_s = (min * 60) + sss;
            
            total_s = (total_s / 3600) + Double.parseDouble(deg);
            
        }
        
        int nll = value.length();
        char last = value.charAt(nll - 1);
        
        String type = "";
        if (last == 'W' || last == 'w' || last == 'S' || last == 's') {
            type = "-";
        } else {
            type = "";
            
        }
        
        
        
        return type + Double.toString(total_s);
        
        
    }

    // Input a double latitude or longitude in the decimal format
// e.g. 87.728056
    public String decimalToDMS(double coord, String type) {
        String output, degrees, minutes, seconds;
        
        
        
        double mod = coord % 1;
        int intPart = (int) coord;

 

        degrees = String.valueOf(intPart);

      

        coord = mod * 60;
        mod = coord % 1;
        intPart = (int) coord;

        
        minutes = String.valueOf(intPart);


        coord = mod * 60;
        intPart = (int) coord;

     
        seconds = String.valueOf(intPart);


        String end = "";
        
        
        
        if (Double.parseDouble(degrees) < 0) {
            
            
            if (type.equals("lng")) {
                end = "'W";
            } else {
                end = "'S";
                
            }
            
            
            
        } else {
            
            
            if (type.equals("lng")) {
                end = "'E";
            } else {
                end = "'N";
                
            }
        }
        
        
        
        
        output = degrees + "D" + minutes + end;



        return output.replace("-", "");
    }
}

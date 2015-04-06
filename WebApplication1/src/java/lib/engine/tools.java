/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 *
 * @author ismail
 */
public class tools {

    String getDataFromcsv(String fName) throws FileNotFoundException, IOException {
        String returndata = "";
        String thisLine;
        FileInputStream fis = new FileInputStream(fName);
        DataInputStream myInput = new DataInputStream(fis);
        while ((thisLine = myInput.readLine()) != null) {

            returndata += "__";
            String strar[] = thisLine.split(",");
            for (int j = 0; j < strar.length; j++) {
                returndata += strar[j];
            }
        }
        return returndata;



    }
}

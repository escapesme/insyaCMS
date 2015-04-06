/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.util.Date;

/**
 *
 * @author ismail
 */
public class general {
   public static synchronized String getNewID() {
        Date td = new Date();
        long sd = td.getTime();
        return "" + sd;
    }
}

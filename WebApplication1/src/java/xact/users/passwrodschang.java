/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.users;

import java.text.SimpleDateFormat;
import java.util.Date;
import xact.users.users;
import javax.servlet.http.HttpServletRequest;
import lib.Options.XMLDataModel;
import net.sf.javainetlocator.InetAddressLocatorException;

/**
 *
 * @author ismail
 */
public class passwrodschang {

    users u = new users();
    lib.engine.db.operations db = new lib.engine.db.operations();

    public String checkOldPassword(HttpServletRequest rq, String data) {
        String retdata = "false";
        if (u.hash(data).equals(u.userReturn(rq, "password"))) {
            retdata = "true";
        }
        return retdata;
    }

    public String changePassword(HttpServletRequest rq, String data) throws InetAddressLocatorException {
        String retdata = "false";


        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);

        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");



        String[][] mydata = {{"password", "updateDate"}, {u.hash(data), ft.format(dNow)}};




        retdata = db.setUpdateNocon(XMLDataModel.USER_TABLENAME, mydata, "username='" + u.userReturn(rq, "username") + "' and passwordStatus='0'");


        xact.users.users u = new xact.users.users();

        String des = "PASSWORD CHANGED";
        u.audit_log(rq, lib.Options.AuditLogEvents.PASSWORD_CHANGED, des);



        db.closeCon();
        //  retdata = data;
        return retdata;


    }
}

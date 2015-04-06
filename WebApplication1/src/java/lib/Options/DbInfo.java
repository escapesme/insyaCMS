/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.Options;

/**
 *
 * @author es
 */
public interface DbInfo {

    /*public static final String Host = "10.53.55.200";

    String connectionString = "jdbc:mysql://" + Host + ":3306/xactdb_tst";
    public static final String connectionStringRes = "jdbc:mysql://" + Host + ":3306/xactresults_tst";
    public static final String connectionStringDef = "jdbc:mysql://" + Host + ":3306/def";
    public static final String connectionStringUsers = "jdbc:mysql://" + Host + ":3306/xactsec";
    public static final String catdb = "catdb";

    String dbUser = "xactuser";
    String dbPassword = "AcrTek08";
    public static final String connectionStringResdbUser = "xactuser";
    public static final String connectionStringResdbPassword = "AcrTek08";
    public static final String connectionStringDefdbUser = "xactuser";
    public static final String connectionStringDefdbPassword = "AcrTek08";
    public static final String connectionStringUsersdbUser = "xactuser";
    public static final String connectionStringUsersdbPassword = "AcrTek08";
    */
    public static final String Host = "localhost";

    String connectionString = "jdbc:mysql://" + Host + "/newxactdb";
    public static final String connectionStringRes = "jdbc:mysql://" + Host + "/newxactresults";
    public static final String connectionStringDef = "jdbc:mysql://" + Host + "/def";
    public static final String connectionStringUsers = "jdbc:mysql://" + Host + "/xactsec";
    public static final String catdb = "catdb";

    String dbUser = "root";
    String dbPassword = "";
    public static final String connectionStringResdbUser = "root";
    public static final String connectionStringResdbPassword = "";
    public static final String connectionStringDefdbUser = "root";
    public static final String connectionStringDefdbPassword = "";
    public static final String connectionStringUsersdbUser = "root";
    public static final String connectionStringUsersdbPassword = "";
    
    
    
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.Options;

/**
 *
 * @author es
 */
public interface MyVariables extends Messages {

    public String siteUrl = "/Xact2/";
    public String sitePath = "E:\\work\\Xact\\web\\";
    public String urlAlias = "alias";
    public String showFile = "show";
    public String modulesFolder = "modules";
    public String frontFolder = "site";
    public String templatesFolder = "templates/fornt";
    //public  String adminTemplatesFolder = "admin";
    public String adminTemplatesFolder = "templates/admin";
    public String javaScriptFolder = "templates/fornt";
    public String adminFolder = "admin";
    public String jsFolder = "includes/js/";
    public final static String relesDate = "2014 .7.6";
    public final static String relesVersion = "4.1.2";
    public final static int PassWordUpdateDasy = 90;
    public final static int PassWordSoonDays = 1;
    public final static int historyPassWordRows = 3;
    public final static String imagesURL = "https://www.acrtek-lab.com/XActimages/";
    public final static String FROM_EMAIL = "X-Act.Optimal.Control@acrtek.com";
    public final static String EMAIL_SUBJECT = "Password Reset Request";
    public final static int SESSION_TIME = 90;  
}


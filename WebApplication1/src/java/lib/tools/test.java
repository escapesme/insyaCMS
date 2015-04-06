/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ismail
 */
public class test {

    public static ArrayList<String> msges = new ArrayList<String>();
    public static ArrayList<String> titles = new ArrayList<String>();
    public static ArrayList<String> names2 = new ArrayList<String>();
    public static ArrayList<String> commentes = new ArrayList<String>();
    public static ArrayList<String> SPliteres = new ArrayList<String>();
    public static ArrayList<String> IDs = new ArrayList<String>();
    public static ArrayList<String> Classes = new ArrayList<String>();
    public static ArrayList<String> namesdata = new ArrayList<String>();

    public static void addMessage(String Names, String ID, String Title, String msg, String Class) {
        test.msges.add(msg);
        test.namesdata.add(Names);
        test.IDs.add(ID);
        test.titles.add(Title);
        test.Classes.add(Class);


    }

    public static void addMessage(String Names2, String ID, String Title, String msg) {
        test.msges.add(msg);
        test.namesdata.add(Names2);
        test.IDs.add(ID);
        test.titles.add(Title);
        test.Classes.add("no thing");
    }

    public static void setMessage(HttpServletRequest rq) {

 
        HttpSession session = rq.getSession(true);
        String returnOut = "";

        String myall = "all";
        session.removeAttribute(myall);
        for (int i = 0; i < namesdata.size(); i++) {
            String[] mynamess2 = namesdata.get(i).split(",");
            for (int i2 = 0; i2 < mynamess2.length; i2++) {
                session.removeAttribute(mynamess2[i2]);
            }
        }

        for (int i = 0; i < namesdata.size(); i++) {
            String[] mynamess2 = namesdata.get(i).split(",");
            for (int i2 = 0; i2 < mynamess2.length; i2++) {
                session.removeAttribute(mynamess2[i2]);
            }
        }

        for (int i = 0; i < test.namesdata.size(); i++) {
            String[] mynamess2 = test.namesdata.get(i).split(",");
            for (int i2 = 0; i2 < mynamess2.length; i2++) {
                session.setAttribute(mynamess2[i2], "");
                session.setAttribute(mynamess2[i2], "");
                session.setAttribute(mynamess2[i2], "");

                session.setAttribute(mynamess2[i2], "");
                session.removeAttribute(mynamess2[i2]);
            }
        }



        for (int i = 0; i < test.namesdata.size(); i++) {

            // if (names.get(i).contains(Name)) {
    

            String[] mynamess2 = test.namesdata.get(i).split(",");

            for (int i2 = 0; i2 < mynamess2.length; i2++) {


                session.setAttribute(mynamess2[i2], "");
                session.setAttribute(mynamess2[i2], "");
                session.setAttribute(mynamess2[i2], "");

                session.setAttribute(mynamess2[i2], "");
                session.removeAttribute(mynamess2[i2]);



            }
        }













   int num = 0; 
        for (int i = 0; i < test.namesdata.size(); i++) {

            // if (names.get(i).contains(Name)) {


            String[] mynamess2 = test.namesdata.get(i).split(",");

            for (int i2 = 0; i2 < mynamess2.length; i2++) {


                String cls = "";
                String titles = "";
                String msg = "";
                if (test.Classes.get(i) != null && !test.Classes.get(i).equals("")) {
                    msg = test.msges.get(i);

                }

                if (test.Classes.get(i) != null && !test.Classes.get(i).equals("")) {
                    cls = test.Classes.get(i);

                }
                if (test.titles.get(i) != null && !test.titles.get(i).equals("")) {
                    titles = test.titles.get(i);

                }

                num++;
                returnOut = "<div class=\"msgAll\"><div class=\"msgids\">" + ":"+ test.IDs.get(i) + "</div><div class=\"msgtitle\">" + titles + "</div><div class=\"msgbody " + cls + "\"> " + msg + "</div></div>";
                session.setAttribute(mynamess2[i2], session.getAttribute(mynamess2[i2]) + returnOut);
                session.setAttribute(myall, session.getAttribute(myall) + returnOut);
            }








        }







        test.msges.clear();
        test.namesdata.clear();
        test.IDs.clear();
        test.titles.clear();
        test.Classes.clear();



    }

    public static String getMessages(String Name, HttpServletRequest rq) {

        HttpSession session = rq.getSession(true);

        return (String) session.getAttribute(Name);

    }
}

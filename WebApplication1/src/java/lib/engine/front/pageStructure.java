/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.front;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

public class pageStructure extends HttpServlet implements lib.Options.MyVariables {

    front fo = new front();

    public String processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String myLinke = "";
        String temp = fo.getThisTemplate(request);
        myLinke = templatesFolder + "/" + temp + "/index.jsp";


        
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(myLinke);
        dispatcher.include(request, response);


        return myLinke;


    }
}

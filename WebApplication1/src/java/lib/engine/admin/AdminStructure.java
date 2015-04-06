/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.admin;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author es
 */
//@WebServlet(name="pageStructure", urlPatterns={"/pageStructure"})
public class AdminStructure extends HttpServlet implements lib.Options.MyVariables {

    adminc fo = new adminc();

    public String processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String myLinke = "";
        String temp = fo.getThisTemplate(request);
        

        myLinke = adminTemplatesFolder + "/" + temp + "/index.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(myLinke);
        dispatcher.include(request, response);




        return myLinke;


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

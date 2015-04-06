/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.front;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class properties extends HttpServlet {

    HttpServletRequest rq = null;

    public properties(HttpServletRequest request) {
        this.rq = request;

    }
String retData="";
    



public String getProperties(String prot) {


        String pro = rq.getParameter("properties");

        String[] ret = pro.split("@@");

       
          retData= ret[1]; 
        
        
        
        /*

        for (int X = 0; X < ret.length; X++) {
if (ret[X] != null) {
         

           if (ret[X] != null) {
                if (ret[X].equals(prot)) {
                    retData= ret[1; 
                }
            }


   */


        return retData;


    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet properties</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet properties at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

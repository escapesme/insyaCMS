/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

//import com.sun.jersey.core.util.Base64;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ismail
 */
/**
 * <b><i>The class that makes the image cropping and saving.</i></b>
 * <p>
 * <br>
 * <b> it's of type servlet so it can be accessed directly within html forms</b>.
 *
 *
 */
public class cropimage extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * this method handles the post request. Here it reads the image and the
     * cropping coordinates and saves a new image from it.<br> It uses the javax
     * imagio api to perform the read and write operations of the images.
     *
     * @param req the request object to get the application path from.
     * @param res the response object to write into
     */
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        /*  PrintWriter out2 = res.getWriter();
         res.setContentType("text/html;charset=UTF-8");




         String imagestatus = req.getParameter("imagestatus");


         String imsfol = "test";
         String image_name = "cropped";

         if (req.getParameter("image_name") != null) {

         image_name = req.getParameter("image_name");



         }

         String image_path = "";

         if (req.getParameter("image_path") != null) {

         image_path = imsfol + "/" + req.getParameter("image_path") + "/";
         }








         double t_1 = Double.parseDouble(req.getParameter("t"));


         int t = (int) t_1;
         int l = (int) Double.parseDouble(req.getParameter("l"));
         int w = (int) Double.parseDouble(req.getParameter("w"));
         int h = (int) Double.parseDouble(req.getParameter("h"));


         String file2 = req.getRequestURI();
         if (req.getQueryString() != null) {
         file2 += '?' + req.getQueryString();
         }
         URL reconstructedURL = new URL(req.getScheme(), req.getServerName(), req.getServerPort(), "");




         String encodedImage = req.getParameter("i");
         BufferedImage outImage;

         if (imagestatus.equalsIgnoreCase("image")) {


         URL url = new URL(reconstructedURL + encodedImage);

         String file = req.getRealPath(encodedImage);
         File mfile = new File(file);

         outImage = ImageIO.read(url);

         } else {

         byte[] bytes = Base64.decode(encodedImage);
         outImage = ImageIO.read(new ByteArrayInputStream(bytes));
         }









         BufferedImage cropped = outImage.getSubimage(l, t, w, h);
         ByteArrayOutputStream out = new ByteArrayOutputStream();

         ImageIO.write(cropped, req.getParameter("f"), out);

         String p = getServletContext().getRealPath(image_path) + System.getProperty("file.separator") + image_name + ".jpg";






         ImageIO.write(cropped,
         req.getParameter("f"),
         new File(getServletContext().getRealPath(image_path)
         + System.getProperty("file.separator") + image_name + ".jpg"));



         out2.print("<script src=\"/Xact/includes/js/jquery.js\" type=\"text/javascript\"></script>"
         + ""
         + "<script>$(function(){"
         + ""
         + "$('.show_imge').attr('src','" + image_path + image_name + ".jpg?timestamp=' + new Date().getTime());"
         + ""
         + "})</script>"
         + "<img class='show_imge' src='' />"
         + "<br />imageName:<input type='text' value='" + image_name + ".jpg'>"
         + "<br />imagePath:<input type='text' value='" + image_path + image_name + ".jpg'>"
         + "");









         }*/
    }}

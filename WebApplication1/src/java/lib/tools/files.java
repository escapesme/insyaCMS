/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.*;
import java.util.*;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author es
 */
public class files extends HttpServlet implements lib.Options.MyVariables {

    String ErrorMessage = "";
    String FileNewName = "";
    String FileUserName = "";
    String _GIF = "";
    String _JPG = "jpg";
    String _JPEG = ".png";
    String _PNG = "";

    public void readXML(String fileurl, String root) {

    }

    public String WriterFile(HttpServletRequest request, String FilePath, String data) throws IOException {
        String theFile = request.getRealPath(FilePath);
        PrintWriter pw = new PrintWriter(new FileOutputStream(theFile));

        pw.println(data);
        //clean up
        pw.close();
        return theFile;

    }

    public String raedFile(HttpServletRequest request, String FilePath) throws IOException {
        String theFile = request.getRealPath(FilePath);

        BufferedReader input = new BufferedReader(new FileReader(theFile));
        String line = "";
        String returnData = "";

        while ((line = input.readLine()) != null) {
            returnData += line;
        }
        //output.flush();
        input.close();
        return returnData;

    }

    public String[] raedFile_toarray(HttpServletRequest request, String FilePath) throws IOException {
        String theFile = request.getRealPath(FilePath);

        BufferedReader input = new BufferedReader(new FileReader(theFile));
        String line = "";
        String returnData = "";

        String split = "___________________________________________";
        while ((line = input.readLine()) != null) {
            returnData += line + split;
        }
        String[] myretdata = returnData.split(split);

        input.close();
        return myretdata;

    }

    public String[] raedFile_toarray2(HttpServletRequest request, String FilePath, String dt) throws IOException {
        String theFile = request.getRealPath(FilePath);

        BufferedReader input = new BufferedReader(new FileReader(theFile));
        String line = "";
        String returnData = "";

        String split = "___________________________________________";

        while ((line = input.readLine()) != null) {

            String strOrig = line;

            int intIndex = strOrig.indexOf(dt);

            if (intIndex != - 1) {
                returnData += line + split;
            }
        }

        input.close();

        String[] myretdata = returnData.split(split);
        return myretdata;

    }

    public String uploadFiles(HttpServletRequest request, String FileServerPath) throws IOException {

        String returnData = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                } else {
                    try {
                        String itemName = item.getName();
                        File savedFile = new File(sitePath + FileServerPath + itemName);
                        item.write(savedFile);
                        //  returnData += "<tr><td><b>Your file has been saved at the loaction:</b></td></tr><tr><td><b>" + sitePath + "uploadedFiles" + "\\" + itemName + "</td></tr>";
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        return returnData;
    }

    public String uploadFile(HttpServletRequest request, String FileServerPath) throws IOException {

        String contentType = request.getContentType();

        String ret = "";
        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            try {

                DataInputStream in = new DataInputStream(request.getInputStream());

                int formDataLength = request.getContentLength();

                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
                String file = new String(dataBytes);
                String saveFile
                        = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,
                        saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1,
                        contentType.length());
//out.println(boundary);
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;

                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0,
                        boundaryLocation)).getBytes()).length;

                String tmp_file = saveFile.toLowerCase();

//out.print(tmp_file);
                if (!tmp_file.equals(this._GIF) || tmp_file.equals(this._JPEG) || tmp_file.equals(this._JPG) || tmp_file.equals(this._PNG)) {
                    this.FileUserName = saveFile;
                    this.FileNewName = saveFile;
//out.println("File path = " +sitePath + FileServerPath+this.FileNewName);+(new java.util.Date().getTime())
                    FileOutputStream fileOut = new FileOutputStream(sitePath + FileServerPath + this.FileNewName);
                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                    fileOut.flush();
                    fileOut.close();
                    return this.FileNewName;
                } else {
                    this.ErrorMessage = "Invalid File Format. " + "File Format should be .png, .gif,.jpg or .jpeg.";
                    return this.ErrorMessage;
                }
            } catch (Exception exception) {
                this.ErrorMessage = exception.getMessage();
                return this.ErrorMessage;
            }
        } else {
            this.ErrorMessage = "Ilegal ENCTYPE : must be multipart/form-data\n" + "ENCTYPE set = " + contentType;
            return this.ErrorMessage;

        }
    }

    public ArrayList<String[]> ImportCSV(String sFileName, HttpServletRequest request, HttpServletResponse response) {

        String csvFile = sFileName;
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        ArrayList<String[]> twoDArray = new ArrayList<String[]>();
        try {
            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {
                twoDArray.add(line.split(cvsSplitBy));
            }
        } catch (Exception e) {

        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                    // e.printStackTrace();
                }
            }
        }
        return twoDArray;
    }

    public String exportCSV(String sFileName, String[][] data, HttpServletRequest request, HttpServletResponse response) {

        String Content = "";

        response.reset();

        response.setContentType("application/text");

        response.setHeader("Content-disposition", "attachment; filename=" + sFileName);

        String r = "";
        try {
            // FileWriter writer = new FileWriter(sFileName);

            for (String[] ds : data) {
                for (String d : ds) {

                    /* response.getOutputStream().write(buf, 0, len);
                    
                     writer.append(d);
                     writer.append(',');*/
                    Content += d + ',';
                }
                Content += '\n';

            }

            byte requestBytes[] = Content.getBytes();

            ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
            byte[] buf = new byte[1024];

            int len;

            while ((len = bis.read(buf)) > 0) {
                response.getOutputStream().write(buf, 0, len);
            }

            bis.close();

            response.getOutputStream().flush();

        } catch (Exception e) {
            r = e.getMessage();
        }
        return r;
    }

    public String exportCSV(String sFileName, String data, HttpServletRequest request, HttpServletResponse response) {

        String Content = "";

        response.reset();

        response.setContentType("application/text");

        response.setHeader("Content-disposition", "attachment; filename=" + sFileName);

        String r = "";
        try {
            // FileWriter writer = new FileWriter(sFileName);

            /*   for (String[] ds : data) {
             for (String d : ds) {

                    
             Content += d + ',';
             }
             Content += '\n';

             }*/
            Content = data;
            byte requestBytes[] = Content.getBytes();

            ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
            byte[] buf = new byte[1024];

            int len;

            while ((len = bis.read(buf)) > 0) {
                response.getOutputStream().write(buf, 0, len);
            }

            bis.close();

            response.getOutputStream().flush();

        } catch (Exception e) {
            r = e.getMessage();
        }
        return r;
    }
}

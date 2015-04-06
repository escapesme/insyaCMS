<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="lib.tools.Utils"%>
<%@page import="reports.wizard_steps"%>
<%!//
   
    String files = "test";
    
    
    wizard_steps w = new wizard_steps();

    String createStep(String name, String title, String rp_id, String imageName) {

        String returndata = "";
        w.folderName = files;
        w.ThisID = rp_id;

        //   returndata += "<div id ='" + name + "' class='step step_" + num + " '" + name + "'_step'>";
        returndata += " <div class='mysetpAllData'>";


        if (!name.equalsIgnoreCase("intro") && !name.equalsIgnoreCase("analysis")  ) {
            returndata += "<div class='crop_tap'>Paste & Crop Image</div>";
            returndata += " <div class='data_tap'>Comments</div>";
        } else {
        }


        returndata += "</div>";



        returndata += " <div class='tap_body crop_div' >";
        returndata += w.returnSteps(name, rp_id, "", imageName);
        returndata += "</div>";
        returndata += "<div class='tap_body data_div' >";



        returndata += w.returnSteps(name + "_data", rp_id, "", imageName);
        returndata += "</div>";





        return returndata;

    }
%>

<%
    String rp_id = request.getParameter("id");
    String name = request.getParameter("name");
    String title = request.getParameter("title");
    String step = request.getParameter("step");

    String ImageName = request.getParameter("imagename");

    if (name.trim().equalsIgnoreCase("end")) {

        out.print(w.end_step(rp_id, request));

    } else {

        out.print(createStep(name, title, rp_id, ImageName));


    };



%>












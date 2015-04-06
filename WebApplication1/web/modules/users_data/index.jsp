<%@taglib uri="/WEB-INF/tlds/tagslib" prefix="l"%>

<%

            lib.engine.front.properties pro = new lib.engine.front.properties(request);


            xact.users.users us = new xact.users.users();

            out.print(us.userlogout(request));
            ;
            if (us.userReturn(request, "username").equals("")) {


                if (!pro.getProperties("a_login").equals("")) {
                   // out.print("<meta http-equiv=\"refresh\" content=\"0;url=" + pro.getProperties("a_login") + "\">");
                    
          
                    
                
                  
                }

            } else {

                out.print("Welcome " + us.userReturn(request, "username"));


                
                
              /*  out.print("<div class=\"u_data\"> <a></a><ul>"
                        + "<li> Messages : 0</li>"
                        + "<li> Events : 0</li>"
                        + "<li> News : 0</li></ul>"
                        + "");
*/



            /*    out.print("<div><a class=\"logout\" href=\"?alias=" + request.getParameter("alias") + "&status=logout\">logout</a> <a class=\"logout\" href=\"?#\">Profile</a> </div>");
*/


            }

%>
<style>
.u_data li{
list-style: none;
 font: normal 12px tahoma, arial, verdana, sans-serif;
 border-bottom: 1px #eee solid;
    width:80%;
    clear: both
}

.u_data a{

display: block;
width:80px;
text-align: center;
   border-left: 1px solid #98C8FF;
 float: left;
 margin-left:20px

}
.u_data a:hover{

      border-bottom: 1px solid #98C8FF;


}
</style>
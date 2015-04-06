
<%

    lib.engine.front.properties pro = new lib.engine.front.properties(request);
    xact.users.users us = new xact.users.users();

    String OutData = "";
    if (request.getParameter("status") != null && request.getParameter("status").equalsIgnoreCase("chkuser")) {
        OutData = us.CheckNewForUpdate(request);
    } else if (request.getParameter("status") != null && request.getParameter("status").equalsIgnoreCase("UpdatePass")) {
        OutData = us.UpdatePass(request);
    } else {

        String returnData = us.CheckPssForUpdate(request);
        if (returnData.trim().equalsIgnoreCase("success")) {

            OutData += "success--<div class='DataRow'> <div class='myLabel'>Enter New Password</div><input  type='password'   class='input newPass'/><div class='newPassmsg' ></div></div>";
            OutData += "<div class='line'></div><div class='DataRow'> <div class='myLabel'>Re-enter New Password</div>"
                    + "<input  type='password'  disabled  class='input newPassrep'/></div>";
            OutData += "<div class='line'></div><div class='DataRow'><input  type='button'  disabled  class='savePassrep' value='Save'/></div><div class='UpdateData2'></div>";

        } else {



            OutData = "error--" + returnData;
        }

    }

    out.print(OutData);
%>


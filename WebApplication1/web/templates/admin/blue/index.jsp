<%-- 
    Document   : index
    Created on : May 9, 2011, 10:42:40 AM
    Author     : es
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="/includes/getFiles.jsp" %>
        <title>X-Act Web Admin</title>
    </head>

    <link rel="stylesheet" type="text/css" href="templates/admin/blue/css/style.css">


    <body><%@taglib uri="/WEB-INF/tlds/tagslib" prefix="acr"%>

        <div class="all_admin">


            <div class="main">
                <acr:adminmian />
            </div>

        </div>
        <div class="startdiv"><div class="startdiv_headr light_bg" ></div>
            <div class="startdiv_content">
                <div class="startdiv_left">
                    <acr:adminMenu />
                </div>
                <div class="mrnucat">

                    <ul>
                        <li class="viewtitle"><li>
                        <li class="ui-state-default ui-corner-all" title="Templates">
                            <a href="admin.jsp?alias=def_install"><span class="ui-icon ui-icon-contact"></span></a></li>
                        <li class="ui-state-default ui-corner-all " title="Install">

                            <a href="admin.jsp?alias=def_modules"><span class="ui-icon ui-icon-tag"></span></a></li>
                        <li class="ui-state-default ui-corner-all " title="Menus">
                            <a href="admin.jsp?alias=def_menus"><span class="ui-icon ui-icon-note"></span></a></li>
                        <li class="ui-state-default ui-corner-all " title="Module">
                            <a href="admin.jsp?alias=def_modules"> <span class="ui-icon ui-icon-newwin"></span></a></li>
                        <li class="ui-state-default ui-corner-all " title="users">
                            <a href="admin.jsp?alias=def_modules"><span class="ui-icon ui-icon-person"></span></a></li>
                      




                    </ul>




                </div>

                <div class="icon_down">


                    <ul >
                        <li class="ui-state-default ui-corner-all " title="Home">
                            <a href="admin.jsp"><span class="ui-icon ui-icon-home"></span></a></li>
                        <li class="ui-state-default ui-corner-all " title="Logout">
                            <a href="admin.jsp?alias=def_modules"><span class="ui-icon ui-icon-key"></span></a></li>
                        <li class="ui-state-default ui-corner-all " title="shut down">
                            <a href="admin.jsp?alias=def_modules"><span class="ui-icon ui-icon-power"></span></a></li>
                    </ul>
                </div>
            </div>



        </div>

        <%

                    java.util.Date date = new java.util.Date();
        %>
        <div class="mtbar dark_bg"><a class="startbt">Start</a><a class="time light_bg"><%= date%></a></div>
    </body>
</html>

<style>





</style>


<%-- 
    Document   : getVendorsList
    Created on : Aug 1, 2013, 10:56:13 AM
    Author     : Ahmed
--%>
<%@page import="lib.Options.DbInfo"%>
<%@page import="cat.read.Processor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="cat.read.Catalog"%>
<%@page import="xact.DatabaseImport"%>
<%


String catId=request.getParameter("catid");
Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
     
    c.ListCatalogs();
    c.setCatByOffset(Integer.parseInt(catId));
    Manufacturer manufacturer = new Manufacturer(c);
    ArrayList cList = manufacturer.ListManufacturers();
   
    for (int i = 0; i < cList.size(); i++) {
            
            out.print("<option value='" + i + "'>" + cList.get(i) + "</option>");
        }

%>
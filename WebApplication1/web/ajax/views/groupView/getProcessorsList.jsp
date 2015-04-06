<%-- 
    Document   : getProcessorsList
    Created on : Jun 26, 2013, 1:45:26 PM
    Author     : Ahmed
--%>

<%@page import="lib.Options.DbInfo"%>
<%@page import="cat.read.Processor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="cat.read.Catalog"%>
<%@page import="xact.DatabaseImport"%>
<%

String constructorIndex=request.getParameter("cindex");
String catId=request.getParameter("catid");
Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
     
    c.ListCatalogs();
    c.setCatByOffset(Integer.parseInt(catId));
    Manufacturer manufacturer = new Manufacturer(c);
    ArrayList cList = manufacturer.ListManufacturers();
    manufacturer.setManufacturer(Integer.parseInt(constructorIndex));
    Processor uc = new Processor(c);
    ArrayList pList = uc.ListProcessors();
    for (int i = 0; i < pList.size(); i++) {
            
            out.print("<option value='" + i + "'>" + pList.get(i) + "</option>");
        }

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : params
    Created on : Feb 17, 2014, 11:19:48 AM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">

<c:forEach var="current" items="${paramValues}">
    
    ${current.key} = ${current.value[0]}<br/>
</c:forEach>
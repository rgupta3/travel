<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %> 
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Cp1252" />
<title>jsf-title</title>
</head>
<body>
<f:view>
	<h3><h:outputText value="Hi,#{travelRequest.date}!" /> <br />
	<h:outputText value="#{travelRequest.employee.name}" /><br />
	<h:outputText value="#{travelRequest.id}" /> <br />
	<h:outputText value="#{travelRequest.employee.id}" /> <br />
	<h:outputText value="#{travelRequest.control}" /></h3>
</f:view>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib prefix="a4j" uri="https://ajax4jsf.dev.java.net/ajax" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<html>
<f:view>
	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="../../images/favicon.ico" type="image/x-icon" />
	<title>Travel Request Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="../../style/style.css" rel="stylesheet" type="text/css" media="screen" />

	</head>
	<body>
	<div id="wrapper">
	<div id="logo">
	<h1> Sony India Software Center</h1>
	<p>(A division of Sony India Pvt. Ltd.)</p>
	</div>
	<hr />
	<!-- end #logo -->
	<div id="header">
	<div id="menu">
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="/travel/faces/privat/search.jsf">Search</a></li>
		<li><a href="#">Help</a></li>
		<li><a href="/travel/faces/privat/logout.jsf">Logout</a></li>
	</ul>
	</div>
	<!-- end #menu -->
	</div>
	<!-- end #header --> 
	<!-- end #header-wrapper -->
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post">
	<h:outputText value="#{msg.inputname_header}"/>
	<h2>Search</h2>
	<h:form id="form">
	<h:selectOneMenu id="searchMenu" value="#{travelProcessor.searchItem}" >
					<f:selectItems value="#{travelProcessor.searchList}"/>
				</h:selectOneMenu>
		<h:inputText id="search" value="#{travelProcessor.searchElement}">
			</h:inputText>
		<a4j:commandButton value="Go" reRender="DataTable" id="Go">

</a4j:commandButton>
		<rich:dataTable id="DataTable" value="#{travelProcessor.searchResults}"
			var="travelReq" bgcolor="#F1F1F1" border="10" cellpadding="5"
			cellspacing="3" first="0" rows="5"  dir="LTR" frame="box"
			rules="all"  style="width:883px;" rowKeyVar="row">
			<f:facet name="header">
				<h:outputText value="List of Travel Requests" />
			</f:facet>
				<h:column>
				<f:facet name="header">
					<h:outputText value="Employee ID" />
				</f:facet>
				<h:commandLink 
				value="#{travelReq.employee.id}" 
				action="#{travelProcessor.showTravelSummary}">
				<f:setPropertyActionListener value="#{row}" 
  	    target="#{travelProcessor.rowIndex}" />
				</h:commandLink>
				
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Name" />
				</f:facet>
				<h:outputText id="name" value="#{travelReq.employee.name}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Project Name" />
				</f:facet>
				<h:outputText id="projectName" value="#{travelReq.employee.projectName}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Country" />
				</f:facet>
				<h:outputText id="country" value="#{travelReq.country}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Status" />
				</f:facet>
				<h:outputText id="status" value="#{travelReq.status}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
				<h:outputText id="date" value="#{travelReq.date}" >
				</h:outputText>
			</h:column>
<f:facet name="footer"><rich:datascroller for="DataTable" maxPages="7">
         <f:facet name="first">
                   <h:outputText value="First"/>
         </f:facet>
         <f:facet name="last">
                   <h:outputText value="Last"/>
         </f:facet>
</rich:datascroller>	
</f:facet>
		</rich:dataTable>
		<a4j:commandLink value="Previous" reRender="DataTable" action="#{travelProcessor.prevPage}" >
</a4j:commandLink>
<a4j:commandLink value="Next" reRender="DataTable" action="#{travelProcessor.nextPage}" style="margin-left:20px;">
</a4j:commandLink>	
		</h:form>
	*&nbsp;&nbsp;=&nbsp;&nbsp;required
	</div>
	</div>
	<!-- end #content -->
	<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
	<p><a href="#"> Copyright &copy; 2010 www.sony.com. All rights reserved. Design by suhas.</a></p>
	</div>
	</div>
	<!-- end #footer --></div>
	</body>
</f:view>
</html>
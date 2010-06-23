<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="a4j" uri="https://ajax4jsf.dev.java.net/ajax"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<html>
<f:view>
	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="../../images/favicon.ico"
		type="image/x-icon" />
	<title>Travel Application</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script language="javaScript" type="text/javascript" src="calendar.js"></script>
	<link href="../../style/style.css" rel="stylesheet" type="text/css"
		media="screen" />
	<!-- set focus to a field -->
	<script type="text/javascript">
    function setfocus() {
	<c:if test="${travelProcessor.focusField!=null && travelProcessor.focusField == 'travel'}">
	document.getElementById('<c:out value="travelForm:travelDataTable:${travelProcessor.focusFieldSize}:date2" />').focus();
	</c:if>
	<c:if test="${travelProcessor.focusField!=null && travelProcessor.focusField == 'hotel'}">
	document.getElementById('<c:out value="travelForm:hotelDataTable:${travelProcessor.focusFieldSize}:place" />').focus();
	</c:if>
	};
	</script>
	</head>
	<body onload="setfocus();">
	<div id="wrapper">
	<div id="logo">
	<h1>Sony India Software Center</h1>
	<p>(A division of Sony India Pvt. Ltd.)</p>
	</div>
	<hr />
	<!-- end #logo -->
	<div id="header">
	<div id="menu">
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Search</a></li>
		<li><a href="#">Create</a></li>
		<li><a href="#">Help</a></li>
		<li><a href="logout.jsf">Logout</a></li>
	</ul>
	</div>
	<!-- end #menu -->
	<div id="search">
	<form method="get" action="">
	<fieldset><input type="text" name="s" id="search-text"
		size="15" /> <input type="submit" id="search-submit" value="GO" /></fieldset>
	</form>
	</div>
	<!-- end #search --></div>
	<!-- end #header --> <!-- end #header-wrapper -->
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post"><h:outputText value="#{msg.inputname_header}" />
	<h2>Travel Application</h2>
	<h:form id="travelForm">


		<f:view>

			<h:form>
				<h:dataTable value="#{EmployeeTable.model}" var="emp"
					first="#{EmployeeTable.first}" rows="2">
					<f:facet name="header">
						<h:outputText value="List of Travel Requests" />
					</f:facet>
					<f:facet name="footer">
						<h:panelGroup>
							<h:commandButton value="First"
								actionListener="#{EmployeeTable.pageClicked}" />
							<h:commandButton value="Previous"
								actionListener="#{EmployeeTable.pageClicked}" />
							<h:commandButton value="Next"
								actionListener="#{EmployeeTable.pageClicked}" />
							<h:commandButton value="Last"
								actionListener="#{EmployeeTable.pageClicked}" />
						</h:panelGroup>
					</f:facet>
					<h:column>
						<f:facet name="header">
							<h:commandLink value="Id"
								actionListener="#{travelProcessor.sortClicked}" />
						</f:facet>
						<h:outputText value="#{travelRequest.id}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:commandLink value="Place"
								actionListener="#{travelProcessor.sortClicked}" />
						</f:facet>
						<h:outputText value="#{travelRequest.place}" />

					</h:column>

					<h:column>
						<f:facet name="header">
							<h:commandLink value="Project"
								actionListener="#{travelProcessor.sortClicked}" />
						</f:facet>
						<h:outputText value="#{travelRequest.project}" />

					</h:column>

					<h:column>
						<f:facet name="header">
							<h:commandLink value="Date Of Travel"
								actionListener="#{travelProcessor.sortClicked}" />
						</f:facet>
						<h:outputText value="#{travelRequest.dot}">
							<f:convertDateTime pattern="dd-MMM-yyyy" />
						</h:outputText>

					</h:column>

					<h:column>
						<f:facet name="header">
							<h:commandLink value="Status"
								actionListener="#{travelProcessor.sortClicked}" />
						</f:facet>
						<h:outputText value="#{travelRequest.status}">

						</h:outputText>

					</h:column>


					<h:column>
						<h:commandButton value="Update" rendered="#{not emp.edit}"
							actionListener="#{EmployeeTable.editClicked}" />
						<h:commandButton value="Delete" rendered="#{not emp.edit}"
							actionListener="#{EmployeeTable.editClicked}" />
						<h:commandButton value="Save" rendered="#{emp.edit}"
							actionListener="#{EmployeeTable.editClicked}" />
						<h:commandButton value="Cancel" rendered="#{emp.edit}"
							immediate="true" actionListener="#{EmployeeTable.editClicked}" />
					</h:column>
				</h:dataTable>
			</h:form>
		</f:view>







		<br>
		<center><h:commandButton id="submit" value="submit"
			action="#{travelProcessor.print}"
			disabled="#{travelRequest.disable2}" />&nbsp;</center>
	</h:form></div>
	</div>
	<!-- end #content -->
	<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
	<p><a href="#"> Copyright &copy; 2010 www.sony.com. All rights
	reserved. Design by suhas.</a></p>
	</div>
	</div>
	<!-- end #footer --></div>
	</body>
</f:view>
</html>
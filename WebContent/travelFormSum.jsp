<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<html>
<f:view>
	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Travel Request Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="/style/style.css" rel="stylesheet" type="text/css" media="screen" />
	</head>
	<body>
	<div id="wrapper">
	<div id="logo">
	<h1><a href="#"> Sony India Software Center </a></h1>
	<p><a href="#"> (A division of Sony India Pvt. Ltd.) </a></p>
	</div>
	<hr />
	<!-- end #logo -->
	<div id="header">
	<div id="menu">
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">About</a></li>
		<li><a href="#">Links</a></li>
		<li><a href="#">Contact</a></li>
	</ul>
	</div>
	<!-- end #menu -->
	<div id="search">
	<form method="get" action="">
	<fieldset><input type="text" name="s" id="search-text"
		size="15" /> <input type="submit" id="search-submit" value="GO" /></fieldset>
	</form>
	</div>
	<!-- end #search -->
	</div>
	<!-- end #header --> 
	<!-- end #header-wrapper -->
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post">
	<h1>Travel Summary</h1>
	
	<h:form id="travelForm"> <h:messages />
		<label>Initiator Name  <h:outputText id="initiator" value="xyz"
			/></label>
		<table style="width: 883px; height: 122px">
			<tr>
				<td></td>
				<td></td>
				<td style="width: 121px">Date </td>
				<td style="width: 252px"><h:outputText id="date1" 
					value="#{travelRequest.date}" >
					<f:convertDateTime type="date" dateStyle="short" />
					
				</h:outputText></td>
			</tr>
			<tr>
				<td style="width: 116px">Name </td>
				<td style="width: 346px"><h:outputText id="name" 
					value="#{travelRequest.employee.name}" >
					
				</h:outputText></td>
				<td style="width: 122px">Designation </td>
				<td style="width: 170px"><h:outputText id="designation"
					value="#{travelRequest.employee.designation}">
					
				</h:outputText></td>
			</tr>
			<tr>
				<td>Email Id </td>
				<td style="width: 389px"><h:outputText id="emailId"
					value="#{travelRequest.employee.emailId}" >
					
				</h:outputText></td>
				<td style="width: 136px">Tel.Ext.No </td>
				<td style="width: 161px"><h:outputText id="telExt"
					value="#{travelRequest.employee.telephoneExt}" /></td>
			</tr>
			<tr>
				<td>Department </td>
				<td><h:outputText id="department" 
					value="#{travelRequest.employee.department}" >
					
				</h:outputText></td>
				<td style="width: 169px">Purpose of travel </td>
				<td><h:outputText id="purpose"
					value="#{travelRequest.travelDetails.purpose}">
					
				</h:outputText></td>
			</tr>
			<tr>
				<td style="width: 140px">Duration: From </td>
				<td><h:outputText id="startDate"
					value="#{travelRequest.travelDetails.startDate}"
					>
					<f:convertDateTime type="date" dateStyle="short" />
					
				</h:outputText></td>
				<td>To </td>
				<td><h:outputText id="endDate"
					value="#{travelRequest.travelDetails.endDate}">
					<f:convertDateTime type="date" dateStyle="short" />
					
				</h:outputText></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>Type of travel : </td>
				<td style="width: 247px"><h:outputText id="type"
					value="#{travelRequest.type}" >
					
				</h:outputText></td>
				<td></td>
			</tr>
			<tr>
				<td>Grade : </td>
				<td><h:outputText id="grade"
					value="#{travelRequest.employee.grade}">
					
				</h:outputText></td>
			</tr>
		</table>
		<br>
		<h:dataTable id="travelDataTable" value="#{travelRequest.travelResv}"
			var="travelResvItem" bgcolor="#F1F1F1" border="10" cellpadding="5"
			cellspacing="3" first="0" rows="0" width="100%" dir="LTR" frame="box"
			rules="all" summary="This is a JSF code for travel details." >
			<f:facet name="header">
				<h:outputText value="Proposed travel details " />
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
				<h:outputText id="date2" value="#{travelResvItem.travelDate}">
					<f:convertDateTime type="date" dateStyle="short" />
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Sector" />
				</f:facet>
				<h:outputText id="from" value="#{travelResvItem.travelFrom}">
				</h:outputText>
				<h:outputText id="to" value="#{travelResvItem.travelTo}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Mode" />
				</f:facet>
				<h:outputText id="mode" value="#{travelResvItem.modeType}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Class" />
				</f:facet>
				<h:outputText id="class" value="#{travelResvItem.classType}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Time" />
				</f:facet>
				<h:outputText id="depTime" value="#{travelResvItem.depTime}">
				</h:outputText>
				<h:outputText id="arrTime" value="#{travelResvItem.arrTime}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Amount" />
				</f:facet>
				<h:outputText id="tAmount" value="#{travelResvItem.amount}">
					<f:convertNumber type="number" />
				</h:outputText>
			</h:column>
			
		</h:dataTable>
		<br>
		<table>
			<tr>
				<td>Hotel payment by : </td>
				<td><h:outputText id="paidBy"
					value="#{travelRequest.payment}">
					
				</h:outputText></td>
				<td></td>
			</tr>
		</table>
		<h:dataTable id="hotelDataTable" value="#{travelRequest.hotelResv}"
			var="hotelResvItem" bgcolor="#F1F1F1" border="10" cellpadding="5"
			cellspacing="3" first="0" rows="0" width="100%" dir="LTR" frame="box"
			rules="all" summary="This is a JSF code for hotel details.">
			<f:facet name="header">
				<h:outputText value="Hotel reservation details " />
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Place" />
				</f:facet>
				<h:outputText id="place" value="#{hotelResvItem.place}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="In" />
				</f:facet>
				<h:outputText id="in" value="#{hotelResvItem.checkIn}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Out" />
				</f:facet>
				<h:outputText id="out" value="#{hotelResvItem.checkOut}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Hotel name" />
				</f:facet>
				<h:outputText id="hName" value="#{hotelResvItem.name}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Amount" />
				</f:facet>
				<h:outputText id="hAmount" value="#{hotelResvItem.amount}">
					<f:convertNumber type="number" />
				</h:outputText>
			</h:column>
			
		</h:dataTable>
		<br>
		<h:dataTable id="approvalDataTable" value="#{travelRequest.requestApprovals}"
			var="requestApprovalItem" bgcolor="#F1F1F1" border="10" cellpadding="5"
			cellspacing="3" first="0" rows="0" width="100%" dir="LTR" frame="box"
			rules="all" summary="This is a JSF code for approval details." rendered="#{not empty travelRequest.requestApprovals}">
			<f:facet name="header">
				<h:outputText value="Travel Approval details" />
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Approver" />
				</f:facet>
				<h:outputText id="approver" value="#{requestApprovalItem.approvorType}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Approved" />
				</f:facet>
				<h:outputText id="travelapproved" value="#{requestApprovalItem.approved}">
				</h:outputText>
			</h:column>
		</h:dataTable>
		<table>
			<tr>
				<td>Direct Payment (Advance Amt.) </td>
				<td><h:outputText id="perDayAllowance"
					value="#{travelRequest.travelDetails.allowance.perDayAllowance}"
					>
					<f:convertNumber type="number" />
				</h:outputText></td>
			</tr>
			<tr>
				<td>Days </td>
				<td><h:outputText id="days"
					value="#{travelRequest.travelDetails.allowance.days}"
					>
					<f:convertNumber type="number" />
				</h:outputText></td>
			</tr>
			<tr>
				<td>Daily Allowance </td>
				<td><h:outputText id="dailyAllowance"
					value="#{travelRequest.travelDetails.allowance.dailyAllowance}"
					>
					<f:convertNumber type="number" />
				</h:outputText></td>
			</tr>
			<tr>
				<td>Misc. Expenses </td>
				<td><h:outputText id="miscAllowance" 
					value="#{travelRequest.travelDetails.allowance.miscAllowance}"
					>
					<f:convertNumber type="number" />
				</h:outputText></td>
			</tr>
			<tr>
				<td>Recommended by </td>
				<td><h:outputText id="recommendedEmpMailId" 
					value="#{travelRequest.travelDetails.recommndedEmpMailId}"
					>
					
				</h:outputText></td>
			</tr>
			<tr>
				<td>Authorised by </td>
				<td><h:outputText id="authorisedEmpMailId"
					value="#{travelRequest.travelDetails.authorisedEmpMailId}"
					>
					
				</h:outputText></td>
			</tr>
		</table>
		<br/><br/>
		<h:panelGroup id="travelApprovalId" rendered="#{travelRequest.showTravelApproval}">
				<center><h:commandButton id="accept" value="Accept" 
				action="#{travelProcessor.financeAccept}" />
				<h:commandButton id="reject" value="Reject"
				action="#{travelProcessor.financeReject}" /></center>				
		</h:panelGroup>		
	</h:form> 
	
	</div>
	</div>
	<!-- end #content -->
	<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
	<p><a href="#"> Copyright (c) 2010 www.sony.com. All rights reserved. Design by suhas.</a></p>
	</div>
	</div>
	<!-- end #footer --></div>
	</body>
</f:view>
</html>
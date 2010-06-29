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
	<link rel="shortcut icon" href="/travel/images/favicon.ico" type="image/x-icon" />
	<title>Travel Request Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="/travel/style/style.css" rel="stylesheet" type="text/css" media="screen" />
	<!-- set focus to a field -->
	</head>
	<body>
	<div id="wrapper">
	<jsp:include page="/faces/privat/header.html" />
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post">
	<h:outputText value="#{msg.inputname_header}"/>
	<h2>Travel Request Form</h2>
	<h:form id="travelForm"> 
	<h:message for="initiator" style="color:red"></h:message><br>
		<label>Initiator Name <h:inputText id="initiator" value="xyz"
			readonly="true" /></label>
		<table style="width: 883px; height: 122px; margin-top: 40px;">
			<tr>
				<td style="width: 120px">Type of Travel*</td>
				<td style="width: 320px"><h:selectOneRadio id="type" value="#{travelRequest.type}"  disabled="#{travelRequest.renderForm}">
					<f:selectItem id="domestic" itemLabel="Domestic" itemValue="domestic" />
					<f:selectItem id="international" itemLabel="International" itemValue="international" />
				<a4j:support ajaxSingle="true"
						action="#{travelProcessor.enableFields1}" event="onclick"
						reRender=
						"travelForm,country,grade,travelDataTable,currency1,currency2,currency3,currency4,currency5,dailyAllowance,totalAllowance" status="waitStatus"></a4j:support>
				</h:selectOneRadio>
				</td>
				<td style="width: 123px">Country *</td>
				<td style="width: 320px"><h:selectOneMenu id="country" 
					value="#{travelRequest.country}" disabled="#{travelRequest.disableCountry}" >
					<f:selectItems value="#{travelProcessor.list1}"/>
					<a4j:support ajaxSingle="true"
						action="#{travelProcessor.processAllowance}" event="onchange"
						reRender=
						"dailyAllowance,totalAllowance" status="waitStatus"></a4j:support>
				</h:selectOneMenu></td>
			</tr>
			
			<tr>
				
				<td >Grade *</td>
				<td ><h:selectOneMenu id="grade" 
					value="#{travelRequest.employee.grade}" disabled="#{travelRequest.disable1}" >
					<f:selectItem id="Select" itemLabel="Select" itemValue="Select" />
					<f:selectItem id="M1" itemLabel="M1" itemValue="M1" />
					<f:selectItem id="M2" itemLabel="M2" itemValue="M2" />
					<f:selectItem id="M3" itemLabel="M3" itemValue="M3" />
					<f:selectItem id="M4" itemLabel="M4" itemValue="M4" />
					<f:selectItem id="SM1" itemLabel="SM1" itemValue="SM1" />
					<f:selectItem id="SM2" itemLabel="SM2" itemValue="SM2" />
					<f:selectItem id="SM3" itemLabel="SM3" itemValue="SM3" />
					<a4j:support ajaxSingle="true"
						action="#{travelProcessor.enableFields2}" event="onchange"
						reRender=
						"totalAllowance,dailyAllowance,date1,name,designation,unit,projectName,emailId,
						telExt,department,mobileNumber,purpose,fromDate,toDate,chargeableType,
						travelDataTable,paidBy,hotelDataTable,otherAllowance,otherAllowanceDetail,submit" status="waitStatus"></a4j:support>
				</h:selectOneMenu></td>
				<td>Date *</td>
				<td ><h:inputText id="date1" 
					value="#{travelRequest.date}" disabled="#{travelRequest.disable2}" readonly="true" >
					<f:convertDateTime type="date" dateStyle="short" />
				</h:inputText> <h:message for="date" style="color:red"></h:message> </td>
			</tr>
			<tr>
				<td >Name *</td>
				<td >
				<h:inputText id="name" 
					value="#{travelRequest.employee.name}" disabled="#{travelRequest.disable2}">
				<rich:ajaxValidator event="onblur" />
				</h:inputText>	<rich:message for="name" style="color:red; font-size:10px;" />
				</td>
				<td >Designation *</td>
				<td><h:inputText id="designation" 
					value="#{travelRequest.employee.designation}" disabled="#{travelRequest.disable2}">
				<rich:ajaxValidator event="onblur" />
				</h:inputText>	<rich:message for="designation" style="color:red; font-size:10px;" /> </td>
			</tr>
			<tr>
				<td >Unit *</td>
				<td >
				<h:selectOneMenu id="unit" 
					value="#{travelRequest.employee.unit}" disabled="#{travelRequest.disable2}" >
					<f:selectItem id="GDC" itemLabel="GDC" itemValue="GDC" />
					<f:selectItem id="GSC" itemLabel="GSC" itemValue="GSC" />
				</h:selectOneMenu> </td>
				<td >Project Name *</td>
				<td ><h:inputText id="projectName" 
					value="#{travelRequest.employee.projectName}" disabled="#{travelRequest.disable2}">
				<rich:ajaxValidator event="onblur" />
				</h:inputText>	<rich:message for="projectName" style="color:red; font-size:10px;" /> </td>
			</tr>
			<tr>
				<td>Email Id *</td>
				<td ><h:inputText id="emailId" 
					value="#{travelRequest.employee.emailId}" disabled="#{travelRequest.disable2}">					
				<rich:ajaxValidator event="onblur" />
				</h:inputText>	<rich:message for="emailId" style="color:red; font-size:10px;" /></td>
				<td >Tel.Ext.No </td>
				<td>
				<h:inputText id="telExt"
					value="#{travelRequest.employee.telephoneExt}" disabled="#{travelRequest.disable2}">
					<rich:ajaxValidator event="onblur" />
				</h:inputText>	<rich:message for="telExt" style="color:red; font-size:10px;" /></td>
			</tr>
			<tr>
				<td>Department *</td>
				<td><h:selectOneMenu id="department" 
					value="#{travelRequest.employee.department}" disabled="#{travelRequest.disable2}">
					<f:selectItem id="ORMC" itemLabel="ORMC" itemValue="ORMC" />
					<f:selectItem id="SARD" itemLabel="SARD" itemValue="SARD" />
				</h:selectOneMenu> </td>
				<td>Mobile Number *</td>
				<td><h:inputText id="mobileNumber"
					value="#{travelRequest.employee.mobileNumber}" disabled="#{travelRequest.disable2}">
					<rich:ajaxValidator event="onblur" />
				</h:inputText><rich:message for="mobileNumber" style="color:red; font-size:10px; width:120px;" />	</td>
			</tr>
			<tr>				
				<td style="width: 169px">Purpose of travel *</td>
				<td><h:inputText id="purpose" 
					value="#{travelRequest.travelDetails.purpose}" disabled="#{travelRequest.disable2}">
				<rich:ajaxValidator event="onblur" />
				</h:inputText>	<rich:message for="purpose" style="color:red; font-size:10px;" /> </td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td style="width: 140px">Duration: From *</td>
				<td><a4j:outputPanel ajaxRendered="true">
<rich:calendar id="fromdate"
value="#{travelRequest.travelDetails.startDate}"
datePattern="MM/dd/yy HH:mm" 
disabled="#{travelRequest.disable2}">
<a4j:support ajaxSingle="true"
						action="#{travelProcessor.computeDays}" event="onchanged"
						reRender=
						"days,totalAllowance" status="waitStatus"></a4j:support>				
					</rich:calendar>

</a4j:outputPanel></td>
				<td>To *</td>
				<td><a4j:outputPanel ajaxRendered="true">
<rich:calendar id="todate"
value="#{travelRequest.travelDetails.endDate}"
datePattern="MM/dd/yy HH:mm" disabled="#{travelRequest.disable2}">
<a4j:support ajaxSingle="true"
						action="#{travelProcessor.computeDays}" event="onchanged"
						reRender=
						"days,totalAllowance" status="waitStatus"></a4j:support>						
					</rich:calendar>
</a4j:outputPanel> </td>
			</tr>
		</table>
		<table>
			<tr>
				<td></td>
				<td style="width: 247px"><h:selectOneRadio id="chargeableType" 
					value="#{travelRequest.chargeableType}" disabled="#{travelRequest.disable2}"> 
					<f:selectItem id="chargeable" itemLabel="Chargeable" 
						itemValue="chargeable" />
					<f:selectItem id="non-chargeable" itemLabel="Non-chargeable"
						itemValue="non-chargeable" />
				<rich:ajaxValidator event="onblur" />
				</h:selectOneRadio>	<rich:message for="chargeableType" style="color:red; font-size:10px;" /></td>
				<td></td>
			</tr>
			<tr>
				
			</tr>
		</table>
		<br>		
		<rich:dataTable id="travelDataTable" value="#{travelRequest.travelResv}"
			var="travelResvItem" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5"
			cellspacing="3" first="0" rows="0" dir="LTR" frame="box"
			rules="all" style="width:883px; margin-top: 20px;" >
			<f:facet name="header">
				<h:outputText value="Proposed travel details *" />
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
<rich:calendar id="date2"
value="#{travelResvItem.travelDate}"
datePattern="MM/dd/yy HH:mm" disabled="#{travelRequest.disable2}"
></rich:calendar>
</a4j:outputPanel>			
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Sector" />
				</f:facet>
				<h:inputText id="from" value="#{travelResvItem.travelFrom}" disabled="#{travelRequest.disable2}">
				<rich:ajaxValidator event="onblur" />
				</h:inputText>	
				<h:inputText id="to" value="#{travelResvItem.travelTo}" disabled="#{travelRequest.disable2}">
				<rich:ajaxValidator event="onblur" />
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Mode" />
				</f:facet>
				<h:selectOneMenu id="mode" 
					value="#{travelResvItem.modeType}" disabled="#{travelRequest.disable2}" >
					<f:selectItems value="#{travelProcessor.list2}"/>
				</h:selectOneMenu>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Class" />
				</f:facet>
				<h:inputText id="class" value="#{travelResvItem.classType}" disabled="true">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Time" />
				</f:facet>
				<h:inputText id="depTime" value="#{travelResvItem.depTime}" disabled="#{travelRequest.disable2}">				
				<rich:ajaxValidator event="onblur" />	</h:inputText>
				<h:inputText id="arrTime" value="#{travelResvItem.arrTime}" disabled="#{travelRequest.disable2}">				
				<rich:ajaxValidator event="onblur" />	</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Amount" /><h:outputText id="currencyAmount1" 
					value="#{travelRequest.travelDetails.allowance.currency}"> 
					</h:outputText>
				</f:facet>
				<h:inputText id="tAmount" value="#{travelResvItem.amount}" disabled="#{travelRequest.disable2}">
					<f:convertNumber type="number" />
				<a4j:support ajaxSingle="true"
						action="#{travelProcessor.calculateAmount}" event="onchange"
						reRender=
						"totalAllowance" status="waitStatus"></a4j:support>
				<rich:ajaxValidator event="onblur" /></h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Action" />
				</f:facet>
				<a4j:commandButton value="Delete" action="#{travelProcessor.removeTravelResvRow}" reRender="travelDataTable,totalAllowance" disabled="#{travelRequest.disable4}">
  	<f:setPropertyActionListener value="#{row}" 
  	    target="#{travelProcessor.rowIndex}" />
      </a4j:commandButton>

			</h:column>
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="travelDataTable" action="#{travelProcessor.addTravelResvRow}" id="addRow1" disabled="#{travelRequest.disable2}">

</a4j:commandButton>
			</f:facet>
		</rich:dataTable>
		<br>
		<table style="margin-top:20px;">
			<tr>
				<td>Hotel payment by *</td>
				<td><h:selectOneRadio id="paidBy" 
					value="#{travelRequest.payment}" disabled="#{travelRequest.disable2}">
					<f:selectItem id="client" itemLabel="Client" itemValue="client" />
					<f:selectItem id="company" itemLabel="Company" itemValue="company" />
			<a4j:support ajaxSingle="true"
						action="#{travelProcessor.enableFields3}" event="onclick"
						reRender=
						"hotelDataTable,totalAllowance" status="waitStatus"></a4j:support>
				</h:selectOneRadio></td>
				<td></td>
			</tr>
		</table>
		<rich:dataTable id="hotelDataTable" value="#{travelRequest.hotelResv}"
			var="hotelResvItem" rowKeyVar="row2" bgcolor="#F1F1F1" border="10" cellpadding="5"
			cellspacing="3" first="0" rows="0"  dir="LTR" frame="box"
			rules="all"  style="width:883px;" >
			<f:facet name="header">
				<h:outputText value="Hotel reservation details " />
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Place" />
				</f:facet>
				<h:inputText id="place" value="#{hotelResvItem.place}" disabled="#{travelRequest.disable3}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="In" />
				</f:facet>
				<h:inputText id="in" value="#{hotelResvItem.checkIn}" disabled="#{travelRequest.disable3}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Out" />
				</f:facet>
				<h:inputText id="out" value="#{hotelResvItem.checkOut}" disabled="#{travelRequest.disable3}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Hotel name" />
				</f:facet>
				<h:inputText id="hName" value="#{hotelResvItem.name}" disabled="#{travelRequest.disable3}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Amount" /><h:outputText id="currencyAmount2" 
					value="#{travelRequest.travelDetails.allowance.currency}"> 
					</h:outputText>
				</f:facet>
				<h:inputText id="hAmount" value="#{hotelResvItem.amount}" disabled="#{travelRequest.disable3}">
					<f:convertNumber type="number" />
					<a4j:support ajaxSingle="true"
						action="#{travelProcessor.calculateAmount}" event="onchange"
						reRender=
						"totalAllowance" status="waitStatus"></a4j:support>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Action" />
				</f:facet>
				<a4j:commandButton value="Delete" action="#{travelProcessor.removeHotelResvRow}" reRender="hotelDataTable,totalAllowance" disabled="#{travelRequest.disable5}">
  	<f:setPropertyActionListener value="#{row2}" 
  	    target="#{travelProcessor.rowIndex}" />
      </a4j:commandButton>

			</h:column>
			<f:facet name="footer">
			<a4j:commandButton value="Add Row" reRender="hotelDataTable" action="#{travelProcessor.addHotelResvRow}" id="addRow2" disabled="#{travelRequest.disable3}">

</a4j:commandButton>

			
						
			</f:facet>
		</rich:dataTable>
		<br>
		<table style="margin-top:20px;">
			<tr>
				<td>Airport Transport (Advance Amt.) *</td>
				<td><h:inputText id="perDayAllowance" 
					value="#{travelRequest.travelDetails.allowance.airportTransport}"
					disabled="true">
					<f:convertNumber type="number" />
				</h:inputText> <h:outputText id="currency1" 
					value="#{travelRequest.travelDetails.allowance.currency}"> 
					</h:outputText></td>
			</tr>
			<tr>
				<td>Days *</td>
				<td><h:inputText id="days" 
					value="#{travelRequest.travelDetails.allowance.days}" disabled="true" >
					<f:convertNumber type="number" />
				</h:inputText></td>
			</tr>
			<tr>
				<td>Daily Allowance *</td>
				<td><h:inputText id="dailyAllowance" 
					value="#{travelRequest.travelDetails.allowance.dailyAllowance}"
					disabled="true">
					<f:convertNumber type="number" />
				</h:inputText> <h:outputText id="currency2" 
					value="#{travelRequest.travelDetails.allowance.currency}">
					</h:outputText></td>
			</tr>
			<tr>
				<td>Conveyance *</td>
				<td><h:inputText id="conveyance" 
					value="#{travelRequest.travelDetails.allowance.conveyance}"
					disabled="true">
					<f:convertNumber type="number" />
				</h:inputText> <h:outputText id="currency3" 
					value="#{travelRequest.travelDetails.allowance.currency}">
					</h:outputText></td>
			</tr>
			<tr>
				<td>Other</td>
				<td><h:inputText id="otherAllowance" 
					value="#{travelRequest.travelDetails.allowance.otherAllowance}"
					disabled="#{travelRequest.disable2}">
					<f:convertNumber type="number" />
					<a4j:support ajaxSingle="true"
						action="#{travelProcessor.calculateAmount}" event="onchange"
						reRender=
						"totalAllowance" status="waitStatus"></a4j:support>
				</h:inputText> <h:outputText id="currency4" 
					value="#{travelRequest.travelDetails.allowance.currency}">
					</h:outputText> 
					
					
					<h:inputText id="otherAllowanceDetail" 
					value="#{travelRequest.travelDetails.allowance.otherAllowanceDetail}"
					disabled="#{travelRequest.disable2}">(Specify)
				</h:inputText></td>
			</tr>
			<tr>
				<td>Amount </td>
				<td><h:inputText id="totalAllowance" value="#{travelRequest.amount}" disabled="true">
					<f:convertNumber type="number" />
				</h:inputText><h:outputText id="currency5" 
					value="#{travelRequest.travelDetails.allowance.currency}">
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
				</h:outputText> </td>
			</tr>
		</table>
		<br>
		<center><h:commandButton id="submit" value="submit"
			action="#{travelProcessor.print}" disabled="#{travelRequest.disable2}" />&nbsp;
			</center>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib prefix="a4j" uri="https://ajax4jsf.dev.java.net/ajax"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<html>
<f:view>
	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="/travel/images/favicon.ico"
		type="image/x-icon" />
	<title>Travel Settlement Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="/travel/style/style.css" rel="stylesheet" type="text/css"
		media="screen" />

	</head>
	<body>
	<div id="wrapper">
	<jsp:include page="/faces/privat/header.html" />
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post"><h:outputText value="#{msg.inputname_header}" />
	<h2>Travel Settlement Form</h2>
	<h:form id="travelSettlementForm">

		<table style="width: 883px; height: 122px; margin-top: 40px;">
			<tr>
				<td style="width: 120px">Name</td>
				<td style="width: 320px"><h:inputText id="name"
					value="#{travelRequest.employee.name}" >
				</h:inputText></td>
				<td style="width: 123px">Departure Date *</td>
				<td style="width: 320px"><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="departureDate"
						value="#{travelRequest.travelSettlement.departureDate}"
						datePattern="MM/dd/yy">
						<a4j:support ajaxSingle="true"
						action="#{travelProcessor.computeDaysForSettlement}" event="onchanged"
						reRender=
						"noOfDays" status="waitStatus"></a4j:support>
					</rich:calendar>
				</a4j:outputPanel></td>
			</tr>

			<tr>

				<td>Designation/Emp. Code *</td>
				<td><h:inputText id="designation"
					value="#{travelRequest.employee.designation}" >
				</h:inputText></td>
				<td>Departure Time *</td>
				<td><h:inputText id="departureTime"
					value="">
					<f:convertDateTime type="date" dateStyle="short" />
				</h:inputText></td>
			</tr>
			<tr>
				<td>Department *</td>
				<td><h:inputText id="department"
					value="#{travelRequest.employee.department}" >
				</h:inputText></td>
				<td>Arrival Date *</td>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="arrivalDate"
						value="#{travelRequest.travelSettlement.arrivalDate}"
						datePattern="MM/dd/yy">
					
					<a4j:support ajaxSingle="true"
						action="#{travelProcessor.computeDaysForSettlement}" event="onchanged"
						reRender="noOfDays" status="waitStatus"></a4j:support>
						</rich:calendar>
				</a4j:outputPanel></td>
			</tr>
			<tr>
				<td>Reporting Manager *</td>
				<td><h:inputText id="reportingManager"
					value="" readonly="true">
				</h:inputText></td>
				<td>Arrival Time *</td>
				<td><h:inputText id="arrivalTime"
					value="">
				</h:inputText></td>
			</tr>
			<tr>
				<td>Date of Submission *</td>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="submissionDate"
						value="#{travelRequest.travelSettlement.submissionDate}"
						datePattern="MM/dd/yy">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td>No. of Days *</td>
				<td><h:inputText id="noOfDays"
					value="#{travelRequest.travelSettlement.noOfDays}">
					<f:convertNumber type="number"/>
				</h:inputText></td>
			</tr>
			<tr>
				<td>Unit *</td>
				<td><h:inputText id="unit" value="#{travelRequest.employee.unit}" >
				</h:inputText></td>
				<td>Project Code</td>
				<td><h:inputText id="projectCode"
					value="" readonly="true">
				</h:inputText></td>
			</tr>
			<tr>
				<td>Project Name</td>
				<td><h:inputText id="projectName"
					value="#{travelRequest.employee.projectName}">
				</h:inputText></td>
			</tr>
		</table>

		
		
		
		<rich:dataTable id="advanceTable" value="#{travelRequest.travelSettlement.advanceAmounts}" var="advance" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="DETAILS OF ADVENCE OF FOREX TAKEN"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="advanceAmountDate" value="#{advance.date}" datePattern="MM/dd/yy" >
					</rich:calendar>
				</a4j:outputPanel>		
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="advanceAmountType" value="#{advance.type}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="advanceAmountCurrency" value="#{advance.currency}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="advanceAmountBillNo" value="#{advance.billNo}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="advanceAmountForexAmount" value="#{advance.forexAmount}">
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalAdvance}" event="onchange" reRender="totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR,advanceAmountINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
				<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="advanceAmountConversionRate" value="#{advance.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalAdvance}" event="onchange" reRender="totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR,advanceAmountINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:inputText id="advanceAmountINRAmount" value="#{advance.INRAmount}" readonly="true">
				<f:convertNumber type="number"/>				
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="advanceAmountRemarks" value="#{advance.remarks}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeAdvanceTableRow}" reRender="advanceTable,totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableAdvanceTableRowDelete}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			
					
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" action="#{travelProcessor.addAdvanceTableRow}" reRender="advanceTable" id="addRowAdvance" >
				</a4j:commandButton>
			</f:facet>			
		</rich:dataTable>
		
		
		<table style="margin-top:20px;">
			<tr>
				<td>Total Advance Expenses</td>
				<td><h:outputText id="totalAdvance" value="#{travelRequest.travelSettlement.totalAdvanceAmount}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			<tr>
				<td>Total INR</td>
				<td><h:outputText id="totalAdvanceINR" value="#{travelRequest.travelSettlement.advanceTaken}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			
		</table>

		
		<rich:dataTable id="lodgingTable" value="#{travelRequest.travelSettlement.lodgingExpenses}" var="lodging" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="LODGING"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="lodgingDate"
						value="#{lodging.date}"
						datePattern="MM/dd/yy">
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="lodgingDetails" value="#{lodging.details}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="lodgingCurrency" value="#{lodging.currency}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="lodgingBillNo" value="#{lodging.billNo}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="lodgingForexAmount" value="#{lodging.forexAmount}" >
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalLodging}" event="onchange" reRender="totalLodging,totalLodgingINR,displayTotalLodging,displayTotalLodgingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,lodgingINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="lodgingConversionRate" value="#{lodging.conversionRate}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalLodging}" event="onchange" reRender="totalLodging,totalLodgingINR,displayTotalLodging,displayTotalLodgingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,lodgingINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>										
				</f:facet>
				<h:inputText id="lodgingINRAmount" value="#{lodging.INRAmount}" readonly="true" >
				<f:convertNumber type="number"/>										
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="lodgingRemarks" value="#{lodging.remarks}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeLodgingTableRow}" reRender="lodgingTable,totalLodging,displayTotalLodging,totalExpenses,totalLodgingINR,displayTotalLodgingINR,totalExpensesINR" disabled="#{travelRequest.travelSettlement.disableLodgingTableRowDelete}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="lodgingTable" action="#{travelProcessor.addLodgingTableRow}" id="addRowLodging" >
				</a4j:commandButton>
			</f:facet>			
		</rich:dataTable>
		<table style="margin-top:20px;">
			<tr>
				<td>Total Lodging Expenses</td>
				<td><h:outputText id="totalLodging" value="#{travelRequest.travelSettlement.totalLodgingExpenses}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			<tr>
				<td>Total INR</td>
				<td><h:outputText id="totalLodgingINR" value="#{travelRequest.travelSettlement.totalLodgingExpensesINR}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			
		</table>
		
		
		
		
		
		<rich:dataTable id="travellingTable" value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses}" var="travelling" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="TRAVELLING DAILY ADVANCE"/>
			</f:facet>		
			<h:column>
				<f:facet name="header">
					<h:outputText value="No. of days"/>
				</f:facet>
					<h:inputText id="travelingDailyAllowanceNoOfDays" value="#{travelRequest.travelSettlement.noOfDays}" >
						<f:convertNumber type="number"/>
					</h:inputText>					
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceDetails" value="#{travelling.details}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceCurrency" value="#{travelling.currency}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceExpensesBillNo" value="#{travelling.billNo}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceForexAmount" value="#{travelling.forexAmount}" >
					<f:convertNumber type="number"/>
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalTravelling}" event="onchange" reRender="displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceConversionRate" value="#{travelling.conversionRate}" >
				<f:convertNumber type="number"/>
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalTravelling}" event="onchange" reRender="displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>					
				</f:facet>
				<h:inputText id="travelingDailyAllowanceINRAmount" value="#{travelling.INRAmount}" readonly="true">
				<f:convertNumber type="number"/>					
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceRemarks" value="#{travelling.remarks}">
				</h:inputText>
			</h:column>						
			<f:facet name="footer">				
			</f:facet>
		</rich:dataTable>
		
						
		
		
		<rich:dataTable id="conveyanceTable" value="#{travelRequest.travelSettlement.conveyanceExpenses}" var="conveyance" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="CONVEYANCE"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="conveyanceDate" value="#{conveyance.date}" datePattern="MM/dd/yy" >
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="conveyanceDetails" value="#{conveyance.details}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="conveyanceCurrency" value="#{conveyance.currency}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="conveyanceBillNo" value="#{conveyance.billNo}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="conveyanceForexAmount" value="#{conveyance.forexAmount}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalConveyance}" event="onchange" reRender="totalConveyance,totalConveyanceINR,displayTotalConveyance,displayTotalConveyanceINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,conveyanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="conveyanceConversionRate" value="#{conveyance.conversionRate}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalConveyance}" event="onchange" reRender="totalConveyance,totalConveyanceINR,displayTotalConveyance,displayTotalConveyanceINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,conveyanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:inputText id="conveyanceINRAmount" value="#{conveyance.INRAmount}" readonly="true">
				<f:convertNumber type="number"/>					
					
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="conveyanceRemarks" value="#{conveyance.remarks}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeConveyanceTableRow}" reRender="conveyanceTable,totalConveyance,displayTotalConveyance,totalExpenses,totalConveyanceINR,displayTotalConveyanceINR,totalExpensesINR" disabled="#{travelRequest.travelSettlement.disableConveyanceTableRowDelete}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="conveyanceTable" action="#{travelProcessor.addConveyanceTableRow}" id="addRowConveyance" >
				</a4j:commandButton>
			</f:facet>			
		</rich:dataTable>
		
		<table style="margin-top:20px;">
			<tr>
				<td>Total Conveyance Expenses</td>
				<td><h:outputText id="totalConveyance" value="#{travelRequest.travelSettlement.totalConveyanceExpenses}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			<tr>
				<td>Total INR</td>
				<td><h:outputText id="totalConveyanceINR" value="#{travelRequest.travelSettlement.totalConveyanceExpensesINR}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			
		</table>			
		
		
		<rich:dataTable id="othersTable" value="#{travelRequest.travelSettlement.othersExpenses}" var="others" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="Others - Telephone/Fax/Etc."/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="othersDate" value="#{others.date}" datePattern="MM/dd/yy" >
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="othersDetails" value="#{others.details}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="othersCurrency" value="#{others.currency}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="othersBillNo" value="#{others.billNo}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="othersForexAmount" value="#{others.forexAmount}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalOthers}" event="onchange" reRender="totalOthers,totalOthersINR,displayTotalOthers,displayTotalOthersINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,othersINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="othersConversionRate" value="#{others.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalOthers}" event="onchange" reRender="totalOthers,totalOthersINR,displayTotalOthers,displayTotalOthersINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,othersINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:inputText id="othersINRAmount" value="#{others.INRAmount}" readonly="true">
				<f:convertNumber type="number"/>										
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="othersRemarks" value="#{others.remarks}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeOthersTableRow}" reRender="othersTable,totalOthers,displayTotalOthers,totalExpenses,totalOthersINR,displayTotalOthersINR,totalExpensesINR" disabled="#{travelRequest.travelSettlement.disableOthersTableRowDelete}" >
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="othersTable" action="#{travelProcessor.addOthersTableRow}" id="addRowOthers" >
				</a4j:commandButton>
			</f:facet>			
		</rich:dataTable>
		
		<table style="margin-top:20px;">
			<tr>
				<td>Total Others Expenses</td>
				<td><h:outputText id="totalOthers" value="#{travelRequest.travelSettlement.totalOtherExpenses}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			<tr>
				<td>Total INR</td>
				<td><h:outputText id="totalOthersINR" value="#{travelRequest.travelSettlement.totalOtherExpensesINR}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			
		</table>
		
		
		
		<rich:dataTable id="entertainmentTable" value="#{travelRequest.travelSettlement.entertainmentExpenses}" var="entertainment" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="Entertainment/Gift/Etc."/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="entertainmentDate"
						value="#{entertainment.date}"
						datePattern="MM/dd/yy" >
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="entertainmentDetails" value="#{entertainment.details}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="entertainmentCurrency" value="#{entertainment.currency}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="entertainmentBillNo" value="#{entertainment.billNo}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="entertainmentForexAmount" value="#{entertainment.forexAmount}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalEntertainment}" event="onchange" reRender="totalEntertainment,totalEntertainmentINR,displayTotalEntertainment,displayTotalEntertainmentINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,entertainmentINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="entertainmentConversionRate" value="#{entertainment.conversionRate}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalEntertainment}" event="onchange" reRender="totalEntertainment,totalEntertainmentINR,displayTotalEntertainment,displayTotalEntertainmentINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,entertainmentINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in"/>
				</f:facet>
				<h:inputText id="entertainmentINRAmount" value="#{entertainment.INRAmount}" readonly="true">				
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="entertainmentRemarks" value="#{entertainment.remarks}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeEntertainmentTableRow}" reRender="entertainmentTable,totalEntertainment,displayTotalEntertainment,totalExpenses,totalEntertainmentINR,displayTotalEntertainmentINR,totalExpensesINR" disabled="#{travelRequest.travelSettlement.disableEntertainmentTableRowDelete}" >
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="entertainmentTable" action="#{travelProcessor.addEntertainmentTableRow}" id="addRowEntertainment">
				</a4j:commandButton>
			</f:facet>			
		</rich:dataTable>
		
		<table style="margin-top:20px;">
			<tr>
				<td>Total  Entertainment/Gift/Etc. Expenses</td>
				<td><h:outputText id="totalEntertainment" value="#{travelRequest.travelSettlement.totalEntertainmentExpenses}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			<tr>
				<td>Total INR</td>
				<td><h:outputText id="totalEntertainmentINR" value="#{travelRequest.travelSettlement.totalEntertainmentExpensesINR}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			
		</table>
		


		
		<rich:dataTable id="miscellaneousTable" value="#{travelRequest.travelSettlement.miscellaneousExpenses}" var="miscellaneous" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:20px;">
			<f:facet name="header">
				<h:outputText value="Miscellaneous"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="miscellaneousDate"
						value="#{miscellaneous.date}"
						datePattern="MM/dd/yy" >
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="miscellaneousDetails" value="#{miscellaneous.details}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="miscellaneousCurrency" value="#{miscellaneous.currency}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="miscellaneousBillNo" value="#{miscellaneous.billNo}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="miscellaneousForexAmount" value="#{miscellaneous.forexAmount}" >
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalMiscellaneous}" event="onchange" reRender="totalMiscellaneous,totalMiscellaneousINR,displayTotalMiscellaneous,displayTotalMiscellaneousINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,miscellaneousINRAmount" status="waitStatus"/>					
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="miscellaneousConversionRate" value="#{miscellaneous.conversionRate}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalMiscellaneous}" event="onchange" reRender="totalMiscellaneous,totalMiscellaneousINR,displayTotalMiscellaneous,displayTotalMiscellaneousINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,miscellaneousINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in"/>
				</f:facet>
				<h:inputText id="miscellaneousINRAmount" value="#{miscellaneous.INRAmount}" readonly="true">
				<f:convertNumber type="number"/>										
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="miscellaneousRemarks" value="#{miscellaneous.remarks}" >
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeMiscellaneousTableRow}" reRender="miscellaneousTable,totalMiscellaneous,displayTotalMiscellaneous,totalExpenses,totalMiscellaneousINR,displayTotalMiscellaneous,totalExpensesINR,finalAdvanceINR,finalExpensesINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableMiscellaneousTableRowDelete}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="miscellaneousTable" action="#{travelProcessor.addMiscellaneousTableRow}" id="addRowMiscellaneous">
				</a4j:commandButton>
			</f:facet>
			</rich:dataTable>
		
		<table style="margin-top:20px;">
			<tr>
				<td>Total Miscellaneous Expenses</td>
				<td><h:outputText id="totalMiscellaneous" value="#{travelRequest.travelSettlement.totalMiscellaneousExpenses}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			<tr>
				<td>Total INR</td>
				<td><h:outputText id="totalMiscellaneousINR" value="#{travelRequest.travelSettlement.totalMiscellaneousExpensesINR}">
					<f:convertNumber type="number"/>
				</h:outputText> </td>				
			</tr>
			
		</table>
		

		
		<table style="margin-top:50px; border:1px;">
			<tr>
				<th>Ref. No.</th>
				<th>Details</th>
				<th>Forex Amount</th>
				<th>INR Amount in Rs.</th>
			</tr>
			<tr>
				<td>A</td><td>Lodging Expense</td><td><h:outputText id="displayTotalLodging" value="#{travelRequest.travelSettlement.totalLodgingExpenses}"/></td><td><h:outputText id="displayTotalLodgingINR" value="#{travelRequest.travelSettlement.totalLodgingExpensesINR}"/></td>
			</tr>
			<tr>
				<td>B</td><td>Traveling Daily Expense</td><td><h:outputText id="displayTotalTravelling" value="#{travelRequest.travelSettlement.totalTravellingExpenses}"/></td><td><h:outputText id="displayTotalTravellingINR" value="#{travelRequest.travelSettlement.totalTravellingExpensesINR}"/></td>
			</tr>
			<tr>
				<td>C</td><td>Conveyance Expense</td><td><h:outputText id="displayTotalConveyance" value="#{travelRequest.travelSettlement.totalConveyanceExpenses}"/></td><td><h:outputText id="displayTotalConveyanceINR" value="#{travelRequest.travelSettlement.totalConveyanceExpensesINR}"/></td>
			</tr>
			<tr>
				<td>D</td><td>Other Expense</td><td><h:outputText id="displayTotalOthers" value="#{travelRequest.travelSettlement.totalOtherExpenses}"/></td><td><h:outputText id="displayTotalOthersINR" value="#{travelRequest.travelSettlement.totalOtherExpensesINR}"/></td>
			</tr>
			<tr>
				<td>E</td><td>Entertainment Expense</td><td><h:outputText id="displayTotalEntertainment" value="#{travelRequest.travelSettlement.totalEntertainmentExpenses}"/></td><td><h:outputText id="displayTotalEntertainmentINR" value="#{travelRequest.travelSettlement.totalEntertainmentExpensesINR}"/></td>
			</tr>
			<tr>
				<td>F</td><td>Miscellaneous Expense</td><td><h:outputText id="displayTotalMiscellaneous" value="#{travelRequest.travelSettlement.totalMiscellaneousExpenses}"/></td><td><h:outputText id="displayTotalMiscellaneousINR" value="#{travelRequest.travelSettlement.totalMiscellaneousExpensesINR}"/></td>
			</tr>
			<tr>
				<td colspan="2">Total of all the expenses payable</td>
				<td><h:outputText id="totalExpenses" value="#{travelRequest.travelSettlement.totalOfAllExpenses}"/></td><td><h:outputText id="totalExpensesINR" value="#{travelRequest.travelSettlement.totlaExpenses}"/></td>
			</tr>
		</table>
		<br>
		<br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Settlement of Travel Advance
		
		<table>
			<tr>
				<th>Details</th>
				<th>INR Amount in Rs.</th>
			</tr>
			<tr>
				<td>Advance taken</td><td><h:outputText id="finalAdvanceINR" value="#{travelRequest.travelSettlement.advanceTaken}"/></td>
			</tr>
			<tr>
				<td>Total Expenses as above settled</td><td><h:outputText id="finalExpensesINR" value="#{travelRequest.travelSettlement.totlaExpenses}"/></td>
			</tr>
			<tr>
				<td>Difference - Paid/Recovered</td><td><h:outputText id="finalDifferenceINR" value="#{travelRequest.travelSettlement.difference}"/></td>
			</tr>
		</table>
		
		<br>
		<center><h:commandButton id="submit" value="submit"
			action="#{travelProcessor.print}"/>&nbsp;</center>
	</h:form> *&nbsp;&nbsp;=&nbsp;&nbsp;required</div>
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
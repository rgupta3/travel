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
	<div class="post"><h:outputText value="#{msg.outputname_header}" />
	<h2>Travel Settlement Form</h2>
	<h:form id="travelSettlementForm">
	<label><b>Travel Settlement ID : <h:outputText id="travelReqId" value="#{travelRequest.id}"/></b></label>	
	<table style="width: 883px; height: 122px; margin-top: 30px;">
			<tr>
				<td style="width: 120px">Name</td>
				<td style="width: 320px"><h:outputText id="name"
					value="#{travelRequest.employee.name}" >
				</h:outputText></td>
				<td style="width: 123px">Departure Date*</td>
				<td style="width: 320px"><h:outputText id="departureDate"
						value="#{travelRequest.travelSettlement.departureDate}"
						/></td>
			</tr>

			<tr>

				<td>Designation/Emp. Code *</td>
				<td><h:outputText id="designation"
					value="#{travelRequest.employee.designation}">
				</h:outputText></td>
				<td>Arrival Date *</td>
				<td><h:outputText id="arrivalDate" value="#{travelRequest.travelSettlement.arrivalDate}" /></td>
			</tr>
			<tr>
				<td>Department *</td>
				<td><h:outputText id="department"
					value="#{travelRequest.employee.department}">
				</h:outputText></td>
				<td>Date of Submission *</td>
				<td>
					<h:outputText id="submissionDate" value="#{travelRequest.travelSettlement.submissionDate}" />
					
				</td>
			</tr>
			<tr>
				<td>Reporting Manager *</td>
				<td><h:outputText id="reportingManager"
					value="#{travelRequest.travelSettlement.reportingManager}" >
				</h:outputText></td>
				<td>No. of Days *</td>
				<td><h:outputText id="noOfDays" value="#{travelRequest.travelSettlement.noOfDays}">
					<f:convertNumber type="number"/>
				</h:outputText></td>
			</tr>
			
			<tr>
				<td>Unit *</td>
				<td><h:outputText id="unit" value="#{travelRequest.employee.unit}" >
				</h:outputText></td>
				<td>Project Code</td>
				<td><h:outputText id="projectCode"
					value="#{travelRequest.employee.projectCode}" >
				</h:outputText></td>
			</tr>
			<tr>
				<td>Project Name</td>
				<td><h:outputText id="projectName"
					value="#{travelRequest.employee.projectName}" >
				</h:outputText></td>
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
					
					<h:outputText id="advanceAmountDate" value="#{advance.date}"/>
				
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="advanceAmountType" value="#{advance.type}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="advanceAmountCurrency" value="#{advance.currency}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="advanceAmountBillNo" value="#{advance.billNo}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="advanceAmountForexAmount" value="#{advance.forexAmount}" >
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalAdvance}" event="onchange" reRender="totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR,advanceAmountINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
				<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="advanceAmountConversionRate" value="#{advance.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalAdvance}" event="onchange" reRender="totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR,advanceAmountINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:outputText id="advanceAmountINRAmount" value="#{advance.INRAmount}" >
				<f:convertNumber type="number"/>				
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="advanceAmountRemarks" value="#{advance.remarks}" >
				</h:outputText>
			</h:column>
	
			
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
				<h:outputText value="A: LODGING"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
				
					<h:outputText id="lodgingDate"
						value="#{lodging.date}"
						/>
					
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="lodgingDetails" value="#{lodging.details}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="lodgingCurrency" value="#{lodging.currency}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="lodgingBillNo" value="#{lodging.billNo}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="lodgingForexAmount" value="#{lodging.forexAmount}" >
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalLodging}" event="onchange" reRender="totalLodging,totalLodgingINR,displayTotalLodging,displayTotalLodgingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,lodgingINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="lodgingConversionRate" value="#{lodging.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalLodging}" event="onchange" reRender="totalLodging,totalLodgingINR,displayTotalLodging,displayTotalLodgingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,lodgingINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>										
				</f:facet>
				<h:outputText id="lodgingINRAmount" value="#{lodging.INRAmount}" >
				<f:convertNumber type="number"/>										
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="lodgingRemarks" value="#{lodging.remarks}" >
				</h:outputText>
			</h:column>
			
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
		
		
		
		
		
		<rich:dataTable id="travellingTable" value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpense}" var="travelling" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="B: TRAVELLING DAILY ADVANCE"/>
			</f:facet>		
			<h:column>
				<f:facet name="header">
					<h:outputText value="No. of days"/>
				</f:facet>
					<h:outputText id="travelingDailyAllowanceNoOfDays" value="#{travelRequest.travelSettlement.noOfDays}" >
						<f:convertNumber type="number"/>
					</h:outputText>					
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="travelingDailyAllowanceDetails" value="#{travelling.details}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="travelingDailyAllowanceCurrency" value="#{travelling.currency}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="travelingDailyAllowanceExpensesBillNo" value="#{travelling.billNo}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="travelingDailyAllowanceForexAmount" value="#{travelling.forexAmount}" >
					<f:convertNumber type="number"/>
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalTravelling}" event="onchange" reRender="displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="travelingDailyAllowanceConversionRate" value="#{travelling.conversionRate}" >
				<f:convertNumber type="number"/>
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalTravelling}" event="onchange" reRender="displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>					
				</f:facet>
				<h:outputText id="travelingDailyAllowanceINRAmount" value="#{travelling.INRAmount}">
				<f:convertNumber type="number"/>					
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="travelingDailyAllowanceRemarks" value="#{travelling.remarks}" >
				</h:outputText>
			</h:column>						
			<f:facet name="footer">				
			</f:facet>
		</rich:dataTable>
		
						
		
		
		<rich:dataTable id="conveyanceTable" value="#{travelRequest.travelSettlement.conveyanceExpenses}" var="conveyance" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="C: CONVEYANCE"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
				<h:outputText id="conveyanceDate" value="#{conveyance.date}" />
					
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="conveyanceDetails" value="#{conveyance.details}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="conveyanceCurrency" value="#{conveyance.currency}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="conveyanceBillNo" value="#{conveyance.billNo}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="conveyanceForexAmount" value="#{conveyance.forexAmount}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalConveyance}" event="onchange" reRender="totalConveyance,totalConveyanceINR,displayTotalConveyance,displayTotalConveyanceINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,conveyanceINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="conveyanceConversionRate" value="#{conveyance.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalConveyance}" event="onchange" reRender="totalConveyance,totalConveyanceINR,displayTotalConveyance,displayTotalConveyanceINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,conveyanceINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:outputText id="conveyanceINRAmount" value="#{conveyance.INRAmount}" >
				<f:convertNumber type="number"/>					
					
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="conveyanceRemarks" value="#{conveyance.remarks}" >
				</h:outputText>
			</h:column>
			
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
				<h:outputText value="D: Others - Telephone/Fax/Etc."/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<h:outputText id="othersDate" value="#{others.date}" />
					
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="othersDetails" value="#{others.details}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="othersCurrency" value="#{others.currency}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="othersBillNo" value="#{others.billNo}" > 
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="othersForexAmount" value="#{others.forexAmount}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalOthers}" event="onchange" reRender="totalOthers,totalOthersINR,displayTotalOthers,displayTotalOthersINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,othersINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="othersConversionRate" value="#{others.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalOthers}" event="onchange" reRender="totalOthers,totalOthersINR,displayTotalOthers,displayTotalOthersINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,othersINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:outputText id="othersINRAmount" value="#{others.INRAmount}" >
				<f:convertNumber type="number"/>										
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="othersRemarks" value="#{others.remarks}" >
				</h:outputText>
			</h:column>
			
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
		
		
		
		<rich:dataTable id="entertainmentTable" value="#{travelRequest.travelSettlement.entertainmentExpenses}" var="entertainment" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;" >
			<f:facet name="header">
				<h:outputText value="E: Entertainment/Gift/Etc."/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
				<h:outputText id="entertainmentDate"
						value="#{entertainment.date}"
					/>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="entertainmentDetails" value="#{entertainment.details}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="entertainmentCurrency" value="#{entertainment.currency}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="entertainmentBillNo" value="#{entertainment.billNo}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="entertainmentForexAmount" value="#{entertainment.forexAmount}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalEntertainment}" event="onchange" reRender="totalEntertainment,totalEntertainmentINR,displayTotalEntertainment,displayTotalEntertainmentINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,entertainmentINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="entertainmentConversionRate" value="#{entertainment.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalEntertainment}" event="onchange" reRender="totalEntertainment,totalEntertainmentINR,displayTotalEntertainment,displayTotalEntertainmentINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,entertainmentINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in"/>
				</f:facet>
				<h:outputText id="entertainmentINRAmount" value="#{entertainment.INRAmount}" >				
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="entertainmentRemarks" value="#{entertainment.remarks}" >
				</h:outputText>
			</h:column>
			
		</rich:dataTable>
		
		<table style="margin-top:20px;">
			<tr>
				<td>Total  Entertainment/Gift/Etc. Expenses</td>
				<td><h:outputText id="totalEntertainment" value="#{travelRequest.travelSettlement.totalEntertainmentExpenses}" >
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
				<h:outputText value="F: Miscellaneous"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<h:outputText id="miscellaneousDate"
						value="#{miscellaneous.date}"
						/>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:outputText id="miscellaneousDetails" value="#{miscellaneous.details}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:outputText id="miscellaneousCurrency" value="#{miscellaneous.currency}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:outputText id="miscellaneousBillNo" value="#{miscellaneous.billNo}" >
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:outputText id="miscellaneousForexAmount" value="#{miscellaneous.forexAmount}" >
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalMiscellaneous}" event="onchange" reRender="totalMiscellaneous,totalMiscellaneousINR,displayTotalMiscellaneous,displayTotalMiscellaneousINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,miscellaneousINRAmount" status="waitStatus"/>					
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:outputText id="miscellaneousConversionRate" value="#{miscellaneous.conversionRate}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalMiscellaneous}" event="onchange" reRender="totalMiscellaneous,totalMiscellaneousINR,displayTotalMiscellaneous,displayTotalMiscellaneousINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,miscellaneousINRAmount" status="waitStatus"/>
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in"/>
				</f:facet>
				<h:outputText id="miscellaneousINRAmount" value="#{miscellaneous.INRAmount}" >
				<f:convertNumber type="number"/>										
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:outputText id="miscellaneousRemarks" value="#{miscellaneous.remarks}" >
				</h:outputText>
			</h:column>
		
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
		

		
		<table class="sample" >
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
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h2>Settlement of Travel Advance</h2>
		
		<table class="sample" >
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
		<h:panelGroup id="travelSettlApprovalId" rendered="#{travelRequest.travelSettlement.status=='SETTLEMENT_FILLED_BY_EMPLOYEE' && loginBean.role=='finance'}">
				Comments :
				<h:inputTextarea id="comments" value="#{travelProcessor.approvalComment}"/>
				<br/><center>
				<h:commandButton id="accept" value="Accept" action="#{travelProcessor.financeSettlementAccept}"/>
				<h:commandButton id="reject" value="Reject" action="#{travelProcessor.financeSettlementReject}"/></center>				
		</h:panelGroup>
		<center></center>
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
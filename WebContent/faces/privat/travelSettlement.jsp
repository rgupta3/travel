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
		<label><br><b>Travel Settlement ID : <h:outputText id="travelReqId" value="#{travelRequest.id}"/></b></label>
		<table style="width: 883px; height: 122px; margin-top: 30px;">
			<tr>
				<td style="width: 120px">Name</td>
				<td style="width: 320px"><h:inputText id="name"
					value="#{travelRequest.employee.name}" readonly="true">
				</h:inputText></td>
				<td style="width: 123px">Departure Date*</td>
				<td style="width: 320px"><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="departureDate" disabled="#{loginBean.role!='finance'}"
						value="#{travelRequest.travelSettlement.departureDate}" datePattern="MM/dd/yy HH:mm">
						<a4j:support ajaxSingle="true" action="#{travelProcessor.computeDaysForSettlement}" event="onchanged"
						reRender="travelingDailyAllowanceForexAmount,noOfDays,travelingDailyAllowanceNoOfDays,displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus" ></a4j:support>
					</rich:calendar>
				</a4j:outputPanel></td>
			</tr>

			<tr>

				<td>Designation/Emp. Code *</td>
				<td><h:inputText id="designation"
					value="#{travelRequest.employee.designation}" readonly="true">
				</h:inputText></td>
				<td>Arrival Date *</td>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="arrivalDate" value="#{travelRequest.travelSettlement.arrivalDate}" datePattern="MM/dd/yy HH:mm" disabled="#{loginBean.role!='finance'}">					
						<a4j:support ajaxSingle="true" action="#{travelProcessor.computeDaysForSettlement}" event="onchanged" reRender="travelingDailyAllowanceForexAmount,noOfDays,travelingDailyAllowanceNoOfDays,displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
					</rich:calendar>
				</a4j:outputPanel></td>
			</tr>
			<tr>
				<td>Department *</td>
				<td><h:inputText id="department" value="#{travelRequest.employee.department}" readonly="true">
				</h:inputText></td>
				<td>Date of Submission *</td>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar disabled="#{loginBean.role!='finance'}" id="submissionDate" value="#{travelRequest.travelSettlement.submissionDate}" datePattern="MM/dd/yy" >
					</rich:calendar>
				</a4j:outputPanel></td>
			</tr>
			<tr>
				<td>Reporting Manager *</td>
				<td><h:inputText id="reportingManager"
					value="#{travelRequest.travelSettlement.reportingManager}" readonly="#{loginBean.role!='finance'}">
				</h:inputText></td>
				<td>No. of Days *</td>
				<td><h:inputText id="noOfDays" value="#{travelRequest.travelSettlement.noOfDays}" readonly="true">
					<f:convertNumber type="number"/>
				</h:inputText></td>
			</tr>
			
			<tr>
				<td>Unit *</td>
				<td><h:inputText id="unit" value="#{travelRequest.employee.unit}" readonly="true">
				</h:inputText></td>
				<td>Project Code</td>
				<td><h:inputText id="projectCode"
					value="#{travelRequest.employee.projectCode}" readonly="true">
				</h:inputText></td>
			</tr>
			<tr>
				<td>Project Name</td>
				<td><h:inputText id="projectName"
					value="#{travelRequest.employee.projectName}" readonly="true">
				</h:inputText></td>
			</tr>
		</table>

		
		
		
		<rich:dataTable id="advanceTable" value="#{travelRequest.travelSettlement.advanceAmounts}" var="advance" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="DETAILS OF ADVANCE OF FOREX TAKEN"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" /> 
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="advanceAmountDate" value="#{advance.date}" datePattern="MM/dd/yy" disabled="#{loginBean.role!='finance'}">
					<a4j:support ajaxSingle="true" event="onchanged"/>
					</rich:calendar>
				</a4j:outputPanel>		
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Base of calculations"/>
				</f:facet>
				<h:inputText id="advanceAmountType" value="#{advance.type}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="advanceAmountCurrency" value="#{advance.currency}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="advanceAmountBillNo" value="#{advance.billNo}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="advanceAmountForexAmount" value="#{advance.forexAmount}" disabled="#{loginBean.role!='finance'}">
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalAdvance}" event="onchange" reRender="totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR,advanceAmountINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
				<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="advanceAmountConversionRate" value="#{advance.conversionRate}" disabled="#{loginBean.role!='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalAdvance}" event="onchange" reRender="totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR,advanceAmountINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:inputText id="advanceAmountINRAmount" value="#{advance.INRAmount}" readonly="true" disabled="#{loginBean.role!='finance'}">
				<f:convertNumber type="number"/>				
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="advanceAmountRemarks" value="#{advance.remarks}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeAdvanceTableRow}" reRender="advanceTable,totalAdvance,totalAdvanceINR,finalAdvanceINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableAdvanceTableRowDelete || loginBean.role!='finance'}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			
					
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" action="#{travelProcessor.addAdvanceTableRow}" reRender="advanceTable" id="addRowAdvance" disabled="#{loginBean.role!='finance'}">
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
				<h:outputText value="A: LODGING"/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date" />
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="lodgingDate" value="#{lodging.date}" datePattern="MM/dd/yy" disabled="#{loginBean.role=='finance'}">
					<a4j:support ajaxSingle="true" event="onchanged"/>
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Location / Organised by / Hotel Name"/>
				</f:facet>
				<h:inputText id="lodgingDetails" value="#{lodging.details}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="lodgingCurrency" value="#{lodging.currency}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="lodgingBillNo" value="#{lodging.billNo}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="lodgingForexAmount" value="#{lodging.forexAmount}" disabled="#{loginBean.role=='finance'}">
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalLodging}" event="onchange" reRender="totalLodging,totalLodgingINR,displayTotalLodging,displayTotalLodgingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,lodgingINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="lodgingConversionRate" value="#{lodging.conversionRate}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalLodging}" event="onchange" reRender="totalLodging,totalLodgingINR,displayTotalLodging,displayTotalLodgingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,lodgingINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>										
				</f:facet>
				<h:inputText id="lodgingINRAmount" value="#{lodging.INRAmount}" readonly="true" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>										
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="lodgingRemarks" value="#{lodging.remarks}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeLodgingTableRow}" reRender="lodgingTable,totalLodging,displayTotalLodging,totalExpenses,totalLodgingINR,displayTotalLodgingINR,totalExpensesINR,finalAdvanceINR,finalExpensesINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableLodgingTableRowDelete || loginBean.role=='finance'}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="lodgingTable" action="#{travelProcessor.addLodgingTableRow}" id="addRowLodging" disabled="#{loginBean.role=='finance'}">
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
		
		
		
		
		
		<rich:dataTable id="travellingTable" value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpense}" var="travelling" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;">
			<f:facet name="header">
				<h:outputText value="B: TRAVELLING DAILY ADVANCE"/>
			</f:facet>		
			<h:column>
				<f:facet name="header">
					<h:outputText value="No. of days"/>
				</f:facet>
					<h:inputText id="travelingDailyAllowanceNoOfDays" value="#{travelRequest.travelSettlement.noOfDays}" disabled="#{loginBean.role!='finance'}" readonly="true">
						<f:convertNumber type="number"/>
					</h:inputText>					
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Zone / Class / Details / Rate"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceDetails" value="#{travelling.details}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceCurrency" value="#{travelling.currency}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Rate of Allowance"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceExpensesBillNo" value="#{travelling.billNo}" disabled="#{loginBean.role!='finance'}">
				<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateForex}" event="onchange" reRender="travelingDailyAllowanceForexAmount,displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceForexAmount" value="#{travelling.forexAmount}" disabled="#{loginBean.role!='finance'}">
					<f:convertNumber type="number"/>
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalTravelling}" event="onchange" reRender="displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceConversionRate" value="#{travelling.conversionRate}" disabled="#{loginBean.role!='finance'}">
				<f:convertNumber type="number"/>
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalTravelling}" event="onchange" reRender="displayTotalTravelling,displayTotalTravellingINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,travelingDailyAllowanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>					
				</f:facet>
				<h:inputText id="travelingDailyAllowanceINRAmount" value="#{travelling.INRAmount}" readonly="true" disabled="#{loginBean.role!='finance'}">
				<f:convertNumber type="number"/>					
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="travelingDailyAllowanceRemarks" value="#{travelling.remarks}" disabled="#{loginBean.role!='finance'}">
				</h:inputText>
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
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="conveyanceDate" value="#{conveyance.date}" datePattern="MM/dd/yy" disabled="#{loginBean.role=='finance'}">
						<a4j:support ajaxSingle="true" event="onchanged"/>
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="From Location - To Location"/>
				</f:facet>
				<h:inputText id="conveyanceDetails" value="#{conveyance.details}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="conveyanceCurrency" value="#{conveyance.currency}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="conveyanceBillNo" value="#{conveyance.billNo}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="conveyanceForexAmount" value="#{conveyance.forexAmount}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalConveyance}" event="onchange" reRender="totalConveyance,totalConveyanceINR,displayTotalConveyance,displayTotalConveyanceINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,conveyanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="conveyanceConversionRate" value="#{conveyance.conversionRate}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalConveyance}" event="onchange" reRender="totalConveyance,totalConveyanceINR,displayTotalConveyance,displayTotalConveyanceINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,conveyanceINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:inputText id="conveyanceINRAmount" value="#{conveyance.INRAmount}" readonly="true" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="conveyanceRemarks" value="#{conveyance.remarks}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeConveyanceTableRow}" reRender="conveyanceTable,totalConveyance,displayTotalConveyance,totalExpenses,totalConveyanceINR,displayTotalConveyanceINR,totalExpensesINR,finalAdvanceINR,finalExpensesINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableConveyanceTableRowDelete || loginBean.role=='finance'}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="conveyanceTable" action="#{travelProcessor.addConveyanceTableRow}" id="addRowConveyance" disabled="#{loginBean.role=='finance'}" >
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
				<h:outputText value="D: Others - Telephone/Fax/Etc."/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="othersDate" value="#{others.date}" datePattern="MM/dd/yy" disabled="#{loginBean.role=='finance'}" >
						<a4j:support ajaxSingle="true" event="onchanged"/>
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Details"/>
				</f:facet>
				<h:inputText id="othersDetails" value="#{others.details}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="othersCurrency" value="#{others.currency}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="othersBillNo" value="#{others.billNo}" disabled="#{loginBean.role=='finance'}"> 
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="othersForexAmount" value="#{others.forexAmount}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalOthers}" event="onchange" reRender="totalOthers,totalOthersINR,displayTotalOthers,displayTotalOthersINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,othersINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="othersConversionRate" value="#{others.conversionRate}" disabled="#{loginBean.role=='finance'}" >
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalOthers}" event="onchange" reRender="totalOthers,totalOthersINR,displayTotalOthers,displayTotalOthersINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,othersINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in RS"/>
				</f:facet>
				<h:inputText id="othersINRAmount" value="#{others.INRAmount}" readonly="true" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>										
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="othersRemarks" value="#{others.remarks}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeOthersTableRow}" reRender="othersTable,totalOthers,displayTotalOthers,totalExpenses,totalOthersINR,displayTotalOthersINR,totalExpensesINR,finalAdvanceINR,finalExpensesINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableOthersTableRowDelete || loginBean.role=='finance'}" >
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="othersTable" action="#{travelProcessor.addOthersTableRow}" id="addRowOthers" disabled="#{loginBean.role=='finance'}">
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
		
		
		
		<rich:dataTable id="entertainmentTable" value="#{travelRequest.travelSettlement.entertainmentExpenses}" var="entertainment" rowKeyVar="row" bgcolor="#F1F1F1" border="10" cellpadding="5" cellspacing="3" first="0" rows="0" dir="LTR" frame="box" rules="all" style="width:883px; margin-top:40px;" >
			<f:facet name="header">
				<h:outputText value="E: Entertainment/Gift/Etc."/>
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Date"/>
				</f:facet>
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="entertainmentDate" value="#{entertainment.date}" datePattern="MM/dd/yy" disabled="#{loginBean.role=='finance'}">
						<a4j:support ajaxSingle="true" event="onchanged"/>
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Purpose"/>
				</f:facet>
				<h:inputText id="entertainmentDetails" value="#{entertainment.details}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="entertainmentCurrency" value="#{entertainment.currency}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="entertainmentBillNo" value="#{entertainment.billNo}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="entertainmentForexAmount" value="#{entertainment.forexAmount}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalEntertainment}" event="onchange" reRender="totalEntertainment,totalEntertainmentINR,displayTotalEntertainment,displayTotalEntertainmentINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,entertainmentINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="entertainmentConversionRate" value="#{entertainment.conversionRate}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalEntertainment}" event="onchange" reRender="totalEntertainment,totalEntertainmentINR,displayTotalEntertainment,displayTotalEntertainmentINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,entertainmentINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in"/>
				</f:facet>
				<h:inputText id="entertainmentINRAmount" value="#{entertainment.INRAmount}" readonly="true" disabled="#{loginBean.role=='finance'}">				
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="entertainmentRemarks" value="#{entertainment.remarks}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeEntertainmentTableRow}" reRender="entertainmentTable,totalEntertainment,displayTotalEntertainment,totalExpenses,totalEntertainmentINR,displayTotalEntertainmentINR,totalExpensesINR,finalAdvanceINR,finalExpensesINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableEntertainmentTableRowDelete || loginBean.role=='finance'}" >
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="entertainmentTable" action="#{travelProcessor.addEntertainmentTableRow}" id="addRowEntertainment" disabled="#{loginBean.role=='finance'}">
				</a4j:commandButton>
			</f:facet>			
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
					<a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="miscellaneousDate" value="#{miscellaneous.date}" datePattern="MM/dd/yy" disabled="#{loginBean.role=='finance'}">
						<a4j:support ajaxSingle="true" event="onchanged"/>
					</rich:calendar>
				</a4j:outputPanel>	
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Details"/>
				</f:facet>
				<h:inputText id="miscellaneousDetails" value="#{miscellaneous.details}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Currency"/>
				</f:facet>
				<h:inputText id="miscellaneousCurrency" value="#{miscellaneous.currency}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Bill No."/>
				</f:facet>
				<h:inputText id="miscellaneousBillNo" value="#{miscellaneous.billNo}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Forex Amount"/>
				</f:facet>
				<h:inputText id="miscellaneousForexAmount" value="#{miscellaneous.forexAmount}" disabled="#{loginBean.role=='finance'}">
					<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalMiscellaneous}" event="onchange" reRender="totalMiscellaneous,totalMiscellaneousINR,displayTotalMiscellaneous,displayTotalMiscellaneousINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,miscellaneousINRAmount" status="waitStatus"/>					
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Conversion Rate"/>
				</f:facet>
				<h:inputText id="miscellaneousConversionRate" value="#{miscellaneous.conversionRate}" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>					
					<a4j:support ajaxSingle="true" action="#{travelProcessor.calculateTotalMiscellaneous}" event="onchange" reRender="totalMiscellaneous,totalMiscellaneousINR,displayTotalMiscellaneous,displayTotalMiscellaneousINR,totalExpenses,totalExpensesINR,finalExpensesINR,finalDifferenceINR,miscellaneousINRAmount" status="waitStatus"/>
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="INR Ammount in"/>
				</f:facet>
				<h:inputText id="miscellaneousINRAmount" value="#{miscellaneous.INRAmount}" readonly="true" disabled="#{loginBean.role=='finance'}">
				<f:convertNumber type="number"/>										
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Remarks"/>
				</f:facet>
				<h:inputText id="miscellaneousRemarks" value="#{miscellaneous.remarks}" disabled="#{loginBean.role=='finance'}">
				</h:inputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Delete"/>
				</f:facet>
						<a4j:commandButton value="Delete" action="#{travelProcessor.removeMiscellaneousTableRow}" reRender="miscellaneousTable,totalMiscellaneous,displayTotalMiscellaneous,totalExpenses,totalMiscellaneousINR,displayTotalMiscellaneous,totalExpensesINR,finalAdvanceINR,finalExpensesINR,finalDifferenceINR" disabled="#{travelRequest.travelSettlement.disableMiscellaneousTableRowDelete || loginBean.role=='finance'}">
  							<f:setPropertyActionListener value="#{row}" target="#{travelProcessor.rowIndex}"/>
     				 	</a4j:commandButton>
			</h:column>
			
			<f:facet name="footer">
				<a4j:commandButton value="Add Row" reRender="miscellaneousTable" action="#{travelProcessor.addMiscellaneousTableRow}" id="addRowMiscellaneous" disabled="#{loginBean.role=='finance'}">
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
		<center><h:commandButton id="submit" value="submit"
			action="#{travelProcessor.printForSettlement}"/>&nbsp;</center>
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
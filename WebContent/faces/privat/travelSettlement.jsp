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
	<link rel="shortcut icon" href="../../images/favicon.ico"
		type="image/x-icon" />
	<title>Travel Settlement Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script language="javaScript" type="text/javascript" src="calendar.js"></script>
	<link href="../style/style.css" rel="stylesheet" type="text/css"
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
					value="#{travelRequest.employee.name}"
					disabled="#{travelRequest.disable2}" readonly="true">
				</h:inputText></td>
				<td style="width: 123px">Departure Date *</td>
				<td style="width: 320px"><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="departureDate"
						value="#{travelRequest.travelSettlement.departureDate}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
			</tr>

			<tr>

				<td>Designation/Emp. Code *</td>
				<td><h:inputText id="designation"
					value="#{travelRequest.employee.designation}"
					disabled="#{travelRequest.disable2}" readonly="true">
				</h:inputText></td>
				<td>Departure Time *</td>
				<td><h:inputText id="departureTime"
					value="#{travelRequest.travelSettlement.}"
					disabled="#{travelRequest.disable2}" readonly="true">
					<f:convertDateTime type="date" dateStyle="short" />
				</h:inputText></td>
			</tr>
			<tr>
				<td>Department *</td>
				<td><h:inputText id="department"
					value="#{travelRequest.employee.department}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td>Arrival Date *</td>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="arrivalDate"
						value="#{travelRequest.travelSettlement.arrivalDate}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
			</tr>
			<tr>
				<td>Reporting Manager *</td>
				<td><h:inputText id="reportingManager"
					value="#{travelRequest.employee.}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td>Arrival Time *</td>
				<td><h:inputText id="arrivalTime"
					value="#{travelRequest.travelSettlement.}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td>Date of Submission *</td>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="submissionDate"
						value="#{travelRequest.travelSettlement.submissionDate}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td>No. of Days *</td>
				<td><h:inputText id="noOfDays"
					value="#{travelRequest.travelSettlement.noOfDays}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td>Unit *</td>
				<td><h:selectOneMenu id="unit"
					value="#{travelRequest.employee.unit}"
					disabled="#{travelRequest.disable2}">
					<f:selectItem id="GDC" itemLabel="GDC" itemValue="GDC" />
					<f:selectItem id="GSC" itemLabel="GSC" itemValue="GSC" />
				</h:selectOneMenu></td>
				<td>Project Code</td>
				<td><h:inputText id="projectCode"
					value="#{travelRequest.travelSettlement.}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td>Project Name</td>
				<td><h:inputText id="projectName"
					value="#{travelRequest.employee.projectName.}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>

		<br>&nbsp; ADVANCE  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Details of Advance of Forex taken</td>

		<table>
			<tr>
				<th>Date</th>
				<th>Base of calculations</th>
				<th>Currency</th>
				<th>Bill No.</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="advanceAmountDate"
						value="#{travelRequest.travelSettlement.advanceAmounts[0].date}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="advanceAmountType"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].type}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="advanceAmountCurrency"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="advanceAmountBillNo"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="advanceAmountForexAmount"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="advanceAmountConversionRate"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="advanceAmountINRAmount"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="advanceAmountRemarks"
					value="#{travelRequest.travelSettlement.advanceAmounts[0].remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td colspan="2">Total - Forex - Advance taken</td>
				<td></td>
				<td></td>
				<td><h:inputText id="advanceAmountForexTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td></td>
				<td><h:inputText id="advanceAmountINRTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>

		<br>&nbsp; (A)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lodging</td>
		
		<table>
			<tr>
				<th>Date</th>
				<th>Location/Organised by/Hotel Name</th>
				<th>Currency</th>
				<th>Bill No.</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="lodgingDate"
						value="#{travelRequest.travelSettlement.lodgingExpenses[0].date}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="lodgingDetails"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].details}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="lodgingCurrency"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="lodgingBillNo"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="lodgingForexAmount"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="lodgingConversionRate"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="lodgingINRAmount"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="lodgingRemarks"
					value="#{travelRequest.travelSettlement.lodgingExpenses[0].remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td colspan="2">Total - Lodging Expenses</td>
				<td></td>
				<td></td>
				<td><h:inputText id="lodgingForexTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td></td>
				<td><h:inputText id="lodgingINRTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>
		
		<br>&nbsp; (B)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Traveling Daily Allowance</td>
		
		<table>
			<tr>
				<th>No. of days</th>
				<th>Zone/Class/Details/Rate</th>
				<th>Currency</th>
				<th>Rate of Allowance</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="travelingDailyAllowanceNoOfDays"
						value="#{travelRequest.travelSettlement.noOfDays}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="travelingDailyAllowanceDetails"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.details}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="travelingDailyAllowanceCurrency"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="travelingDailyAllowanceExpensesBillNo"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="travelingDailyAllowanceForexAmount"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="travelingDailyAllowanceConversionRate"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="travelingDailyAllowanceINRAmount"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="travelingDailyAllowanceRemarks"
					value="#{travelRequest.travelSettlement.travelingDailyAllowanceExpenses.remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>
		
		<br>&nbsp; (C)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Conveyance</td>
		
		<table>
			<tr>
				<th>Date</th>
				<th>Conveyance</th>
				<th>Currency</th>
				<th>Bill No.</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="conveyanceDate"
						value="#{travelRequest.travelSettlement.conveyanceExpenses[0].date}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="conveyanceDetails"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].details}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="conveyanceCurrency"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="conveyanceBillNo"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="conveyanceForexAmount"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="conveyanceConversionRate"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="conveyanceINRAmount"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="conveyanceRemarks"
					value="#{travelRequest.travelSettlement.conveyanceExpenses[0].remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td colspan="2">Total - Conveyance</td>
				<td></td>
				<td></td>
				<td><h:inputText id="conveyanceForexTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td></td>
				<td><h:inputText id="conveyanceINRTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>
		
		<br>&nbsp; (D)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others - Telephone/Fax/Etc.</td>
		
		<table>
			<tr>
				<th>Date</th>
				<th>Details</th>
				<th>Currency</th>
				<th>Bill No.</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="othersDate"
						value="#{travelRequest.travelSettlement.othersExpenses[0].date}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="othersDetails"
					value="#{travelRequest.travelSettlement.othersExpenses[0].details}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="othersCurrency"
					value="#{travelRequest.travelSettlement.othersExpenses[0].currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="othersBillNo"
					value="#{travelRequest.travelSettlement.othersExpenses[0].billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="othersForexAmount"
					value="#{travelRequest.travelSettlement.othersExpenses[0].forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="othersConversionRate"
					value="#{travelRequest.travelSettlement.othersExpenses[0].conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="othersINRAmount"
					value="#{travelRequest.travelSettlement.othersExpenses[0].INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="othersRemarks"
					value="#{travelRequest.travelSettlement.othersExpenses[0].remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td colspan="2">Total - Others - Telephone/Fax</td>
				<td></td>
				<td></td>
				<td><h:inputText id="othersForexTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td></td>
				<td><h:inputText id="othersINRTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>
		
		<br>&nbsp; (E)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Entertainment/Gifts/Etc.</td>
		
		<table>
			<tr>
				<th>Date</th>
				<th>Purpose</th>
				<th>Currency</th>
				<th>Bill No.</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="entertainmentDate"
						value="#{travelRequest.travelSettlement.entertainmentExpenses[0].date}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="entertainmentDetails"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].details}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="entertainmentCurrency"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="entertainmentBillNo"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="entertainmentForexAmount"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="entertainmentConversionRate"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="entertainmentINRAmount"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="entertainmentRemarks"
					value="#{travelRequest.travelSettlement.entertainmentExpenses[0].remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td colspan="2">Total - Others - Telephone/Fax</td>
				<td></td>
				<td></td>
				<td><h:inputText id="entertainmentForexTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td></td>
				<td><h:inputText id="entertainmentINRTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>
		
		<br>&nbsp; (F)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Miscellaneous</td>
		
		<table>
			<tr>
				<th>Date</th>
				<th>Details</th>
				<th>Currency</th>
				<th>Bill No.</th>
				<th>Forex Amount</th>
				<th>Conversion Rate</th>
				<th>INR Amount in Rs.</th>
				<th>Remarks</th>
			</tr>
			<tr>
				<td><a4j:outputPanel ajaxRendered="true">
					<rich:calendar id="miscellaneousDate"
						value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].date}"
						datePattern="MM/dd/yy" disabled="#{travelRequest.disable2}">
					</rich:calendar>
				</a4j:outputPanel></td>
				<td><h:inputText id="miscellaneousDetails"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].details}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="miscellaneousCurrency"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].currency}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="miscellaneousBillNo"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].billNo}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="miscellaneousForexAmount"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].forexAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="miscellaneousConversionRate"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].conversionRate}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="miscellaneousINRAmount"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].INRAmount}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td><h:inputText id="miscellaneousRemarks"
					value="#{travelRequest.travelSettlement.miscellaneousExpenses[0].remarks}"
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
			<tr>
				<td colspan="2">Total - Miscellaneous</td>
				<td></td>
				<td></td>
				<td><h:inputText id="miscellaneousForexTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
				<td></td>
				<td><h:inputText id="miscellaneousINRTotal"
					value=""
					disabled="#{travelRequest.disable2}">
				</h:inputText></td>
			</tr>
		</table>
		
		<br>&nbsp; TOTAL   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TOTAL EXPENSES (A to F)</td>
		
		<table>
			<tr>
				<th>Ref. No.</th>
				<th>Details</th>
				<th>Forex Amount</th>
				<th>INR Amount in Rs.</th>
			</tr>
			<tr>
				<td>A</td><td>Lodging Expense</td><td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>B</td><td>Traveling Daily Expense</td><td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>C</td><td>Conveyance Expense</td><td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>D</td><td>Other Expense</td><td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>E</td><td>Entertainment Expense</td><td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>F</td><td>Miscellaneous Expense</td><td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td colspan="2">Total of all the expenses payable</td>
				<td><h:outputText value="Display Total Forex Here"/></td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
		</table>
		
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Settlement of Travel Advance</td>
		
		<table>
			<tr>
				<th>Details</th>
				<th>INR Amount in Rs.</th>
			</tr>
			<tr>
				<td>Advance taken</td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>Total Expenses as above settled</td><td><h:outputText value="Display Total INR Here"/></td>
			</tr>
			<tr>
				<td>Difference - Paid/Recovered</td><td><h:outputText value="Display Total INR Diff Here"/></td>
			</tr>
		</table>
		
		<br>
		<center><h:commandButton id="submit" value="submit"
			action="#{travelProcessor.print}"
			disabled="#{travelRequest.disable2}" />&nbsp;</center>
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
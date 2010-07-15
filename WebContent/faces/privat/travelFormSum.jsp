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
	<link rel="shortcut icon" href="/travel/WebContent/images/favicon.ico" type="image/x-icon" />
	<title>Travel Request Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="/travel/style/style.css" rel="stylesheet" type="text/css" media="screen" />
	</head>
	<body>
	<div id="wrapper">
	<jsp:include page="/faces/privat/header.html" />
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post">
	<h2>Travel Summary</h2>
	
	<h:form id="travelForm"> <h:messages />
	<label><b>Travel Request ID :
	<h:outputText id="travelReqId" 
					value="#{travelRequest.id}" >
					
				</h:outputText></b><br></br></label>
	<label>Status :<b>
	<h:outputText id="status" 
					value="#{travelRequest.status}" >
					
				</h:outputText></b><br>
				<h:commandLink style="font-size: 16px;" rendered="#{travelRequest.status=='REQUEST_APPROVED_BY_FINANCE' && travelProcessor.financeDesk}" value="Initiate Settlement" action="#{travelProcessor.initiateSettlement}"></h:commandLink>
				 <br></label>
		<label>Initiator Name  <h:outputText id="initiator" value="xyz"/>
		</label><br><br>Type of travel  <h:outputText id="type" value="#{travelRequest.type}"/>
		<br><br>Country  <h:outputText id="country" value="#{travelRequest.country}"></h:outputText><br>Grade     <h:outputText id="grade" value="#{travelRequest.employee.grade}"/>
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
				<td style="width: 116px">Unit </td>
				<td style="width: 346px"><h:outputText id="unit" 
					value="#{travelRequest.employee.unit}" >
				</h:outputText> </td>
				<td style="width: 122px">Project Name </td>
				<td style="width: 170px"><h:outputText id="projectName" 
					value="#{travelRequest.employee.projectName}" >
				</h:outputText> </td>
			</tr>
			<tr>
				<td>Email Id </td>
				<td style="width: 389px"><h:outputText id="emailId"
					value="#{travelRequest.employee.emailId}" >
					
				</h:outputText></td>
					<td style="width: 122px">Project Code</td>
				<td style="width: 170px"><h:outputText id="projectCode" 
					value="#{travelRequest.employee.projectCode}" >
				</h:outputText> </td>
			</tr>
			<tr>
				<td>Department </td>
				<td><h:outputText id="department" 
					value="#{travelRequest.employee.department}" >
					
				</h:outputText></td>
				<td style="width: 136px">Tel.Ext.No </td>
				<td style="width: 161px"><h:outputText id="telExt"
					value="#{travelRequest.employee.telephoneExt}" /></td>
			</tr>
			<tr>				
				<td style="width: 169px">Purpose of travel </td>
				<td><h:outputText id="purpose" 
					value="#{travelRequest.travelDetails.purpose}" >
				</h:outputText> </td>
				<td style="width: 136px">Mobile Number </td>
				<td style="width: 161px"><h:outputText id="mobileNumber"
					value="#{travelRequest.employee.mobileNumber}" /></td>
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
				<td>Chargeable Type :</td>
				<td style="width: 247px"><h:outputText id="chargeableType"
					value="#{travelRequest.chargeableType}">

				</h:outputText></td></tr><tr>
				<td><h:outputText rendered="#{travelRequest.chargeableType=='chargeable'}" value="SLA Number:" />
				</td><td> <h:outputText rendered="#{travelRequest.chargeableType=='chargeable'}" value="#{travelRequest.employee.slaNumber}">
				</h:outputText> </td>
			</tr>
<tr>	<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}"
					value="Conversion Rate (Dollar to Local)" /></td>
<td>
<h:inputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}" id="conversionRateLocal" value="#{travelRequest.conversionRateLocal}" >
<a4j:support ajaxSingle="true"
	event="onkeyup"
	action="#{travelProcessor.calculateAmount}"
			reRender=
			"totalAllowance,hAmountINR,totalAirportTransportLocal,conveyanceLocal,otherAllowanceLocal,totalDailyAllowanceLocal,totalAllowanceLocal,
			totalAirportTransportINR,conveyanceINR,otherAllowanceINR,totalDailyAllowanceINR,totalAllowanceINR" status="waitStatus"></a4j:support>
		
				</h:inputText>
				
				</td></tr>
				<tr>	<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}"
					value="Conversion Rate (Dollar to INR)" /></td>
<td>
<h:inputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}" id="conversionRateINR" value="#{travelRequest.conversionRateINR}" >
<a4j:support ajaxSingle="true"
action="#{travelProcessor.computeHotelINR}"
		event="onkeyup"
			reRender=
			"totalAllowance,hAmountINR,totalAirportTransportDollar,conveyanceDollar,otherAllowanceDollar,totalDailyAllowanceDollar,totalAllowanceDollar,
			totalAirportTransportINR,conveyanceINR,otherAllowanceINR,totalDailyAllowanceINR,totalAllowanceINR" status="waitStatus"></a4j:support>
				
				</h:inputText>	
				
				</td></tr>
<tr>	<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}"
					value="Conversion Rate (Local to INR)" /></td>
<td>
<h:inputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}" id="conversionRateLocaltoINR" value="#{travelRequest.conversionRateLocaltoINR}" >
<a4j:support ajaxSingle="true"
action="#{travelProcessor.computeHotelINR}"
	event="onkeyup"
			reRender=
			"totalAllowance,hAmountINR,totalAirportTransportLocal,conveyanceLocal,otherAllowanceLocal,totalDailyAllowanceLocal,totalAllowanceLocal,
			totalAirportTransportINR,conveyanceINR,otherAllowanceINR,totalDailyAllowanceINR,totalAllowanceINR" status="waitStatus"></a4j:support>
				
				</h:inputText>	
				
				</td></tr>
				<tr>
				
		</table>
		<br>
		<rich:dataTable id="travelDataTable" value="#{travelRequest.travelResv}"
			var="travelResvItem" bgcolor="#F1F1F1" border="5" cellpadding="1"
			cellspacing="1" first="0" rows="0" width="100%" dir="LTR" frame="box"
			rules="all"  >
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
				</f:facet><h:outputText value="From:" />
				<h:outputText id="from" value="#{travelResvItem.travelFrom}">
				</h:outputText><h:outputText value=" To:" />
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
			</f:facet><h:outputText value="From:" />
				<h:outputText id="depTime" value="#{travelResvItem.depTime}">
				</h:outputText><h:outputText value=" To:" />
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
			
		</rich:dataTable>
		<br>
		<table>
			<tr>
				<td>Hotel payment by : </td>
				<td><h:outputText id="paidBy"
					value="#{travelRequest.payment}">
					
				</h:outputText></td>
				
			</tr>
			<tr><td>Local Currency :</td><td>
			<h:outputText id="localCurrency" value="#{travelRequest.travelDetails.allowance.currency}" /></td></tr>
		</table>
		<rich:dataTable id="hotelDataTable" value="#{travelRequest.hotelResv}"
			var="hotelResvItem" bgcolor="#F1F1F1" border="5" cellpadding="1"
			cellspacing="1" first="0" rows="0" width="100%" dir="LTR" frame="box"
			rules="all" >
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
					<h:outputText value="Hotel name" />
				</f:facet>
				<h:outputText id="hName" value="#{hotelResvItem.name}">
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
					<h:outputText value="Per Day Amount" />
				</f:facet>
				<h:outputText id="hAmountPerDay" value="#{hotelResvItem.amountPerDay}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Total Amount" />
				</f:facet>
				<h:outputText id="hAmount" value="#{hotelResvItem.amount}">
					<f:convertNumber type="number" />
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Total Amount INR" />
				</f:facet>
				<h:outputText id="hAmountINR" value="#{hotelResvItem.amountINR}">
				<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText>
			</h:column>
		</rich:dataTable>
		<br>
		<rich:dataTable id="approvalDataTable" value="#{travelRequest.requestApprovals}"
			var="requestApprovalItem" bgcolor="#F1F1F1" border="5" cellpadding="1"
			cellspacing="1" first="0" rows="0" width="100%" dir="LTR" frame="box"
			rules="all"  rendered="#{not empty travelRequest.requestApprovals}">
			<f:facet name="header">
				<h:outputText value="Travel Approval details" />
			</f:facet>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Timestamp" />
				</f:facet>
				<h:outputText id="timestamp" value="#{requestApprovalItem.timestamp}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Approver" />
				</f:facet>
				<h:outputText id="approver" value="#{requestApprovalItem.approvorType}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Status" />
				</f:facet>
				<h:outputText id="travelstatus" value="#{requestApprovalItem.status}">
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Comments" />
				</f:facet>
				<h:outputText id="comments" value="#{requestApprovalItem.comments}">
				</h:outputText>
			</h:column>
		</rich:dataTable>
	
		<table>
		<tr>
		<td></td>
		<td></td>
		<td><h:outputText value="#{travelRequest.travelDetails.allowance.currency}" rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}"></h:outputText></td>
		<td><h:outputText value="INR" rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}"></h:outputText></td></tr>
		<tr>
				<td>Airport Transport (Advance Amt.)</td>
				<td><h:outputText id="perDayAllowance" 
					value="#{travelRequest.travelDetails.allowance.airportTransport}">
					<f:convertNumber type="number" />
				</h:outputText>
				<h:outputText id="currency1" value="#{travelProcessor.allowanceCurrency}"> 
					</h:outputText>
					x 2<h:outputText value="= "/><h:outputText id="totalAirportTransport" value="#{travelRequest.travelDetails.allowance.airportTransport * 2}"> 
					</h:outputText>
					</td>
					
					<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}" id="totalAirportTransportLocal"
					value="#{2*travelRequest.travelDetails.allowance.airportTransport * travelRequest.conversionRateLocal}"> 
					<f:convertNumber type="number" maxFractionDigits="2"/>
					</h:outputText></td>
					<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}" id="totalAirportTransportINR"
					value="#{2*travelRequest.travelDetails.allowance.airportTransport * travelRequest.conversionRateINR}"> 
					<f:convertNumber type="number" maxFractionDigits="2"/>
					
					</h:outputText></td>
			</tr>
			<tr>
				<td>Days</td>
				<td><h:outputText id="days"
					value="#{travelRequest.travelDetails.allowance.days}">
					<f:convertNumber type="number" />
				</h:outputText></td>
			</tr>
			<tr>
				<td>Daily Allowance</td>
				<td><h:outputText id="dailyAllowance"
					value="#{travelRequest.travelDetails.allowance.dailyAllowance}">
					<f:convertNumber type="number" />
				</h:outputText>
				<h:outputText id="currency2" value="#{travelProcessor.allowanceCurrency}" /> 
				x 
					<h:outputText id="daysOutput" value="#{travelRequest.travelDetails.allowance.days}" />
					= <h:outputText id="totalDailyAllowance" 
					value="#{travelRequest.travelDetails.allowance.dailyAllowance *travelRequest.travelDetails.allowance.days}"> 
					</h:outputText>
					</td><td>
	
					<h:outputText id="totalDailyAllowanceLocal" rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}"
					value="#{travelRequest.travelDetails.allowance.dailyAllowance * travelRequest.travelDetails.allowance.days * travelRequest.conversionRateLocal}" > 
					<f:convertNumber type="number" maxFractionDigits="2"/>
					</h:outputText>
					</td>
					<td>
	
					<h:outputText id="totalDailyAllowanceINR" rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}"
					value="#{travelRequest.travelDetails.allowance.dailyAllowance * travelRequest.travelDetails.allowance.days * travelRequest.conversionRateINR}" > 
					<f:convertNumber type="number" maxFractionDigits="2"/>
					</h:outputText>
					</td>
			</tr>
			<tr>
				<td>Conveyance*</td>
				<td><h:outputText id="miscAllowance"
					value="#{travelRequest.travelDetails.allowance.conveyance}">
					<f:convertNumber type="number" />
				</h:outputText>
				<h:outputText id="currency3" value="#{travelProcessor.allowanceCurrency}"> 
					</h:outputText></td><td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}" 
					 id="conveyanceLocal" value="#{travelRequest.travelDetails.allowance.conveyance *travelRequest.conversionRateLocal}" >
					<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText> </td>
			<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}" 
					 id="conveyanceINR" value="#{travelRequest.travelDetails.allowance.conveyance *travelRequest.conversionRateINR}" >
					<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText> </td>	
		
			</tr>
			
			<tr>
				<td><h:outputText id="otherAllowanceDetail" value="#{travelRequest.travelDetails.allowance.otherAllowanceDetail}"/></td>
				<td><h:outputText id="otherAllowance" value="#{travelRequest.travelDetails.allowance.otherAllowance}">
					<f:convertNumber type="number" />
				</h:outputText>
				<h:outputText id="currency5" value="#{travelProcessor.allowanceCurrency}"> 
					</h:outputText></td><td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}" id="otherAllowanceLocal" value="#{travelRequest.travelDetails.allowance.otherAllowance *travelRequest.conversionRateLocal}" >
					<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText> </td>
				<td><h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}" id="otherAllowanceINR" value="#{travelRequest.travelDetails.allowance.otherAllowance*travelRequest.conversionRateINR}" >
					<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText> </td>
			</tr>
			<tr>
				<td><h:outputText rendered="#{travelRequest.status!='REQUEST_INITIATED_BY_EMPLOYEE' || travelProcessor.financeDesk}" value="Amount" /></td>
				<td><h:outputText rendered="#{travelRequest.status!='REQUEST_INITIATED_BY_EMPLOYEE' || travelProcessor.financeDesk}" id="totalAllowance" value="#{travelRequest.amount/travelRequest.conversionRateINR}">
					<f:convertNumber type="number" />
				</h:outputText>
				<h:outputText rendered="#{travelRequest.status!='REQUEST_INITIATED_BY_EMPLOYEE' || travelProcessor.financeDesk}" id="currency4" value="#{travelProcessor.allowanceCurrency}"> 
					</h:outputText>
				</td><td>	<h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international' && travelRequest.travelDetails.allowance.currency!='USD'}" id="totalAllowanceLocal" value="#{travelRequest.amount /travelRequest.conversionRateINR *travelRequest.conversionRateLocal}" >
					<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText> </td>
				<td>	<h:outputText rendered="#{travelProcessor.financeDesk && travelRequest.type=='international'}" id="totalAllowanceINR" value="#{travelRequest.amount}" >
					<f:convertNumber type="number" maxFractionDigits="2"/>
				</h:outputText> </td>
			</tr>
			<tr>
				<td>Recommended by</td>
				<td><h:outputText id="recommendedEmpMailId"
					value="#{travelRequest.travelDetails.recommndedEmpMailId}">

				</h:outputText></td>
			</tr>
			<tr>
				<td>Authorised by</td>
				<td><h:outputText id="authorisedEmpMailId"
					value="#{travelRequest.travelDetails.authorisedEmpMailId}">

				</h:outputText></td>
			</tr>
		</table>
		<br/><br/>
		<h:panelGroup id="travelApprovalId" rendered="#{travelRequest.status=='REQUEST_INITIATED_BY_EMPLOYEE' && travelProcessor.financeDesk}">
				Comments :
				<h:inputTextarea id="comments" value="#{travelProcessor.approvalComment}"></h:inputTextarea>
				<br></br><center>
				<h:commandButton id="accept" value="Accept" 
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
	<p></p>
	</div>
	</div>
	<!-- end #footer --></div>
	</body>
</f:view>
</html>
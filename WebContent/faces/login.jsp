<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="a4j" uri="https://ajax4jsf.dev.java.net/ajax" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<html>
<f:view>
	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="/travel/style/style.css" type="image/x-icon" />
	<title>Travel Request Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="/travel/style/style.css" rel="stylesheet" type="text/css" media="screen" />
	
	</head>
	<body >
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
		<li><a href="/travel/dashboard">Home</a></li>
		<li><a href="/travel/travelRequest">Create</a></li>
		<li><a href="/travel/search">Search</a></li>
		<li><a href="#">Help</a></li>
	</ul>
	</div>
	<!-- end #menu -->


	</div>
	<!-- end #header --> 
	<!-- end #header-wrapper -->
	<div id="page">
	<div id="page-bgtop">
	<div id="content">
	<div class="post" style="height: 26em;">
	
	
	
	<div style="width: 213px">
	<h:form id="loginForm" prependId="false">
		<script type="text/javascript">
			<c:if test="#{redirect == 'true'}">
				<input type="hidden" name="redirect" value="true" />
			</c:if>
		</script>
			<h:outputText value="#{loginBean.errorMessage}" style="color:red" />
			<br></br>
			<label for="j_username"><h:outputText value="Username:" /><br />
			</label>
			<h:inputText id="j_username" required="true">
			</h:inputText>

			<br />
			<br />
			<label for="j_password"><h:outputText value="Password:" /><br />
			</label>
			<h:inputSecret id="j_password" required="true">
			</h:inputSecret>

			<br />
			<br />
			<label for="_spring_security_remember_me"> <h:outputText
				value="Remember me" /> </label>
			<h:selectBooleanCheckbox id="_spring_security_remember_me" />
			<br />

			<h:commandButton type="submit" id="login"
				action="#{loginBean.doLogin}" value="Login" />

  			
  			

		</h:form>
	</div>
	
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
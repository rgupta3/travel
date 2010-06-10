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
	<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
	<title>Travel Request Form</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script language="javaScript" 
    type="text/javascript" src="calendar.js"></script>
	<link href="../style/style.css" rel="stylesheet" type="text/css" media="screen" />
	
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
	
	
	
	<div style="width: 213px">
	<h:form id="loginForm" prependId="false">
		<script type="text/javascript">
			<c:if test="#{redirect == 'true'}">
				<input type="hidden" name="redirect" value="true" />
			</c:if>
		</script>
			
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
	<div id="footer-bgcontent" style="margin-top:300px;">
	<div id="footer">
	<p><a href="#"> Copyright &copy; 2010 www.sony.com. All rights reserved. Design by suhas.</a></p>
	</div>
	</div>
	<!-- end #footer --></div>
	</body>
</f:view>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../Component/allcss.jsp"%>
<title>Add Specialist</title>
</head>
<body>
	<%@ include file="AdminNavbar.jsp"%>



	<div class="container fs-4 col-md-4" style="padding-top: 100px">
		<p class="fs-4 text-center">Add Specialist</p>
		

		<c:if test="${ empty Success}">
			<c:redirect url="../AdminLogin.jsp"></c:redirect>
			<c:remove var="Success" />
		</c:if>

		
	</div>

</body>
</html>
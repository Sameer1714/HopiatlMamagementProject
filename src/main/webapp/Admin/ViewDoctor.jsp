<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../Component/allcss.jsp"%>
<title>View Doctor</title>
<style type="text/css">
.table {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>
	<%@ include file="AdminNavbar.jsp"%>




	<hr>

	<div class="container">
		<p class="fs-4 text-center">Doctor Information</p>


		<c:if test="${not empty Error }">
			<P class="text-center text-danger fs-4">
				<i class='fas fa-exclamation' style='font-size: 23px; color: red'></i>
				${DeleteError}
			</P>
			<c:remove var="DeleteError" />
		</c:if>

		<c:if test="${not empty DSuccess }">
			<P class="text-center text-success text- fs-4">
				<i class="fa fa-check" style="font-size: 23px; color: green"></i>
				${DSuccess }
			</P>
			<c:remove var="DSuccess" />
		</c:if>

		<c:if test="${ empty Success}">
			<c:redirect url="../AdminLogin.jsp"></c:redirect>
			<c:remove var="Success" />
		</c:if>


		<table class="table" border="1px">

			<tr>
				<th>FullName</th>
				<th>MobileNumber</th>
				<th>EMAIL</th>
				<th>Qualification</th>
				<th>Specialist</th>
				<th>BirthDate</th>
				<th>Gender</th>
				<th>Action</th>

			</tr>
			<%
			DoctorDao dd = new DoctorDao();
			List<Doctor> list = dd.getAllDoctors();

			for (Doctor d : list) {
			%>
			<tr>
				<td><%=d.getFullName()%></td>
				<td><%=d.getMobileNumber()%></td>
				<td><%=d.getEmail()%></td>
				<td><%=d.getQualification()%></td>
				<td><%=d.getSpecialistName()%></td>
				<td><%=d.getBirthDate()%></td>
				<td><%=d.getGender()%></td>
				<td><a href="EditDoctor.jsp?Id=<%=d.getId()%>"><button
							class="btn btn-success">Edit</button></a>&nbsp &nbsp <a
					href="../DeleteDoctor?Id=<%=d.getId()%>" style="color: red"><button
							class="btn btn-danger">Delete</button></a></td>
			</tr>

			<%
			}
			%>

		</table>
	</div>
	<div class="sd " style="padding-top: 300px">
		<%@include file="../Component/Footer.jsp"%>
	</div>

</body>
</html>
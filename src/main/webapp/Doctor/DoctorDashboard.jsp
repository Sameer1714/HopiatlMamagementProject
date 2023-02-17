<%@page import="com.dao.BookAppointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="../Component/allcss.jsp"%>
<title>Doctor Dashboard</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>

	<%@ include file="DoctorNavbar.jsp"%>

	<%
	DoctorDao dd = new DoctorDao();
	int DoctorCount = dd.getTotalDoctorCount();
	Doctor d = (Doctor) session.getAttribute("Doctor");
	int DoctorId = d.getId();

	BookAppointmentDao bd = new BookAppointmentDao();
	int Count = bd.getParticularDoctorAppointmentCount(DoctorId);
	%>

	<c:if test="${ empty Doctor }">
		<c:redirect url="../DoctorLogin.jsp"></c:redirect>
		<c:remove var="Error" />
	</c:if>


	<div class="container p-5">
		<p class="fs-3 text-center">Doctor Dashboard</p>

		<div class="row">

			<div class="col-md-2 " class="sd"></div>

			<div class="col-md-4 " class="sd">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<p class="fs-4 text-center">
							<i class="fa-solid fa-hospital-user" style="font-size: 100px;"></i><br>Doctor<br><%=DoctorCount%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4" class="sd">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<p class="fs-4 text-center">
							<i class="fa-solid fa-calendar-check" style="font-size: 100px;"></i><br>Total
							Appointment<br><%=Count%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sd " style="padding-top: 173px" >
		<%@include file="../Component/Footer.jsp"%>
	</div>
</body>
</html>
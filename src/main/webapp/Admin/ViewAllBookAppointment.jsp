<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Patient"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.BookAppointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookAppointmentDao"%>
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
<title>ViewAllBookAppointment</title>
<style type="text/css">
.table {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>
	<%@ include file="AdminNavbar.jsp"%>



	<hr>

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


	<div class="container-fluid p-5 ">
		<div class="row">

			<div class="col-md-12">

				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-3 text-center btn-light">All Book Appointment
							Information</p>

						<table class="table">
							<thead>

								<tr>
									<th scope="col">Patient FullName</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Phone No</th>
									<th scope="col">Address</th>
									<th scope="col">Diseases</th>
									<th scope="col">DoctorName</th>
									<th scope="col">Status</th>
								</tr>
							</thead>

							<tbody>
								<%
								BookAppointmentDao bd = new BookAppointmentDao();
								List<BookAppointment> list = bd.getAllBookAppointment();

								DoctorDao dd = new DoctorDao();

								for (BookAppointment b : list) {
									Doctor doc = dd.getParticularDoctorInfo(b.getDoctorId());
								%>
								<tr>
									<td><%=b.getFullName()%></td>
									<td><%=b.getGender()%></td>
									<td><%=b.getAge()%></td>
									<td><%=b.getAppointmentDate()%></td>
									<td><%=b.getEmail()%></td>
									<td><%=b.getMobileNumber()%></td>
									<td><%=b.getAddress()%></td>
									<td><%=b.getDisease()%></td>
									<td><%=doc.getFullName()%>(<%=doc.getSpecialistName()%>)</td>

									<%
									String pen = b.getStatus();
									%>

									<%
									if (pen.equals("Pending")) {
									%>
									<td><button class="btn btn-warning"><%=b.getStatus()%></button></td>
									<%
									} else {
									%>
									<td><button class="btn btn-success"><%=b.getStatus()%></button></td>
									<%
									}
									%>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="sd ">
		<%@include file="../Component/Footer.jsp"%>
	</div>

</body>
</html>
<%@page import="com.entity.Patient"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.BookAppointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookAppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allcss.jsp"%>
<title>View BookAppointment</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>
	<hr>
	<c:if test="${ empty Patient }">
		<c:redirect url="PatientLogin.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid p-5 ">
		<div class="row">

			<div class="col-md-9">

				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-3 text-center btn-light">Book Appointment
							Infomation</p>

						<table class="table">
							<thead>

								<tr>
									<th scope="col">FullName</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">DoctorName</th>
									<th scope="col">Status</th>
								</tr>
							</thead>

							<tbody>
								<%
								Patient p = (Patient) session.getAttribute("Patient");
								int PatientId = p.getId();
								BookAppointmentDao bd = new BookAppointmentDao();
								List<BookAppointment> list = bd.getAppoinmentBookByPatientId(PatientId);

								//Find Doctor by DoctorID
								DoctorDao dd = new DoctorDao();

								for (BookAppointment b : list) {

									Doctor d = dd.getParticularDoctorInfo(b.getDoctorId());
								%>
								<tr>
									<td><%=b.getFullName()%></td>
									<td><%=b.getGender()%></td>
									<td><%=b.getAge()%></td>
									<td><%=b.getAppointmentDate()%></td>
									<td><%=b.getDisease()%></td>
									<td><%=d.getFullName()%>(<%=d.getSpecialistName()%>)</td>

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
			<div class="col-md-3 p-1">
				<img alt="image" src="image/Desk3.png" height="405px" width="">
			</div>
		</div>
	</div>

	<div class="sd p-1">
		<%@include file="Component/Footer.jsp"%>
	</div>


</body>
</html>
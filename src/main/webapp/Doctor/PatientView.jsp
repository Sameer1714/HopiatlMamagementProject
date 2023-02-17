<%@page import="com.entity.BookAppointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookAppointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../Component/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Patient Appointment</title>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
<body>
	<%@ include file="DoctorNavbar.jsp"%>
	<c:if test="${ empty Doctor }">
		<c:redirect url="../DoctorLogin.jsp"></c:redirect>
		<c:remove var="Error" />
	</c:if>


	<div class="container p-5 ">
		<div class="row">

			<div class="col-md-12">

				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-3 text-center btn-light">Patient Appointment</p>

						<c:if test="${not empty Error }">
							<P class="text-center text-danger fs-4">
								<i class='fas fa-exclamation'
									style='font-size: 23px; color: red'></i> ${Error}
							</P>
							<c:remove var="Error" />
						</c:if>

						<c:if test="${not empty Success }">
							<P class="text-center text-success text- fs-4">
								<i class="fa fa-check" style="font-size: 23px; color: green"></i>
								${Success }
							</P>
							<c:remove var="Success" />
						</c:if>

						<table class="table">
							<thead>

								<tr>
									<th scope="col">FullName</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Phone No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("Doctor");
								int DoctorId = d.getId();
								BookAppointmentDao bd = new BookAppointmentDao();
								List<BookAppointment> list = bd.getAppoinmentBookByDoctorId(DoctorId);

								for (BookAppointment b : list) {
								%>
								<tr>
									<td><%=b.getFullName()%></td>
									<td><%=b.getGender()%></td>
									<td><%=b.getAge()%></td>
									<td><%=b.getAppointmentDate()%></td>
									<td><%=b.getEmail()%></td>
									<td><%=b.getMobileNumber()%></td>
									<td><%=b.getDisease()%></td>

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
									<td>
										<%
										if (pen.equals("Pending")) {
										%> <a
										href="PatientCommnet.jsp?Id=<%=b.getId()%>"
										class="btn btn-success btn-sm">Comment</a> <%
 } else {
 %> <a
										href="#" class="btn btn-success btn-sm disabled">Comment</a> <%
 }
 %>

									</td>
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

	<div class="sd " style="padding-top:22px">
		<%@include file="../Component/Footer.jsp"%>
	</div>

</body>
</html>
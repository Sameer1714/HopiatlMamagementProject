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
<title>Patient Comment</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>

	<%@ include file="DoctorNavbar.jsp"%>
	<c:if test="${ empty Doctor }">
		<c:redirect url="../DoctorLogin.jsp"></c:redirect>
		<c:remove var="Error" />
	</c:if>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">

				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-3 text-center">Comment</p>
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

						<form class="row g-3" action="../PatientComment" method="post">

							<%
							int Id = Integer.parseInt(request.getParameter("Id"));
							Doctor d = (Doctor) session.getAttribute("Doctor");
							BookAppointmentDao bd = new BookAppointmentDao();
							BookAppointment b = bd.getAppoinmentBookById(Id, d.getId());
							%>

							<input type="hidden" name="Id" value="<%=Id%>"> <input
								type="hidden" name="DoctorId" value="<%=d.getId()%>">

							<div class="col-md-6">
								<label class="form-label"> FullName</label> <input required
									name="FullName" type="text" value="<%=b.getFullName()%>"
									class="form-control" readonly>
							</div>


							<div class="col-md-6">
								<label class="form-label"> Age</label> <input required
									name="Age" type="number" value="<%=b.getAge()%>"
									class="form-control" readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label">Email Address</label> <input required
									name="Email" type="email" value="<%=b.getEmail()%>"
									class="form-control" readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone No</label> <input required
									name="MobileNumber" type="number"
									value="<%=b.getMobileNumber()%>" class="form-control" readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label">Appointment Date</label> <input
									required name="AppointmentDate" type="date"
									value="<%=b.getAppointmentDate()%>" class="form-control"
									readonly>
							</div>

							<div class="col-md-6">
								<label class="form-label"> Diseases</label> <input required
									name="Disease" type="text" value="<%=b.getDisease()%>"
									class="form-control" readonly>
							</div>

							<div class="col-md-12">
								<label class="form-label">Comment</label>
								<textarea required name="Status" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<button type="submit"
								class="btn btn-success text-white col-md-6 offset-md-3">
								Submit Comment</button>


						</form>


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
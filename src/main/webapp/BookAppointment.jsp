<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allcss.jsp"%>
<title>Book Appointment</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>
	<hr>



	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-1">
				<img alt="image" src="image/Desk1.png">
			</div>

			<div class="col-md-6">


				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-3 text-center">Book Appointment</p>
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

						<form class="row g-3" action="BookAppointmnetBack" method="post">

							<input type="hidden" name="PatientId" value="${Patient.getId() }">

							<c:if test="${not empty Patient }">
								<div class="col-md-6">
									<label class="form-label"> FullName</label> <input required
										name="FullName" type="text" value="${Patient.getFullName() }"
										class="form-control" readonly>
								</div>
							</c:if>

							<c:if test="${ empty Patient }">
								<div class="col-md-6">
									<label class="form-label"> FullName</label> <input required
										name="FullName" type="text" class="form-control">
								</div>
							</c:if>

							<div class="col-md-6">
								<label class="form-label"> Age</label> <input required
									name="Age" type="number" class="form-control">
							</div>

							<c:if test="${not empty Patient }">
								<div class="col-md-6">
									<label class="form-label">Email Address</label> <input required
										name="Email" type="email" value="${Patient.getEmail() }"
										class="form-control" readonly>
								</div>
							</c:if>

							<c:if test="${empty Patient }">
								<div class="col-md-6">
									<label class="form-label">Email Address</label> <input required
										name="Email" type="email" class="form-control">
								</div>
							</c:if>

							<c:if test="${not empty Patient }">
								<div class="col-md-6">
									<label class="form-label">Phone No</label> <input required
										name="MobileNumber" type="number"
										value="${Patient.getMobileNumber() }" class="form-control"
										readonly>
								</div>
							</c:if>

							<c:if test="${empty Patient }">
								<div class="col-md-6">
									<label class="form-label">Phone No</label> <input required
										name="MobileNumber" type="number" class="form-control">
								</div>
							</c:if>

							<div class="col-md-6">
								<label class="form-label">Appointment Date</label> <input
									required name="AppointmentDate" type="date"
									class="form-control">
							</div>


							<div class="col-md-6">
								<label class="form-label"> Diseases</label> <input required
									name="Disease" type="text" class="form-control">
							</div>


							<div class="col-md-6">
								<label class="form-label">Doctor</label> <select required
									name="DoctorId" required class="form-control">
									<option>Choose...</option>
									<%
									DoctorDao dd = new DoctorDao();
									List<Doctor> list1 = dd.getAllDoctors();
									for (Doctor s : list1) {
									%>
									<option value="<%=s.getId()%>"><%=s.getFullName()%>(<%=s.getSpecialistName()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>



							<div class="col-md-6">
								<label class="form-label">Select Gender</label>
								<div class="form-control ">
									&nbsp <input required name="Gender" type="radio" value="Male">Male&nbsp
									&nbsp <input required name="Gender" type="radio" Value="Female">Female&nbsp
									&nbsp <input required name="Gender" type="radio" value="Other">&nbsp
									Other
								</div>
							</div>

							<c:if test="${not empty Patient }">
								<div class="col-md-12">
									<label class="form-label">Full Address</label>
									<textarea required name="Address" class="form-control" row="3"
										cols="">${Patient.getAddress() }</textarea>
								</div>
							</c:if>

							<c:if test="${ empty Patient }">
								<div class="col-md-12">
									<label class="form-label">Full Address</label>
									<textarea required name="Address" class="form-control" row="3"
										cols=""></textarea>
								</div>
							</c:if>

							<c:if test="${not empty Patient }">
								<button type="submit"
									class="btn btn-success text-white col-md-6 offset-md-3">Book
									Appointment</button>
							</c:if>

							<c:if test="${ empty Patient }">
								<a href="PatientLogin.jsp"><button type="button"
										class="btn btn-success text-white col-md-6 offset-md-3">Book
										Appointment</button></a>
							</c:if>

						</form>

					</div>


				</div>

			</div>
		</div>
	</div>

	<div class="sd">
		<%@include file="Component/Footer.jsp"%>
	</div>

</body>
</html>
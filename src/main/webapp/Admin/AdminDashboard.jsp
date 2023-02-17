<%@page import="com.dao.BookAppointmentDao"%>
<%@page import="com.dao.PatientDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../Component/allcss.jsp"%>
<title>Admin Dashboard</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>

<%
   DoctorDao dd=new DoctorDao();
   int TotalDoctor=dd.getTotalDoctorCount();
   SpecialistDao sd=new SpecialistDao();
   int TotalSpecialist=sd.getTotalSpecialistCount();
   PatientDao pd=new PatientDao();
   int TotalPatients=pd.getTotalPatientCount();
   BookAppointmentDao ba=new BookAppointmentDao();
   int TotalBookAppointment=ba.TotalBookAppointmentCount();
   
%>

	<c:if test="${ empty Success}">
		<c:redirect url="../AdminLogin.jsp"></c:redirect>
	</c:if>
	<%@include file="AdminNavbar.jsp"%>

	<div class="container p-5">
		<p class="fs-3 text-center">Admin Dashboard</p>
		<c:if test="${not empty Error }">
			<P class="text-center text-danger fs-4">
				<i class='fas fa-exclamation' style='font-size: 23px; color: red'></i>
				${Error}
			</P>
			<c:remove var="Error" />
		</c:if>

		<c:if test="${not empty SuccessSp }">
			<P class="text-center text-success text- fs-4">
				<i class="fa fa-check" style="font-size: 23px; color: green"></i>
				${SuccessSp }
			</P>
			<c:remove var="SuccessSp" />
		</c:if>

		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<p class="fs-4 text-center">
							<a href="ViewDoctor.jsp" style="color: green">
								<p class="fs-4 text-center">
									<i class="fa-solid fa-user-doctor" style="font-size: 100px;"></i>
							</a><br>View Doctor<br><%=TotalDoctor%>
						</p>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<p class="fs-4 text-center">
							<i class="fa-solid fa-hospital-user" style="font-size: 100px;"></i><br>User<br><%=TotalPatients %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<p class="fs-4 text-center">
							<i class="fa-solid fa-calendar-check" style="font-size: 100px;"></i><br>Total
							Appointment<br><%=TotalBookAppointment %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<p class="fs-4 text-center">
							<i class="fa-solid fa-stethoscope"
								style="font-size: 100px; color: green;"></i><br>Add
							Specialist<br><%=TotalSpecialist %>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>




	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enter
						Specialist Name</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../AddSpecialist" method="post">
						<div class="from-group">
							<input required name="SpecialistName" type="text"
								class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-success text-white ">ADD</button>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<div class="sd ">
		<%@include file="../Component/Footer.jsp"%>
	</div>

</body>
</html>
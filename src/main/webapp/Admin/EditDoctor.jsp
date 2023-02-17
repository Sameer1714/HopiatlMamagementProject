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
<%@include file="../Component/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Edit Doctor</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}
</style>
</head>
<body>
	<%@ include file="AdminNavbar.jsp"%>

	<hr>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4  offset-md-4">

				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-4 text-center">Update Doctor Information</p>

						<c:if test="${ empty Success}">
							<c:redirect url="../AdminLogin.jsp"></c:redirect>
							<c:remove var="Success" />
						</c:if>


						<%
						DoctorDao dd = new DoctorDao();
						Doctor d = dd.getParticularDoctorInfo(Integer.parseInt(request.getParameter("Id")));
						%>

						<form action="../EditDoctor" method="post">


							<input name="Id" type="hidden" value="<%=d.getId()%>">



							<div class="mb-3">
								<label class="form-label"> FullName</label> <input required
									name="FullName" value="<%=d.getFullName()%>" type="text"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email Address</label> <input required
									name="Email" type="email" value="<%=d.getEmail()%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="Qualification" type="text"
									value="<%=d.getQualification()%>" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Select Specialist</label> <select
									name="SpecialistName" required class="form-control">

									<option value="<%=d.getSpecialistName()%>"><%=d.getSpecialistName()%></option>
									<%
									SpecialistDao sd = new SpecialistDao();
									List<Specialist> list1 = sd.getSpecialist();
									for (Specialist s : list1) {
									%>
									<option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">BirthDate</label> <input required
									name="BirthDate" type="date" value="<%=d.getBirthDate()%>"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input required
									name="MobileNumber" type="number"
									value="<%=d.getMobileNumber()%>" class="form-control">
							</div>

							<div class="mb-3 ">
								<label class="form-label">Select Gender</label>
								<div class="form-control ">
									&nbsp &nbsp <input required name="Gender" type="radio"
										value="Male">Male&nbsp &nbsp &nbsp <input required
										name="Gender" type="radio" Value="Female">Female&nbsp
									&nbsp&nbsp &nbsp <input required name="Gender" type="radio"
										value="Other">&nbsp Other
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="Password" type="text" value="<%=d.getPassword()%>"
									class="form-control">
							</div>
							<button type="submit"
								class="btn btn-success text-white col-md-12">Update</button>
						</form>

					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>


	<div class="sd ">
		<%@include file="../Component/Footer.jsp"%>
	</div>





</body>
</html>
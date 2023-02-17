<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allcss.jsp"%>
<title>Patient Registration</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}

.sd {
	padding-top: 30px;
}
</style>
</head>
<body>

	<%@include file="Component/Navbar.jsp"%>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-4  offset-md-4">
				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-4 text-center">Patient Registration</p>
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

						<form action="PatientRegistration" method="post">

							<div class="mb-3">
								<label class="form-label"> Patient FullName</label> <input
									required name="FullName" type="text" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input required
									name="MobileNumber" type="number" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Current Address</label> <input
									required name="Address" type="tel" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email Address</label> <input required
									name="Email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">BirthDate</label> <input required
									name="BirthDate" type="date" class="form-control">
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
									name="Password" type="password" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Confirm Password</label> <input
									required name="CPassword" type="password" class="form-control">
							</div>

							<button type="submit"
								class="btn btn-success text-white col-md-12">Register</button>
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
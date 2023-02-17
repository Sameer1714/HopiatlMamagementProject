<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="../Component/allcss.jsp"%>
<title>Doctor Change Password</title>
</head>
<body>
	<%@ include file="DoctorNavbar.jsp"%>

	<c:if test="${ empty Doctor }">
		<c:redirect url="../DoctorLogin.jsp"></c:redirect>
	</c:if>


	<hr>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-4  offset-md-4">
				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-4 text-center">Change Password</p>
					
						<c:if test="${not empty Error }">
							<P class="text-center text-danger fs-4">
								<i class='fas fa-exclamation'
									style='font-size: 23px; color: red'></i> ${Error}
							</P>
							<c:remove var="Error" />
						</c:if>

						<form action="../DoctorChangePassword" method="post">

							<%
							Doctor d = (Doctor) session.getAttribute("Doctor");
							%>

							<input type="hidden" name="DoctorId" value="<%= d.getId()%>">

							<div class="mb-3">
								<label class="form-label"> Current Password</label> <input
									required name="OldPassword" type="password"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">New Password</label> <input required
									name="NewPassword" type="password" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Confirm New Password</label> <input
									required name="ConfirmPassword" type="password"
									class="form-control">
							</div>

							<button type="submit"
								class="btn btn-success text-white col-md-12">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
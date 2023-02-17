<%@page import="com.entity.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allcss.jsp"%>
<title>Change Password</title>
<style type="text/css">
.paint-card {
	box-shadow: 2px 3px 3px 2px gray;
}

.sd {
	padding-top: 110px;
}
</style>
</head>
<body>

	<%@include file="Component/Navbar.jsp"%>
	<hr>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-4  offset-md-4">
				<div class=" card paint-card">
					<div class=" card-body">
						<p class="fs-4 text-center">Change Password</p>
						<c:if test="${ empty Patient }">
							<c:redirect url="PatientLogin.jsp"></c:redirect>
						</c:if>

						<c:if test="${not empty Error }">
							<P class="text-center text-danger fs-4">
								<i class='fas fa-exclamation'
									style='font-size: 23px; color: red'></i> ${Error}
							</P>
							<c:remove var="Error" />
						</c:if>

						<form action="PatientChangePassword" method="post">

							<%
							Patient p = (Patient) session.getAttribute("Patient");
							%>

							<input type="hidden" name="PatientId" value="<%=p.getId()%>">

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

	<div class="sd  " style="padding-top: 40px">
		<%@include file="Component/Footer.jsp"%>
	</div>


</body>
</html>
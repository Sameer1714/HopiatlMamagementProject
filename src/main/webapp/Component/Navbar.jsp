
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa fa-hospital-o" aria-hidden="true"></i>MEDIPLUS HOME </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty Patient }">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="AdminLogin.jsp"><i
							class="fa fa-sign-in" aria-hidden="true"></i> ADMIN</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="DoctorLogin.jsp"><i
							class="fa fa-user-md"></i>DOCTOR</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="BookAppointment.jsp"><i class="fa fa-stethoscope"></i>
					 BOOK APPOINTMENT</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="PatientLogin.jsp"><i
							class="fa-solid fa-hospital-user"></i>User</a></li>

				</c:if>

				<c:if test="${not empty Patient }">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="BookAppointment.jsp"><i class="fa fa-stethoscope"></i>BOOK APPOINTMENT</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewAppointment.jsp"><i
							class="fa-solid fa-hospital-user"></i>VIEW APPOINTMENT</a></li>
				</c:if>




				<c:if test="${not empty Patient }">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i>${Patient.getFullName()}</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="PatientChangePassword.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="PatientLogout">Logout</a></li>
						</ul></li>
				</c:if>

			</ul>

		</div>
	</div>
</nav>
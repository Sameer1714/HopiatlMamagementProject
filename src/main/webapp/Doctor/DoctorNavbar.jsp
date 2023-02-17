<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa fa-hospital-o"
			aria-hidden="true"></i>MEDIPLUS</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="DoctorDashboard.jsp">Home</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="PatientView.jsp">Patient</a></li>
			</ul>
			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">${Doctor.getFullName() }</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item " href="DoctorChangePassword.jsp">Change Password</a></li>
						<li><a class="dropdown-item " href="../DoctorLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
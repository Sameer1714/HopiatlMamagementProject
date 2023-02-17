<%@page import="com.db.DBConection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allcss.jsp"%>
<title>Index Page</title>
<style type="text/css">

#carouselExampleControls,#sd{
box-shadow: 10px 3px 3px 5px gray;
}

</style>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>



	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/Main2.png" class="d-block w-100" alt="..."
					height="450px">
			</div>
			<div class="carousel-item">
				<img src="image/img2.jpg" class="d-block w-100" alt="..."
					height="450px">
			</div>
			<div class="carousel-item">
				<img src="image/img5.jpg" class="d-block w-100" alt="..."
					height="450px">
			</div>
			<div class="carousel-item">
				<img src="image/img1.jpg" class="d-block w-100" alt="..."
					height="450px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
<hr>
	<div class="clearfix" style="padding-top: 50px">
		<img src="image/dop2.png" class="col-md-6 float-md-end mb-3 ms-md-3"
			alt="..." height="600px">
		<p class="text-center fs-2" style="font-family: sans-serif;">Key
			Features of our Hospital</p>
		<div class="container">
			<div class="row g-2" >
				<div class="col-6"  id="sd">
					<div class="p-3 border bg-light">
						<p class="text-center fs-2">Consultation Management</p>
						<p>In case a patient wants to book an appointment with a
							physician.</p>
					</div>
				</div>
				<div class="col-6"id="sd">
					<div class="p-3 border bg-light">
						<p class="text-center fs-2">Workforce Management</p>
						<p>The availability of physicians and other providers is
							visible in this system.</p>
					</div>
				</div>
				<div class="col-6"id="sd">
					<div class="p-3 border bg-light">
						<p class="text-center fs-2">Pharmacy Management</p>
						<p>This module comprises the effective management of
							drugstores.</p>
					</div>
				</div>
				<div class="col-6"id="sd">
					<div class="p-3 border bg-light">
						<p class="text-center fs-2">Lab Management</p>
						<p>Laboratories perform well with this module. The potential
							to manage.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="container" >
		<p class="text-center fs-2">Our Teams</p>
		<div class="row" id="sd">
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
					<img src="image/doctore4.png" class="card-img-top" alt="..." height="350px">
					<div class="card-body">
					<p class="text-center fs-4" >Ms.Milli Fernandis</p>
						<p class="text-center fs-7" >Biochemistry</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
					<img src="image/doctore5.png" class="card-img-top" alt="..."height="350px">
					<div class="card-body">
					<p class="text-center fs-4" >Mr.Steve Dongal</p>
						<p class="text-center fs-7">Radio-Therapy</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
					<img src="image/doctor2.jpg" class="card-img-top" alt="..." height="350px">
					<div class="card-body">
					<p class="text-center fs-4" >Ms.Kareena Kapoor</p>
						<p class="text-center fs-7" >Skin and Venereal diseases</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
					<img src="image/doctore3.png" class="card-img-top" alt="..."height="350px">
					<div class="card-body">
					<p class="text-center fs-4" >Ms.Robot Shah</p>
						<p class="text-center fs-7">Anaesthesiology</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<hr>
<%@include file="Component/Footer.jsp"%>
</body>
</html>
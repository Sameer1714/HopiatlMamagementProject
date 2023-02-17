package com.entity;

public class BookAppointment {
 
	private int Id;
	private int PatientId;
	private int DoctorId;
	private String FullName;
	private int Age;
	private String MobileNumber;
	private String Address;
	private String Email;
	private String AppointmentDate;
	private String Disease;
	private String Gender;
	private String Status;
	
	
      


	public BookAppointment(int patientId, int doctorId, String fullName, int age, String mobileNumber, String address,
			String email, String appointmentDate, String disease, String gender, String status) {
		
		PatientId = patientId;
		DoctorId = doctorId;
		FullName = fullName;
		Age = age;
		MobileNumber = mobileNumber;
		Address = address;
		Email = email;
		AppointmentDate = appointmentDate;
		Disease = disease;
		Gender = gender;
		Status = status;
	}


	public BookAppointment(int id, int patientId, int doctorId, String fullName, int age, String mobileNumber,
			String address, String email, String appointmentDate, String disease, String gender, String status) {
		
		Id = id;
		PatientId = patientId;
		DoctorId = doctorId;
		FullName = fullName;
		Age = age;
		MobileNumber = mobileNumber;
		Address = address;
		Email = email;
		AppointmentDate = appointmentDate;
		Disease = disease;
		Gender = gender;
		Status = status;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public int getId() {
		return Id;
	}


	public void setId(int id) {
		Id = id;
	}


	public int getPatientId() {
		return PatientId;
	}


	public void setPatientId(int patientId) {
		PatientId = patientId;
	}


	public int getDoctorId() {
		return DoctorId;
	}


	public void setDoctorId(int doctorId) {
		DoctorId = doctorId;
	}


	public int getAge() {
		return Age;
	}


	public void setAge(int age) {
		Age = age;
	}


	public String getFullName() {
		return FullName;
	}


	public void setFullName(String fullName) {
		FullName = fullName;
	}


	public String getMobileNumber() {
		return MobileNumber;
	}


	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}


	public String getAddress() {
		return Address;
	}


	public void setAddress(String address) {
		Address = address;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String getAppointmentDate() {
		return AppointmentDate;
	}


	public void setAppointmentDate(String appointmentDate) {
		AppointmentDate = appointmentDate;
	}


	public String getGender() {
		return Gender;
	}


	public void setGender(String gender) {
		Gender = gender;
	}


	public String getDisease() {
		return Disease;
	}


	public void setDisease(String disease) {
		Disease = disease;
	}
	
	
}

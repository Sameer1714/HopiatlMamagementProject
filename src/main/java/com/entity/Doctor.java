package com.entity;

public class Doctor {

	private int Id;
	private String FullName;
	private String Email;
	private String Qualification;
	private String SpecialistName;
	private String BirthDate;
	private String MobileNumber;
	private String Gender;
	private String Password;

	
	
	public Doctor(int id, String fullName, String email, String qualification, String specialistName, String birthDate,
			String mobileNumber, String gender, String password) {
		
		Id = id;
		FullName = fullName;
		Email = email;
		Qualification = qualification;
		SpecialistName = specialistName;
		BirthDate = birthDate;
		MobileNumber = mobileNumber;
		Gender = gender;
		Password = password;
	}
	
	
	

	public Doctor(String fullName, String email, String qualification, String specialistName, String birthDate,
			String mobileNumber, String gender, String password) {
		super();
		FullName = fullName;
		Email = email;
		Qualification = qualification;
		SpecialistName = specialistName;
		BirthDate = birthDate;
		MobileNumber = mobileNumber;
		Gender = gender;
		Password = password;
	}




	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getQualification() {
		return Qualification;
	}

	public void setQualification(String qualification) {
		Qualification = qualification;
	}

	public String getSpecialistName() {
		return SpecialistName;
	}

	public void setSpecialistName(String specialistName) {
		SpecialistName = specialistName;
	}

	public String getBirthDate() {
		return BirthDate;
	}

	public void setBirthDate(String birthDate) {
		BirthDate = birthDate;
	}

	public String getMobileNumber() {
		return MobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}
	
	
}

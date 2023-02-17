package com.entity;

public class Patient {

	private int Id;
	private String FullName;
	private String MobileNumber;
	private String Address;
	private String Email;
	private String BirthDate;
	private String Gender;
	private String Password;

	public Patient(int id, String fullName, String mobileNumber, String address, String email, String birthDate,
			String gender, String password) {
		Id = id;
		FullName = fullName;
		MobileNumber = mobileNumber;
		Address = address;
		Email = email;
		BirthDate = birthDate;
		Gender = gender;
		Password = password;
	}

	public Patient(String fullName, String mobileNumber, String address, String email, String birthdate, String gender,
			String password) {

		FullName = fullName;
		MobileNumber = mobileNumber;
		Address = address;
		Email = email;
		BirthDate = birthdate;
		Gender = gender;
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

	public String getBirthDate() {
		return BirthDate;
	}

	public void setBirthDate(String birthdate) {
		BirthDate = birthdate;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

}

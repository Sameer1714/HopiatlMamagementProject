package com.entity;



public class Specialist {

	private int Id;
	private String SpecialistName;

	public Specialist(int id, String specialistName) {
		Id = id;
		SpecialistName = specialistName;
	}

	public Specialist(String specialistName) {
		SpecialistName = specialistName;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getSpecialistName() {
		return SpecialistName;
	}

	public void setSpecialistName(String specialistName) {
		SpecialistName = specialistName;
	}
	


}

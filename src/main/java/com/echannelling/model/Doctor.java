package com.echannelling.model;

public class Doctor extends Person {
	private int id;
	private String password;
	private String filename;
	private String specialization;
    private String contact;
	

	public String getSpecialization() {
		return specialization;
	}

	public String getContact() {
		return contact;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getId() {
		return id;
	}
	
	public String getPassword() {
		return password;
	}
	public String getFilename() {
		return filename;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

}

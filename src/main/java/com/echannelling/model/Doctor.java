package com.echannelling.model;

public class Doctor {
	private int id;
	private String name;
	private String email;
	private String password;
	private String filename;
	private String specialization;
	private String phone;
	private boolean licenseActive;
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
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
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public boolean isLicenseActive() {
		return licenseActive;
	}
	public void setLicenseActive(boolean licenseActive) {
		this.licenseActive = licenseActive;
	}
	

}

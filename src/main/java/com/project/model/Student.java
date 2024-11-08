package com.project.model;

public class Student {

	private int id;
	private String name;
	private String email;
	private long mobile;
	private String branch;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public Student(int id, String name, String email, long mobile, String branch) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.branch = branch;
	}
	public Student(String name, String email, long mobile, String branch) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.branch = branch;
	}
	public Student() {
		super();
	}

	@Override
	public String toString() {

		return id+ "  "+name+"  "+email+"  "+mobile+" "+branch;
	}
}

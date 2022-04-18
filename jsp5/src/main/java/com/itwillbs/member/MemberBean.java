package com.itwillbs.member;

import java.sql.Timestamp;

public class MemberBean {
	// 자바빈객체 -> 데이터가 저장되는 테이블정보를 참조
	// MemberDTO => Data Transfer Object : 데이터 전송 객체
	
	
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int age;
	private String email;
	private Timestamp reg_date;
	
	// alt shift s + r
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	//alt shift s + s
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", age=" + age
				+ ", email=" + email + ", reg_date=" + reg_date + "]";
	}
	

	
	
	
	
	

}

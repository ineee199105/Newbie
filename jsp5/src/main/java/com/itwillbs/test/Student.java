package com.itwillbs.test;

//class ATM{
//	private int money;
//
//	public int getMoney() {
//		return money;
//	}
//
//	public void setMoney(int money) {
//		this.money = money;
//	}
//}


public class Student {
//	public int a;
//	protected int b;
//		    int c;
//	private int d;	    
	
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	/* 클래스 안에 오버로딩된 생성자가 없을경우, 컴파일러가 자동으로 기본생성자를 생성
 	 * 
	 * public Student() {	}
	 * */
	
	// set/get() 
	// alt shift s + r
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	


}

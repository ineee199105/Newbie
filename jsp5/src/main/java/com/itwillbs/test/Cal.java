package com.itwillbs.test;

public class Cal {
	// 총점,평균
	public int sum(int k,int e,int m){
		return k+e+m;
	}
	public int sum(Student s){
		return s.getKor()+s.getEng()+s.getMath();
	}
	
	public void avg(int k,int e, int m){
		System.out.println("평균(Cal) : "+ sum(k, e, m) / 3.0);
	}
	public void avg(Student s){
		System.out.println("평균(Cal) : "+ sum(s) / 3.0);
	}
	
	
}

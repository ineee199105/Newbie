package com.itwillbs.test;

public class MainClass {
	
	
	// 총점 - 일반메서드(인스턴스)
	public void totalScore(int k,int e, int m){
		System.out.println("총점 : "+(k+e+m)+"점");
	}
	public void totalScore(Student s){
		System.out.println("총점(Student) : "+(s.getKor()+s.getEng()+s.getMath())+"점");
	}
	
	
	
	// 평균 - 스테틱 메서드
	public static void avgScore(int k,int e, int m){
		System.out.println("평균 : "+((double)(k+e+m)/3)+"점");
	}
	

	public static void main(String[] args) {
		
		String name = "홍길동";
		int kor = 60;
		int math = 87;
		int eng = 88;
		
		// 학생의 총점 / 평균 출력
		
		System.out.println(" 총점 : "+(kor+eng+math)+"점, 평균:"+((kor+eng+math)/3.0)+"점");
		
		System.out.println("---------------------------------------------");
		// 학생의 총점, 평균
		
		MainClass mc = new  MainClass();
		
		mc.totalScore(kor,eng,math);
		
		avgScore(kor, eng, math);
		
		// 총점 메서드 오버로딩을 사용하여 생성
		// 학생 정보를 저장하는 객체 -> 전달해서 출력
		Student s = new Student();
		s.setName("홍길동");
		s.setKor(77);
		s.setEng(88);
		s.setMath(99);
		
		mc.totalScore(s);
		
		// 계산기 객체 (총점(),평균())
		// Cal
		Cal c = new Cal();
		System.out.println( c.sum(s) );
		
		c.avg(s);
		
		
		
		

	}

}

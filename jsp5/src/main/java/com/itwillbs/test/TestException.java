package com.itwillbs.test;

public class TestException {

	public static void main(String[] args) {

		int a = 10;
		int b = 0;
		int c = 2;

		if (b != 0) {
			System.out.println(a / b);
		} else { // b == 0
			System.out.println(" 0으로 나누기 에러 발생! 나중에 수정해주세요! ");
		}

		System.out.println(a / c);

		System.out.println("--------------------------------------");
		
		System.out.println(" try 시작전 ");
		try{
			System.out.println(" try-1 ");
		    System.out.println(a / b);
		    System.out.println(" try-2 ");
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(" try 종료 ");
		

	}

}

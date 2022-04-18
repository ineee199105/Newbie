class Data { int x;}

public class Ex6_6 {
							//인수(argument,원본)
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Data d = new Data();
		d.x = 10; //클래스를 참조(references)/ 가리킨다(indicate)
		System.out.println("main() : x = " + d.x);
											// parameter
		change(d.x); //메소드의 호출 : 메소드명(매개변수,복사본);
		System.out.println("After change(d.x)");
		System.out.println("main() : x = " + d.x);
	}

	static void change(int x) { //기본형 매개변수
		x = 1000;
		System.out.println("change() : x = " + x);
	}
}

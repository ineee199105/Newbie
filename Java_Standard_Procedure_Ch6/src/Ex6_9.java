class MyMath2 { //사용자정의 타입
	long a, b;
	
	long add() { return a + b;}
	long subtract() { return a - b;}
	long multiply() { return a * b;}
	double divide() { return a / b;}
	
	static long add(long a, long b) { return a + b;}
	static long subtract(long a, long b) { return a - b;}
	static long multiply(long a, long b) { return a * b;}
	static double divide(long a, long b) { return a / (double) b;}
	}

public class Ex6_9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(MyMath2.add(200L, 100L));
		System.out.println(MyMath2.subtract(200L, 100L));
		System.out.println(MyMath2.multiply(200L, 100L));
		System.out.println(MyMath2.divide(200L, 100L));
		//만약 static 부분을 주석처리 해버리면 이 구문들을 사용하지 못함. => 확인
		//why) 클래스메소드는 클래스변수와 마찬가지로 출력 타입 앞에 static을 붙여서 메소드를 '인스턴스화'(instantiation)함.
		//이후 클래스메소드는 클래스변수와 같은 성질을 공유함
		//반면에, 인스턴스 변수를 사용하는 인스턴스 메소드는 객체를 생성해야 사용 할 수 있음
		//변수들이 언제 '생성' 되는지 이해 해야함.
		MyMath2 mm = new MyMath2(); // mm은 매개변수 MyMath2객체를 가리킨다(indicate) 또는 참조한다(reference)
		mm.a = 200L;
		mm.b = 100L;
		//객체를 생성하고, 객체 안의 멤버변수 안에 200L 과 100L을 저장 함
		System.out.println(mm.add());
		System.out.println(mm.subtract());
		System.out.println(mm.multiply());
		System.out.println(mm.divide());
		
	}

}

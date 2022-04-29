
public class Ex6_10 {
	Ex6_10() {} //생성자는 인스턴스 초기화 메서드, iv의 초기화 메서드
	public static void main(String[] args) { //main 도 메서드다
		// TODO Auto-generated method stub
		
		MyMath3 mm = new MyMath3();
		
		System.out.println("mm.add(3, 3) 결과:" + mm.add(3, 3));
		System.out.println("mm.add(3L, 3) 결과:" + mm.add(3L, 3));
		System.out.println("mm.add(3, 3L) 결과:" + mm.add(3, 3L));
		System.out.println("mm.add(3L, 3L) 결과:" + mm.add(3L, 3L));
		
		int[] a = {100, 200, 300};
		System.out.println("mm.add(a) 결과:" + mm.add(a));
	}

}

class MyMath3 {
	int add(int a, int b) {
		System.out.print("int add(int a, int b) - ");
		return a+b;
	}
	long add(long a, int b) {
		System.out.print("int add(long a, int b) - ");
		return a+b;
	}
	long add(int a, long b) {
		System.out.print("int add(int a, long b) - ");
		return a+b;
	}
	long add(long a, long b) {
		System.out.print("int add(long a, long b) - ");
		return a+b;
	}
	int add(int[] a) {
		System.out.print("int add(int[] a) - ");
		int result = 0; //지역변수의 초기화는 필수이다.
						//반면, 멤버변수(클래스 변수와 인스턴스 변수)와 배열의 초기화는 선택이다.
		for(int i=0; i< a.length; i++) {
			result += a[i];
		}
		return result;
	}
}
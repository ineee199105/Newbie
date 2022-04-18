//호출스택의 이해 그림을 한번 그려볼것
public class Ex6_5 {
					//1. main 메소드는 프로그램 실행 시 OS에 의해 자동으로 실행 된다.(공간확보1)
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello.");
		//2. println 메소드를 호출, main 메소드는 println이 수행 되는 동안 대기
	}

}//3. main 메소드가 실행 할 코드가 더 이상 없으므로, 호출스택은 완전히 비워지게 된다.

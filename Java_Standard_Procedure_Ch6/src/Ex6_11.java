//생성자(constructor) : 인스턴스가 생성될 때 호출되는 '인스턴스 초기화 메서드'
// 1. 생성자의 이름은 클래스의 이름과 같아야 함.
// 2. 생성자는 리턴 값이 없다.


class Data_1 {
	int value; //변수만 선언 되어있음
	// 어? 생성자가 없는데요? = 생성자가 하나도 없어서 컴파일러가 기본 생성자를 추가해준것
	Data_1(){} // 기본생성자를 넣어주는 습관을 들이자.
} 

class Data_2 {
	int value; //변수 선언
	
	Data_2(int x){ //매개 변수가 있는 생성자 
		//클래스 이름과 같고, 리턴이 존재 하지 않는 메서드 = 생성자
		value = x; //Data_2(int x)가 정의 되어있어, 컴파일러가 기본 생성자를 추가 해주지 않음
	}
	
	Data_2(){}//그래서 기본 생성자를 만들어 줌
}
public class Ex6_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Data_1 d1 = new Data_1();
		Data_2 d2 = new Data_2(); //compile error 발생
	}//

}

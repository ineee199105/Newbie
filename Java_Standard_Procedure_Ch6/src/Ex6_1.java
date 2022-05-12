//class 는 소스파일 하나당 하나만 권장됨. 학습을 위해 부득이하게 하나 더 만든것
class Ex6_1 { // public 이 없기 때문에 소스파일의 명을 Tv.java로 해도 오류는 발생하지 않음
				// 하지만, main method 가 포함되어있는 클래스는 Ex6_1이기 때문에
				// 컴파일은 되지만 실행은 안됨 요주의 실수사항

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Tv t;
		t = new Tv();
		t.channel = 7; // 인스턴스변수 사용법 : 참조변수.멤버변수
		t.channelDown();
		System.out.println("현재 채널은 " + t.channel + " 입니다.");

	}

}

class Tv {
	Tv() {}// 기본생성자

	Tv(boolean power) {
		this("black", power, 17);
	} // 검은색 tv, 채널17번 고정 => 끄고 키는 기능만 있는거

	Tv(String color, boolean power, int channel) {
		// 매개변수를 사용한 생성자
		// 따로 초기화 지정 안해줬으니까 모두 기본값으로?
	}

	// Tv의 속성(멤버변수)
	String color;
	boolean power;
	int channel;

	// Tv의 기능(메서드)
	void power() {
		power = !power;
	}

	void channelUp() {
		++channel;
	}

	void channelDown() {
		--channel;
	}

}
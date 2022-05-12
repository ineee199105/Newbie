package indigo;

class Tv {
	// Tv의 속성(멤버변수)
	String color;	//색상
	boolean power;	//전원상태(on/off)
	int channel;	//채널
	
	// Tv의 기능(메서드)
	void power() { power = !power; }
	void channelUp() { channel++; }
	void channelDown() { channel--; }
}

public class TvTest {

	public static void main(String[] args) {
		Tv t; // TV인스턴스를 참조하기 위한 변수 t(참조변수)를 선언
		t = new Tv(); // Tv인스턴스를 생성한다
		
	}

}

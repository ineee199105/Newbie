class Tv {
	boolean power; //��������(on/off)
	int channel;// ä��
	
	void power() {	power = !power;	}
	void channelUP() {	++channel;	}
	void channelDown() {	--channel;	}
}

class SmartTv extends Tv { // SmartTv�� Tv�� ĸ��(�ڸ�)�� �����ִ� ����� �߰�
	boolean caption; // ĸ�ǻ���(on/off)
	void displayCaption(String text) {
		if (caption) {	//ĸ�ǻ��°� on �� ���� text�� ���� �ش�.
			System.out.println(text);
		}
	}
}

public class Ex7_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SmartTv stv = new SmartTv();
		stv.channel = 10;
		stv.channelUP();
		System.out.println(stv.channel);
		stv.displayCaption("Hello, World");
		stv.caption = true;
		stv.displayCaption("Hello, World");
	}

}

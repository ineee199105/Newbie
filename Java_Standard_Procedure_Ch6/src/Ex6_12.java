class Car{
	String color;
	String gearType;
	int door; //인스턴스 변수의 선언
	
	Car() {} // 매개변수가 없는 생성자(기본생성자)
	
	Car(String c, String g, int d){ //매겨변수가 있는 생성자
		color = c;
		gearType = g;
		door = d;
	}
}
public class Ex6_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car c1 = new Car();
		c1.color = "white";
		c1.gearType = "auto";
		c1.door = 4;
		
		Car c2 = new Car("white", "auto", 4);

		System.out.println("c1의 color=" + c1.color + ", gearType="
							+ c1.gearType + ", door=" + c1.door);
		System.out.println("c2의 color=" + c2.color + ", gearType="
							+ c2.gearType + ", door=" + c2.door);
	}

}

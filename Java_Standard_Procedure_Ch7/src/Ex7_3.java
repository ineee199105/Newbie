
public class Ex7_3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Child2 c = new Child2();
		c.method();
	}

}

class Parent2 { int x = 10;}

class Child2 extends Parent2 {
	void method() {
		System.out.println("x=" + x); //10
		System.out.println("this.x=" + this.x); //10
		System.out.println("super.x=" + super.x); // 10
	}
}
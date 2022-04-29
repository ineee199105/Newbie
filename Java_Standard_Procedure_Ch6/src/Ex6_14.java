class Ex6_14 {
	static {
		System.out.println("static { }");
	}
	
	{
		System.out.println("{ }");
	}
	
	public Ex6_14() {
		System.out.println("생성자");
	}
	
	public static void main(String[] args) {
	System.out.println("Ex6_14 bt = new Ex6_14(); ");
	Ex6_14 bt = new Ex6_14(); // 최초 인스턴스 생성
	
	System.out.println("Ex6_14 bt2 = new Ex6_14(); ");
	Ex6_14 bt2 = new Ex6_14(); // 클래스 초기화는 메모리 로드시 단 한번만,
	}						   // 인스턴스 초기화는 인스턴스가 생성 될 때 마다 한번씩.
}

		// 1. 클래스변수(cv) 초기화
		// 2. 인스턴스변수(iv) 초기화
		// 3. 자동초기화
		// 4. 명시적초기화
		// 5. 초기화블럭, 생성자


class Ex6_15 {
	static int[] arr = new int[10]; //배열 생성, 명시적 초기화
	
	static { //클래스 초기화 블럭 
		for(int i=0; i<arr.length ; i++) {
			arr[i] = (int)(Math.random()*10) + 1;
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i=0; i<arr.length; i++) {
			System.out.println("arr[" + i + "] :" + arr[i]);
		}
	}

}

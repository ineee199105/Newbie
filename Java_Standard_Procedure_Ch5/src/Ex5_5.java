public class Ex5_5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] ball = new int[45];
		
		for(int i = 0; i < ball.length; i++) {
			ball[i] = i + 1; // ball[0]에 1이 저장된다.(1~45)
		} /*{6~10} 배열 생성*/
		
		int tmp = 0; // 두 값을 바꾸는데 사용할 임시변수
		int j = 0; // 임의의 값을 얻어서 저장할 변수
		
		//배열의 i번째 요소와 임의의 요소에 저장된 값을 서로 바꿔서 값을 섞는다.
		//0번째 부터 5번째 요소까지 모두 6개만 바꾼다.
		
		for(int i =0; i < 6/*ball.length*/; i++) {
			/*tmp = (int)(Math.random()*45);*/
			j = (int)(Math.random()*45); // 0~44
			tmp = ball[i];
			ball[i] = ball[j];
			ball[j] = tmp;
		} /*{18~23} ball[]의 1부터 45까지의 숫자를 섞음*/
		// ball[] 안의 요소는 for에 의해서 [0]~[5]까지만 섞이게 됨.
		// ball[j]와 j= (int)Math.random()*45 에 의해서 0 <= ball[j] <44 == {0,1,2,3 ... 42,43,45}
		
		for(int i=0; i < 6; i++)
			System.out.printf("ball[%d]=%d%n", i, ball[i]);
	}

}
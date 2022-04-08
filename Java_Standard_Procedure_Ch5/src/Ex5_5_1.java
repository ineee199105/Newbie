public class Ex5_5_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] ball = new int[45];
		
		for(int i=0; i < ball.length; i++) {
			ball[i] = i+1;
		}
		
		int tmp = 0;
		int j = 0;
		
		for(int i=0; i < 6; i++) {
			j = (int)(Math.random()*45);
			
			tmp = ball[i];
			ball[i] = ball[j];
			ball[j] = tmp;
			
		}
		
		int[] arr = new int[6];
		
		for(int i=0; i < 6; i++) {
			arr[i] = ball[i];
		}
		
		for(int k=1; k < 7; k++ ) {
		 System.out.printf("ball[%d]=", k);
		}
		
		for(int result : arr) {
		 System.out.printf("%5d%n", result);
		} 
		
		
		//향상된 for문은 배열의 출력만 가능함 그리고 배열을 모두 출력함.
		//원래 for문은 0~44 요소의 값에서 카드를 섞은 다음 맨 위 6장을 뽑는것과 같은 효과를 냄.
		//향상된 for문은 45개 요소를 모두 출력해버림
		//그래서 {24~28열}에 있는것처럼 6개 섞은 카드만 따로 뽑아서 배열을 만들고 그걸 향상된 for문으로 출력함.
		//why1) String substring(int from, int to)를 써보려고 했는데 문자열이 아니라서 그런지 invoke 할 수 없다고 나옴
		// int배열도 이런식으로 원하는 구획만 추출이 가능한 메소드가 존재하는지?
		// 위의 상황을 예로들면 번거롭게 6개짜리 배열 다시 만들거 없이 걍 ball[] 에서 0~5번 인덱스만 뽑아오면 될 문제였음
		//why2) 지금 이 코딩은 Ex5_1 과는 다르게 인덱스 값만 추출해서 console상에 숫자만 나열함
		// 그러다보니 결과값이 숫자만 나오는데 Ex5_1는 ball[0]=x1 ball[0]=x2 ... 처럼 표현되고 있음
		// 중복for문이나 while문을 이용해서
		// ball[0] = arr[0]
		// ball[1] = arr[1]
		//        ...
		// ball[5] = arr[5] 이렇게 표현하고 싶은데 향상된 for문으로는 이걸 어케해야할지 몰?루겠음
	}
		
}
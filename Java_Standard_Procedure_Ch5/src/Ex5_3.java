class Ex5_3 {
	public static void main(String[] args) {
		int[] score = { 79, 88, 91, 33, 100, 55, 95};
		
		int max = score[0]; //배열의 첫번째 값으로 최대값(max 변수)을 초기화 한다.
		int min = score[0]; //배열의 첫번째 값으로 최소값(min 변수)을 초기화 한다.
		
		for(int i=1; i < score.length; i++) { //배열의 2번째 요소부터 읽기위해 i를 1로 초기화
			if(score[i] > max) {
				max = score[i];
			} else if(score[i] < min) {
				min = score[i];
			} 
		}//for문의 끝
		
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
	}

}
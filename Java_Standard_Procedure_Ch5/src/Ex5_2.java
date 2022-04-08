public class Ex5_2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	int sum = 0; //총합을 저장하기 위한 변수
	float average = 0f; //평균을 저장하기 위한 변수
	
	int[] score = {100, 88, 100, 100, 90};
	
	for(int i=0; i < score.length; i++) {
		sum += score[i];
	} // sum += score[i] -> sum = sum + score[i]
	
	average = sum / (float)score.length ; // sum이 이미 int로 타입이 정해졌으니까 분모를 float으로 놓아야 함
	
	System.out.println("총합 : " + sum);
	System.out.println("평균 : " + average);
  }

}
package com.lec.ex;

public class Ex02_1 {
	// sum() method
	private static int sum(int from, int to) { // sum함수 1은from으로 10은to로 들어가
		int result = 0; // 누적할변수

		for (int i = from; i <= to; i++) {
			result = result + i; // result +=i
		} // 55를 나를 호출한곳으로 return반환한다
		return result;
	} // 변동이 생겼을때 여기만 바꾸면되. 밑에 변동안해도됨 !!

	private static String evenOdd(int value) {
		String result = value % 2 == 0 ? "짝수입니다" : "홀수입니다";
		return result; // main만 실행. 이거는 '메모리에 저장만됨'!!
	}

	public static void main(String[] args) { // main함수가 55로 변함
		int sum = sum(1, 10); // 누적변수
		System.out.println("합은 " + sum);
		System.out.println(evenOdd(sum));

		sum = sum(1, 100);
		System.out.println("합은 " + sum);
		System.out.println(evenOdd(sum));

		sum = sum(10, 51);
		System.out.println("합은 " + sum);
		System.out.println(evenOdd(sum));
	}

}

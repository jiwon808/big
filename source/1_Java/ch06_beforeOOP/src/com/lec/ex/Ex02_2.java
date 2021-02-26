package com.lec.ex;

public class Ex02_2 {
	private static int sum(int to) { // private실행되지않는다(그 파일 안에서 만 실행, 다른 파일에서는 실행되지 않음), publics는 실행된다
		int result = 0;
		for (int i = 1; i <= to; i++) {
			result = result + i; // result +=i
		}
		return result;
	}

	private static int sum(int from, int to) {
		int result = 0;
		for (int i = from; i <= to; i++) {
			result = result + i; // result +=i
		} // 55를 나를 호출한곳으로 return반환한다
		return result;
	} // 변동이 생겼을때 여기만 바꾸면된다. 밑에 변동안해도됨 


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

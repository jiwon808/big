package com.lec.ex;

public class Arithmetic {
	public int sum(int to) {
		int result = 0;
		for (int i = 1; i <= to; i++) {
			result = result + i; // result +=i
		}
		return result;
	}

	public int sum(int from, int to) {
		int result = 0;
		for (int i = from; i <= to; i++) {
			result = result + i; // result +=i
		} // 55를 나를 호출한곳으로 return반환한다
		return result;
	} // 변동이 생겼을때 여기만 바꾸면되. 밑에 변동안해도됨 !!

	public String evenOdd(int value) {
		String result = value % 2 == 0 ? "짝수입니다" : "홀수입니다";
		return result; // main만 실행. 이거는 '메모리에 저장만됨'
	}

	public static int abs(int value) {
		int result = (value >= 0) ? value : -value;

//		if(value>=0) {
//			result = value;
//		}else {
//			result = -value;
//		}
		return result;
	}

}

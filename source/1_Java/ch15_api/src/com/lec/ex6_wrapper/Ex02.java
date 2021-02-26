package com.lec.ex6_wrapper;

//가변인자함수 cf.인자 == 매개변수 
public class Ex02 {
	public static void main(String[] args) {
		int total = valueSum("10", "20", "30", "40");
		System.out.println("들어온 값의 합계는" + total);
	}

	private static int valueSum(String... value) { // !!중요
		int result = 0; // 누적변수
		for (int i = 0; i < value.length; i++) {
			result += Integer.parseInt(value[i]); // !! Integer.parseInt() -->String을 integer로 바꿔줌
		}
		return result;
	}
	// 바로호출하려면 static
}

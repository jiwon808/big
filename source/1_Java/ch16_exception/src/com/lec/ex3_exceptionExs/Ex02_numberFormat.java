package com.lec.ex3_exceptionExs;

public class Ex02_numberFormat {
	public static void main(String[] args) {
		String str = "10000 "; // 10000 space
		int i = 0; // 2. i초기화
		try {
			int j = Integer.parseInt(str.trim()); // 양옆 제거 아니면 NumberFormatException발생
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
		} // 1. 이 블록에 빠져나가면 i 변수 없어져. 따라서 i 변수를 위에더 손온
		System.out.println(i); // 3.그래야 i에 숫자가 들어와서 에러가 발생하지 않음
	}
}
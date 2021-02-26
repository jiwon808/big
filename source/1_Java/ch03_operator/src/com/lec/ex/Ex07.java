package com.lec.ex;

// 비트 연산자 : &, |
public class Ex07 {
	public static void main(String[] args) {
		int n1 = 10; // 0 ~ 0 1 0 1 0 (이진법으로 10이 저장되는 방식)
		int n2 = 5; // 0 ~ 0 0 1 0 1
		int result = n1 & n2; // 0 ~ 0 0 0 0 0 (0을 false, 1을 true로 하여 비트별로 계산)
		System.out.printf("%d %c %d = %d\n", n1, '&', n2, result);
		result = n1 | n2; // 0 ~ 0 1 1 1 1 (15)
		System.out.printf("%d %c %d = %d\n", n1, '|', n2, result);
	}

}

package com.lec.ex;

// 산술연산자 (+,-,*,/,% 나머지연산)
public class Ex01 {
	public static void main(String[] args) {
		int n1 = 33, n2 = 10; // (4byte값끼리 계산하면 4byte로 결과가 나온다.)
		int result;
		double resultDouble; // 카멜표기법(대문자로 문자구분)
		result = n1 + n2;
		System.out.printf("%d %c %d =%d\n", n1, '+', n2, result);
		result = n1 - n2;
		System.out.printf("%d %c %d =%d\n", n1, '-', n2, result);
		result = n1 * n2;
		System.out.printf("%d %c %d =%d\n", n1, '*', n2, result);
		result = n1 / n2;
		System.out.printf("%d %c %d =%d\n", n1, '/', n2, result); // 원래 값은 3.3이나, 4byte로 변환되어 3으로 출력됨
		resultDouble = (double) n1 / n2; // 4byte였던 n1의 값이 바뀌어 8 byte인 33.0으로 변환 - byte가 서로 다르면 큰 쪽을 따라간다)
		System.out.printf("%d %c %d =%.1f\n", n1, '/', n2, resultDouble);
		result = n1 % n2;
		System.out.printf("%d %c %d =%d\n", n1, '%', n2, result);
		// 나머지 연산자의 쓰임새
		if (n1 % 2 == 0)
			System.out.println("짝수");
		else
			System.out.println("홀수");
	} // main

} // class

package com.lec.question;

import java.util.Scanner;

// (연습문제 5) 국어, 영어, 수학 점수를 변수에 할당하고 각 점수를 출력하고 총점, 평균(소수점2자리까지) 출력하는 프로그램을 구현 하시오
public class Q5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("국어점수는?");
		int kor = scanner.nextInt();
		System.out.print("영어점수는?");
		int eng = scanner.nextInt();
		System.out.print("수학점수는?");
		int math = scanner.nextInt();

	}
}

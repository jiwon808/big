package com.lec.ex1_tryCatch;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int i, j = 1;
		do {
			try {
				System.out.println("첫번째 수는?");
				i = scanner.nextInt(); // @\n
				break;
			} catch (InputMismatchException e) {
				System.out.println(e.getMessage());
				System.out.println("첫번째 수에 문자를 넣지마세요");
				scanner.nextLine(); // 버퍼를 지우는 목적 \n를 지움 안지우면 \n이 남아 있어서 계속 new line 메세지 첫번째 수에 문자를 넣지마세요이 반복됨
			}
		} while (true);
		System.out.println("두번째 수는?");
		try {
			j = scanner.nextInt();
			System.out.println("i = " + i + ", j=" + j);
			System.out.println("i * j = " + (i * j));
			System.out.println("i / j = " + (i / j));
		} catch (ArithmeticException e) { // ArithmeticException이면 여기로
			System.out.println(e.getMessage() + "0으로 못 나누는 것은 패스");
		} catch (InputMismatchException e) { // InputMismatchException이면 여기로
			System.out.println(e.getMessage()); // 잘못된 내용 출력
			System.out.println("두번째 수를 잘못 입력하셔서 1로 초기화 함");
		} catch (Exception e) {
			System.out.println(e.getMessage() + "무슨 에러일까?");
		}
		System.out.println("i + j = " + (i + j));
		System.out.println("i - j = " + (i - j));
		System.out.println("DONE");
		scanner.close();
	}

} // 예외처리는 최소한 부부을 잡는게 좋다. 범위를 너무 넓게 잡으면 무의미
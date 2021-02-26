package com.lec.ex;

public class VarEx02_04 {
	public static void main(String[] args) {
		// 변수선언 방법
		// 1. 자료형 변수명;
		int num1 = 9; // 선언만 하고 값 할당은 안 함
		System.out.println("num1=" + num1);
		// 2. 자료형 변수명 = 값;
		char c1 = '씨';
		System.out.println("c1=" + c1);
		// 3.자료형 변수1명, 변수2명,...변수명n;
		boolean b1, b2, b3;
		b1 = true;
		b2 = false;
		b3 = true;
		System.out.print("b1=" + b1 + "\t b2=" + b2 + "\t b3=" + b3 + "\n"); // \n은 new line
		// 4.자료형 변수명1=값1, 변수명2=값, ...변수명n=값n;
		long l1 = 2200000000L; // L을 붙여야 int로 인식안하고 long으로 인식
		float f1 = 1.19f, f2 = 2.22f, f3; // f붙이면 float로 인식됨
		System.out.println("f1=" + f1 + "\t f2=" + f2);
		System.out.printf("f1 = %3.1f, f2=%4.1f\n", f1, f2); // 전체3자리(점,space도 포함) 출력하고 1자리 소수점
																// f1=f 출력에 0이많은이유 메모리에 실수를 그렇게 저장
																// %f:실수, %d정수, %c문자, %s문자열, %x-16진수
		System.out.println("프로그램 끝"); // println 개행되고 print는 개행 안됨
	}// 프로그램 끝
}// class끝

package com.lec.ex;

import java.util.Scanner;

public class Ex03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); // new메모리에 할당한 아이
		int su = -5;
		System.out.println(su + "의 절대값은" + Arithmetic.abs(su));

		Arithmetic ar = new Arithmetic(); // Arithmetic형 객체 (ar.sum을 쓸수있다)
		int sum = ar.sum(10, 50);
		System.out.println("합은" + sum);
		System.out.println(ar.evenOdd(sum));
		System.out.println("**************");
		sum = ar.sum(50);
		System.out.println("합은" + sum);
		System.out.println(ar.evenOdd(sum));
	}
}

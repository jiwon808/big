package com.lec.question;

// (연습문제2) 입력한 수가 짝수인지 홀수인지 출력 
import java.util.Scanner;

public class Q2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("숫자를 입력하세요");
		int i = sc.nextInt();
		System.out.println(i % 2 == 0 ? "짝수" : "홀수");
	}

}

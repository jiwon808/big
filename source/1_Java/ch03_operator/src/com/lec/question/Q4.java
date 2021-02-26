package com.lec.question;

// (연습문제4)나이를 입력받아 입력받은 나이가 65세 이상일 때, “경로우대” 출력, 아니면 “일반”출력
import java.util.Scanner;

public class Q4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("나이를 입력하세요");
		int age = sc.nextInt();
		System.out.println(age >= 65 ? "경로우대" : "일반");
	}
}

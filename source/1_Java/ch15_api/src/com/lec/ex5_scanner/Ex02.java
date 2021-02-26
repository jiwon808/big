package com.lec.ex5_scanner;

import java.util.Scanner;

//cf. next() --> nextLine()로 버퍼 지우기 --> nextLine()이용
//nextLine()이용 --> next()이용
public class Ex02 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("주소를 입력하세요");
		String address = scanner.nextLine(); // 버퍼가 깨끗할까 생각하고 써 .버퍼의 상태를 고려 . \n을지우는역할
		System.out.println("입력하신 주소는" + address);
		System.out.println("이름을 입력하세요");
		String name = scanner.nextLine(); // 이름안에 space가 포함되었을때 nextLine
		System.out.println("입력하신 이름은 " + name);
		System.out.println("나이를 입력하세요");
		int age = scanner.nextInt();
		System.out.println("입력하신 나이는" + age);
	}
}

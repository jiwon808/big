package com.lec.ex5_scanner;

import java.util.Scanner;

public class Ex01 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("나이를 입력하세요:");
		int age = scanner.nextInt(); // 화면에 30 치면 키보드버퍼(화면)에 30 \n 이 들어옴
		System.out.println("입력하신 나이는 " + age);
		System.out.println("이름을 입력하세요: ");
		String name = scanner.next(); // \n홍길동\n hong gildong 치면 hong만들어가
		System.out.println("입력하신 이름은" + name);
		System.out.println("주소를 입력하세요"); // 버퍼에 처음 나오는 \n는 무시하고 white space앞까지 튀급 enter치면 \n됨
		scanner.nextLine(); // 버퍼지우기 (\n때문에) 이 시점에 뭐가 남아 있는지 항상 생각
		String address = scanner.nextLine();// 버퍼에 \n이 나오는 앞까지 출력
		System.out.println("입력하신 주소는" + address);
		System.out.println("====프로그램 끝 ====");
	}
}
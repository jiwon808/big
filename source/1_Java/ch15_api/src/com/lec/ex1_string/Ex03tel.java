package com.lec.ex1_string;

import java.util.Scanner;

//com.lec.ex1_string.Ex03quiz->Ex03quiz

//번호(031-234-5678)입력 하면 (sc.next()) 
//"입력한 전화번호: 031-234-5678
//짝수번째 문자열: 0 1 2 6 5 7
//문자를 꺼꾸로: 8765-432-130
//전화번호 맨앞자리는:031
//전화번호 뒷자리는: 5678"을 sysout
//x를 입력하면 프로그램 끝

public class Ex03tel {
	public static void main(String[] args) {
		Ex03tel ex = new Ex03tel();
		String fullName = ex.getClass().getName();
		String className = fullName.substring(fullName.lastIndexOf(".") + 1);
		System.out.println(className);

		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("전화번호를 입력하십시오:");
			String tel = sc.next();
			if (tel.equalsIgnoreCase("x"))
				break;
			System.out.println("입력한 전화번호 : " + tel);
			System.out.print("짝수번째 문자열 : ");
			for (int i = 0; i < tel.length(); i++) {
				if (i % 2 == 0) {
					System.out.print(tel.charAt(i));
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
			System.out.print("문자를 꺼꾸로 : ");
			for (int i = tel.length() - 1; i >= 0; i--) {
				System.out.print(tel.charAt(i));
			}
			System.out.println();
			String pre = tel.substring(0, tel.indexOf("-"));
			String post = tel.substring(tel.lastIndexOf("-") + 1);
			System.out.println("전번 앞자리 : " + pre);
			System.out.println("전번 뒷자리 : " + post);
		}
	}
}
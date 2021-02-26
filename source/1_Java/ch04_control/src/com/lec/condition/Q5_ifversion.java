package com.lec.condition;

import java.util.Scanner;

// 현재 몇 월인지를 키보드로부터 입력받아 계절을 출력하는 프로그램을 구현하세요
public class Q5_ifversion {	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("현재의 월을 입력하세요");
		int month = scanner.nextInt();
		if(month ==12 || month==1 || month==2) {
			System.out.println("입력하신 개월은 겨울입니다.");
		}else if(month ==3 || month ==4 || month ==5) {
			System.out.println("입력하신 개월은 봄입니다.");
		}else if(month ==6 || month ==7 || month ==8) {
			System.out.println("입력하신 개월은 여름니다.");
		}else {
			System.out.println("입력하신 개월은 가을입니다.");
		}
	}
}

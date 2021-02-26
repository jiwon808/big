package com.lec.condition;

import java.util.Scanner;

public class Q5_switchVersion {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("현재 개월을 입력하세요");
		int month = scanner.nextInt();
		switch(month) {
		case 12: case 1: case 2:
			System.out.println("입력하신 개월은 겨울입니다"); break;
		case 3: case 4: case 5:
			System.out.println("입력하신 개월은 봄입니다"); break;
		case 6: case 7: case 8:
			System.out.println("입력하신 개월은 여름입니다"); break;
		case 9: case 10: case 11:
			System.out.println("입력하신 개월은 가을입니다"); break;
		default:
			System.out.println("떼끼");
		}
	}
}

package com.lec.loop;

import java.util.Scanner;

// 사용자로부터 원하는 구구단수를 입력받아 해당 구구단을 출력해 보자
public class Q3_for {
	public static void main(String[] args) {
		Scanner scanner = new Scanner (System.in);
		System.out.print("몇단 원해");
		int dansu = scanner.nextInt();
		for (int i=1; i<10; i++) {
			System.out.printf("%d*%d= %2d\n", dansu,i,dansu*i);
			System.out.println(dansu + "*" + i +"="+(dansu*i));
		}
		scanner.close();
	}
}

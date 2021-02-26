package com.lec.condition;

import java.util.Scanner;

// 사용자로부터 가위 (0), 바위(1), 보(2) 중 하나를 입력받고,
// 컴퓨터도 가위(0), 바위(1), 보(2) 중 하나를 선택해서 승자를 출력
public class Q3_if {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("가위(0), 바위(1), 보(2) 중 하나를 선택: ");
		int you = scanner.nextInt();
		if(you==0) {
			System.out.println("가위를 내셨네");
		}else if(you==1) {
			System.out.println("바위를 내셨네");
		}else if(you==2) {
			System.out.println("보를 내셨네");
		}else {
			System.out.println("떼끼");
			System.exit(0); // 강제종료(?)
		}
		scanner.close();
		int computer = (int)(Math.random()*3);
		if(computer==0) {
			System.out.println("컴은 가위야");
		}else if(computer==1) {
			System.out.println("컴은 바위야");
		}else {
			System.out.println("컴은 보야");
		}
		if((you+2)%3 == computer) {
			System.out.println("당신이 이겼다");
		}else if(you==computer) {
			System.out.println("비겼다");
		}else {
			System.out.println("컴퓨터가 이겼다");
		}
	}
}
		
//		if(you==0) {
//			if(computer=0) {
//				System.out.println("비겼다");
//			}else if(computer=1) {
//				System.out.println("컴퓨터가 승");
//			}else {
//				System.out.println("당신이 승");
//			}
//		}if(you==1) {
//			if(computer=0) {
//					System.out.println("비겼다");
//			}else if(computer=1) {
//					System.out.println("컴퓨터가 승");
//			}else {
//					System.out.println("당신이 승");
//			}
//		if(you==0) {
//			if(computer=0) {
//				System.out.println("비겼다");
//			}else if(computer=1) {
//				System.out.println("컴퓨터가 승");
//			}else {
//				System.out.println("당신이 승");
//			}
//	}
//}

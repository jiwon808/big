package com.lec.ex1_string;
// I:checkIn("빈납되었습니다"출력),O:checkout("대출되었습니다"출력)

//x:종료
// 필요한class,variable생각 while문,

import java.util.Scanner;

public class Ex04Quiz {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in); // 매개변수 있는 생성자 만들었다
		String fn;
		while (true) {
			System.out.println("I:checkIn, O:checkOut, x:Exit?");
			fn = scanner.next();
			if (fn.equalsIgnoreCase("x")) {
				break;
			} else if (fn.equalsIgnoreCase("i")) {
				System.out.println("반납되었습니다");
			} else if (fn.equalsIgnoreCase("o")) {
				System.out.println("대출되었습니다");
			}
		}
//		do {
//			System.out.println("I:checkIn, O:checkOut, x:Exit?");
//			fn = scanner.next();
//			if(fn.equalsIgnoreCase("i")) {
//				System.out.println("반납되었습니다");
//			}else if (fn.equalsIgnoreCase("o")){
//				System.out.println("대출되었습니다");
//			}
//		}while(!fn.equalsIgnoreCase("x"));	
		System.out.println("DONE");
	}
}

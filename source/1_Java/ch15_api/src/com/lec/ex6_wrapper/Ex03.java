package com.lec.ex6_wrapper;

// String --> integer
// Integer --> string
public class Ex03 {
	public static void main(String[] args) {
		System.out.println("스트링을 정수: Integer.parseInt(문자열)");
		int i = Integer.parseInt("123");
		System.out.println(i);
		System.out.println("integer를 string으로:");
//		String monthString = ""+12;
		String monthString = String.valueOf(12); // integer --> string
		System.out.println(monthString);
	}
}

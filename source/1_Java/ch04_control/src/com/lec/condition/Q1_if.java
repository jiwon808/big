package com.lec.condition;

import java.util.Scanner;

public class Q1_if {
	public static void main(String[] args) {
		Scanner i = new Scanner(System.in);
		System.out.println("입력하실 수는? "+i);
		int num = i.nextInt();
		if(num>=0) {
			System.out.println("절대값은 "+num);
		}else {
			System.out.println("절대값은 "+(-num));
			System.out.println("절대값은 "+(-num));
		}
	}
}

package com.lec.condition;

public class Ex01_if {
	public static void main(String[] args) {
		int i=20, j=20, h=31;
		if(i+j == h) {
			System.out.println("i+j는 h입니다"); // else가 없을 경우 거짓이면 수행하지 않는다.
		}
		if(i>j ) {
			System.out.println("i>j입니다");
		}else {
			System.out.println("i>j가 아닙니다");
		}
	}
}

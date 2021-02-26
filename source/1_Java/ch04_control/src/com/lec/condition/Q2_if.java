package com.lec.condition;

public class Q2_if {
	public static void main(String[] args) {
		int num1 = 27;
		int num2 = 32;
		int max;
		if(num1>num2){ // 블럭{}안에서 변수를 선언하는 건 위험한 일? 블럭 안에서만 적용된다.
			max = num1;
		} else {
			max = num2;
		}
		System.out.println(max);
	}
}	



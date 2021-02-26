package com.lec.condition;

public class Ex04_switch {
	public static void main(String[] args) {
		int num = 2;
		switch(num) {
		case 1: 
			System.out.println("주사위1"); break;
		case 2: 
			System.out.println("주사위2"); break; // (break를 걸어야 해당 숫자가 나오면 아래까지 안가고 멈춘다)
		case 3:
			System.out.println("주사위3"); break;
		default:
			System.out.println("그 외"); break; // (대체로  switch가 if보다 가독성이 높은 편)
		}
	}
}

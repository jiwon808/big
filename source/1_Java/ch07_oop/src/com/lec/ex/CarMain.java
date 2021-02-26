package com.lec.ex;

import java.util.Scanner;

public class CarMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Car myPorsche = new Car(); // class는 새로운type을 하나 만드는것 . myPorsche 객체변수 Scanner, Car 주석을 가리키면 객체. 객체안에'data'
									// & 'method'로 나눠
		Car yourPorsche = new Car(); 

		myPorsche.drive();
		yourPorsche.drive();
		myPorsche.park();
		myPorsche.race();
		myPorsche.setColor = ("red"); // myPorsche.color = "red";
		System.out.println("내 포르쉐 색상: " + myPorsche.getColor());
		System.out.println("너 포르쉐 색상: " + yourPorsche.getColor()); // yourPorsche에 있는 getColor 호출
		System.out.println("내 포르쉐 배기량: " + myPorsche.getCc()); // 객체변수는 메로미에 잡히면, null /0로 청소
	}
}
package com.lec.ex02;

public class TestMain {
	public static void main(String[] args) {
		// 추상클래스 객체 못만들어. 추상메소드때문에 . 무조건override해야하기때문에
		// Super s = new Super(); 불가
		Child c1 = new Child();
		c1.method1();
		c1.method2();
		c1.method3(); // c1은child형 변수여서 가능
		Super c2 = new Child();
		c2.method1();
		c2.method2();
//		c2.method3(); 은 불가능. (c2변수가 Super타입이므로 Super의 것만 가능 /method3은child파일에서 불로언거.child extends Super이기때문)
	}
}

package com.lec.ex03;

public class TestMain {
	public static void main(String[] args) {
//		SuperClass supe = new Superclass();
//		ChildClass child = new ChildClass(); 다 추상 객체이기 때문에. 무조건 override해야하기 때문에
		SuperClass supe = new GrandChildClass(); // 변수는 의미있는 함수로 쓰면안되
		supe.method1();
		supe.method2();
//		supe.method3();
		ChildClass child = new GrandChildClass();
		child.method1();
		child.method2();
		child.method3();
		GrandChildClass grand = new GrandChildClass();
		grand.method1();
		grand.method2();
		grand.method3();
	}
}

package com.lec.ex03;

public abstract class ChildClass extends SuperClass {
	// SuperClass로부터 받은 추상 메소드 method1()
	@Override
	public void method2() {
		System.out.println("ChildClass의method2()");
	}

	public void method3() {
		System.out.println("ChildClass의method3()");
	}
}
//	public abstract void method1(); // 추상메소드
//	public void method2() {
//		System.out.println("Super의 method2()");
//	} 
//	override하던지 나를 추상class로 만들던지

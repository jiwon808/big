package com.lec.ex05_override;

public class ChildClass extends ParentClass { // extends질문
	public ChildClass() {
		System.out.println("C 매개변수 없는 생성자");
	}

	public ChildClass(int i) {
		System.out.println("C 매개변수 있는 생성자");
	}

	public void method1() { // 오버라이딩 (함수의 재정의)
		System.out.println("Child의 method1()");
	}

	public void method3() {
		System.out.println("Child의method3()");
	}
}

package com.lec.ex02;

public class Child extends Super {
	@Override
	public void method1() {
		System.out.println("Child의method1() - 추상메소드라 꼭 오버라이드");
	}

//method2는 해도되고 안해도되고.왜냐하면method2는 일반 메소드이기때문에. 반면method1은 추상적 메소드이기때문에 override무조건해야 
	public void method3() {
		System.out.println("Child의 method3");
	}

}

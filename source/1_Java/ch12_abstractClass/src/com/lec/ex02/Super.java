package com.lec.ex02;

//추상클래스는 한개이상의 추상메소드를 갖음 
//추상클래스 객체 못만들어. 추상메소드때문에 . 무조건override해야하기때문에 
//Super s = new Super(); 불가
//
public abstract class Super {
	public Super() {
	} // default 생성자

	public abstract void method1(); // 실체가없는 추상 메소드. 이름만 있는 아이 . 함수 선언만

	public void method2() {
		System.out.println("Super의method2()");
	}
}
package com.lec.ex05shape;

public abstract class Shape {// to provide a base for subclasses to extend and implement the abstract methods
								// and override or use the implemented methods in abstract class.
	public void draw() {
		System.out.println("도형을 그려요");
	}

	public abstract double computeArea(); // 추상메소드 ; 추상메소드 1개이상. 따라서 위 class Shape도 abstract추가해여야함. 아니면 compile
											// error(문법적 에러)생김
	// 넓이를 return 하는 메소드

}

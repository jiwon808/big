package com.lec.ex04shape;

public abstract class Shape {
	public void draw () {
		System.out.println("도형을 그려요");
	}
	public abstract void computeArea(); //추상메소드 ;  추상메소드 1개이상. 따라서 위 class Shape도  abstract추가해여야함. 아니면 compile error(문법적 에러)생김
	
}
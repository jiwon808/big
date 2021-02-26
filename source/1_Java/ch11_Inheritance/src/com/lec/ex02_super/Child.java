package com.lec.ex02_super;

public class Child extends Superij {
	private int total; // private도 다 상속 받는다

	public Child(int i, int j) {
		setI(i); // this.i=i;
		setJ(j);
	}

	public void sum() {
		// total에 i+j를 할당
		total = getI() + getJ(); // i,j는 private로되어있기에 get해서 가져와야함
		System.out.println("본 객체의 total:" + total);
	}
}
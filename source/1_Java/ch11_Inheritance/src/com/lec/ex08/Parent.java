package com.lec.ex08;

public class Parent {
	private int p = 0; // 왜 main no

	public Parent() {
		System.out.println("Parent형 객체 생성");
	}

	// getter & setter
	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}
}
//parent-grandhilc
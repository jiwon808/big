package com.lec.ex02_super;

public class Superij {
	private int i;
	private int j;

	public Superij() {
		System.out.println("매개변수 없는 거");
	}

	public Superij(int i, int j) {
		this.i = i;
		this.j = j;
		System.out.println("매개변수 있는 거");
	} // source-generate field

	// source- getter&setter
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public int getJ() {
		return j;
	}

	public void setJ(int j) {
		this.j = j;
	}

}

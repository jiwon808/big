package com.lec.ex05shape;

public class Circle extends Shape {
	private int r;

	public Circle() {
	}

	public Circle(int r) {
		this.r = r;
	}

	@Override
	public double computeArea() {
//		System.out.println("원의 넓이는"+(3.14*r*r));
		return 3.14 * r * r; // 매개변수와 return type 똑같이 맞춰. 따라서 double
	}

	@Override
	public void draw() {
		System.out.println("원");
		super.draw();
	}

	// getter&setter
	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

}

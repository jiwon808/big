package com.lec.ex05shape;

public class Triangle extends Shape {
	private int w;
	private int h;

	public Triangle() {
	}

	public Triangle(int w, int h) {
		this.w = w;
		this.h = h;
	}

	@Override
	public double computeArea() {
//		System.out.println("삼각형의 넓이는"+(w*h*0.5));
		return (w * h * 0.5);
	}

	@Override
	public void draw() {
		System.out.println("삼각형");
		super.draw();
	}
}

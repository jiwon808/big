package com.lec.ex4_Object;

public class RectangleMain {

	public static void main(String[] args) {
		Rectangle r1 = new Rectangle(0, 0, "black");
		Rectangle r2 = new Rectangle(5, 7, "red");
		Rectangle r3 = new Rectangle(5, 7, "red");
		System.out.println(r1);
		System.out.println(r2);
		if (r2.equals(r3)) {
			System.out.println("True");
		} else
			System.out.println("False");
		if (r1.equals(r3)) {
			System.out.println("True");
		} else
			System.out.println("False");

	}// main

}// class

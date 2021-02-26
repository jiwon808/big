package com.lec.squre;

public class SqureMain {
	public static void main(String[] args) {
		Squre s1 = new Squre(); // 주소가 들어간 공간이 들어갔을뿐
		Squre s2 = new Squre(10);
		System.out.println("s1의 한변의 길이는" + s1.getSide());
		System.out.println("s1의 넓이는" + s1.area());
		System.out.println("s2의 한변의 길이는" + s2.getSide());
		System.out.println("s2의 넓이는" + s2.area());
		s2.setSide(5);
		System.out.println("s2의 넓이는" + s2.area());
	}
}

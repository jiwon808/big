package com.lec.ex10;

public class TestMain {
	public static void main(String[] args) {
		Child cObj = new Child(10); // cObj 클래스형 변수
		System.out.println(cObj.getI());
	} // getI()는 메모리에서 Parent --> 그리고 메모리에서 Child
}
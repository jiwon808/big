package com.lec.ex01_parentchild;

public class TestMain {
	public static void main(String[] args) {
		ChildClass child = new ChildClass(); // new childclass를 보고 객체를 만들어
		child.getPapaName();
		child.getMamiName();
		System.out.println(child.pStr);
		System.out.println(child.cStr);
	}

}
//메모리에 ParentClass --> ChildClass -->TestMain
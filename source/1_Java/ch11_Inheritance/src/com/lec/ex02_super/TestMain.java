package com.lec.ex02_super;

public class TestMain {
	public static void main(String[] args) {
		//	Child child = new Child(); //문의
		//	System.out.println("i값: "+ child.getI());
		//	System.out.println("j값: "+ child.getJ());
		//	child.setI(10); child.setJ(20); //문의 
		Child child = new Child(10, 20); // 문의
		System.out.println("i값: " + child.getI());
		System.out.println("j값: " + child.getJ());
		child.sum();
	}
}
		//super -->child --> TestMain
		//Point(2차원좌표): x축,y축
		//Point3D(3차원): x축,y축,z축  classpoint3. extends point
package com.lec.ex4_threadN_objectN;

public class ThreadEx2TestMain { //thread로부터 상속받음
	public static void main(String[] args) {
		//t1.run() 수행하는 thread A 생성 / t1.num
		Thread t1 = new ThreadEx2("A"); // 내가 매개변수 있는 생성자 안만들어놨다 . 쓰고 싶으면 그전에 매개변수 있는 생정자 만들어놔야
		//t1.setName("A");
		//t2.run() 수행하는 thread B 생성 / t2.num
		Thread t2 = new ThreadEx2("B");
		t1.start();
		t2.start();     //************왜super를 해도 껴들 수 있는지?********88
	}
	
}

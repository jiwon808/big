package com.lex.ex13final;

public class Animal {
	protected int speed; // animal상속한애를 public로 볼 수 있다

	public void running() { // 뛰는method
		speed += 5;
		System.out.println("뛰고있어요. 현재속도:" + speed);
	}

	public final void stop() { // final를 쓰면 override안됨
		speed = 0;
		System.out.println("멈춤");
	}
}

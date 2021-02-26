package com.lec.ex10;

//매개변수 없는 생성자 없음
public class Parent {
	private int i;

	public Parent(int i) {
//		super(); //object생성자 호출  . 이거 없어도 object로부터 생성자 호출 
		this.i = i;
	}

//getter&setter    Main에서 변수 입력하면 private는 가져올 수 없음. 따라서 getter&setter만듬
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
}

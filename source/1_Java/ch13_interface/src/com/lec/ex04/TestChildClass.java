package com.lec.ex04;

//TestClass로부터 상속받고 ,i11를 구현 받는다 (처음 파일 만들떄 이렇게했다)
public class TestChildClass extends TestClass implements I11 {

	@Override
	public void m11() {
		System.out.println("상수i11=" + i11);

	}

}

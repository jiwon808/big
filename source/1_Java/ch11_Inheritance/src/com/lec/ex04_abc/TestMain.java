package com.lec.ex04_abc;

public class TestMain {
	public static void main(String[] args) {
		S s = new S();
//		A a= new A();
		S a = new A(); // S에는 s가 있다. 따라서 s.a 가능
//		Object a = new A(); //a는 변수 .object형 .object에s는 없다. 따라서a.s x
		System.out.println(a.s);
		S b = new B();
		S c = new C();
		S[] sArr = { new A(), new B(), new C() };
	}
}

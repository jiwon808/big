package com.lec.ex04;

public class Main {
	public static void main(String[] args) {
		TestChildClass test = new TestChildClass(); // 새로운 객체생성?
		System.out.println(test.i1 + "," + test.i2);
		System.out.println(test.i3 + "," + test.i11);
		test.m1();
		test.m2();
		test.m3();
		test.m11();
		TestClass cTest = test; // 구현으로안나오고 ,process과정중 하나
								// ppt slide3을봐; TestClass에는m11이 없고, m11은 I11,TestChildClass에는 있다
								// 그래서 TestClass cTest = test; 를하면 m11이 test에 들어감
		// cTest.m11();
	}

}

package com.lec.ex04;
//i1,i2,i3 
public class TestClass implements I3{

	@Override
	public void m1() {
		System.out.println("상수i1:"+ i1); //I1.i1이 아닌  i1만 쓰는 것은 == 내가 이미  I1을 받았다는 의미 ; 왜냐하면I3에I1을 포함하고 있다
	}

	@Override
	public void m2() {
		System.out.println("상수i2:"+ i2);
		
	}

	@Override
	public void m3() {
		System.out.println("상수i3:"+ i3);
		
	}

}

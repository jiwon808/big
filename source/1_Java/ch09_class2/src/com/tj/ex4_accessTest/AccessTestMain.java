package com.tj.ex4_accessTest;

import com.lec.ex3_accessTest.AccessTest;

public class AccessTestMain {
	public static void main(String[] args) {

		AccessTest obj = new AccessTest();
		//	System.out.println(obj.defaultMember); //상속받은 패키지도 아니고 같은 패키지도 아님
		//	System.out.println(obj.protectedMember);
		System.out.println(obj.publicMember);
		//	obj.defaultMethod();
		//	obj.protectedMethod();
		obj.publicMethod();
	}
}

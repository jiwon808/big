package com.lec.ex3_accessTest;

public class AccessTestMain {
	public static void main(String[] args) {
		AccessTest obj = new AccessTest();
//		System.out.println(obj.privateMember);
		System.out.println(obj.defaultMember); // 겉운 패키지라 가능
		System.out.println(obj.protectedMember); // 같은 패키지거나 상속받은 패키지가눙
		System.out.println(obj.publicMember);
//		obj.privateMethod();
		obj.defaultMethod();
		obj.publicMethod();
	}
}

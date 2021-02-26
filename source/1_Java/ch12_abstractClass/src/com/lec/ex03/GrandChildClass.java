package com.lec.ex03;

public class GrandChildClass extends ChildClass {
	@Override
	public void method1() {
		System.out.println("GrandChild의 method1()");
	}
}

//ChildClass - 추상 method1(), method2(), method3()  
//method1()이 추상변수이기때문에  abstract class GrandChildClass로 하던지, 아니면 method1를 override 하던지    
//만약 abstract class GrandChildClass로하면  일반 변수를 만들 수 없기때문에 , method1를 override함 

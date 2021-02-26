package com.lec.ex4_threadN_objectN;
//B는 계속0, A만 증가
import com.lec.ex3_threadN_object1.ThreadEx;

public class ThreadExTestMain {

	public static void main(String[] args) {
		ThreadEx target1 = new ThreadEx(); // target1.num
		ThreadEx target2 = new ThreadEx();// target2.num
		Thread t1 = new Thread(target1,"A");
		Thread t2 = new Thread(target2,"B"); //target을공유. target안에 있는 num도 공유
		t1.start();
		t2.start();
		System.out.println("main함수 끝"); //B는 A가 증가한거 공유 
		//B가 수행하려고하는데 먼저 출력하려는 순간. A가 껴들여. 
		//num을 공유해서 이렇다 
		//ex. 두사람 동시에 같은 통장에서 500만원 출금하는 상황. 
		//ex.내가 출금할때까지 다른 사람은 접근할 수 없어 야 //근데 이 예제는 아무데서나 껴드는 중 
	}

}
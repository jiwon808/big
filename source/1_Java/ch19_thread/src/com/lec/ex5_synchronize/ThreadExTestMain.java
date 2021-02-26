package com.lec.ex5_synchronize;
//작업객체 1개 가지고 thread N개가 공유
public class ThreadExTestMain {

	public static void main(String[] args) {
		ThreadEx target = new ThreadEx(); 
		Thread t1 = new Thread(target,"A");
		Thread t2 = new Thread(target,"B"); //target을공유. target안에 있는 num도 공유
		t1.start();
		t2.start();
		System.out.println("main함수 끝"); //B는 A가 증가한거 공유 
		//B가 수행하려고하는데 먼저 출력하려는 순간. A가 껴들여. 
		//num을 공유해서 이렇다 
		//ex. 두사람 동시에 같은 통장에서 500만원 출금하는 상황. 
	}

}

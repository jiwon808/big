package com.lec.ex1_runnable;

public class Target implements Runnable {

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName());
		System.out.println("ThreadTarget");
		for(int i=0; i<10; i++) {
			System.out.println(Thread.currentThread().getName()+ "의 i ="+i);
			try {
				Thread.sleep(500); //업치락 뒤치락을 확인하기위해
			} catch (InterruptedException e) {   //why try catch

			}
		} //for

	}//main

}

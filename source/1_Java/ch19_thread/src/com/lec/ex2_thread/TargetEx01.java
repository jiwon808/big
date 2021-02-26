package com.lec.ex2_thread;

public class TargetEx01 extends Thread {
	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			System.out.println("안녕하세요-"+i);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				
			}
		}
	}
}

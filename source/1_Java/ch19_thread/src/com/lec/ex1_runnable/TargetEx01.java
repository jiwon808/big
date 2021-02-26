package com.lec.ex1_runnable;

public class TargetEx01 implements Runnable {

	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			System.out.println("안녕하세요-"+i);
			try {
				Thread.sleep(500); //0.5초 동안 대기상태
			} catch (InterruptedException e) {
				
			} 
		}
		
	}
//interface  안에 추상 메소드
}

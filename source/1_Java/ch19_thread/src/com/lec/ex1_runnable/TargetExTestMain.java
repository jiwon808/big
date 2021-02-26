package com.lec.ex1_runnable;

public class TargetExTestMain {
	public static void main(String[] args) {
		Runnable target01 = new TargetEx01(); //Target Ex01은 Runnable로부터 상속 받음 
											//TargetEx01 target 01 = new TargetEx01();
		Runnable target02 = new TargetEx02();
		
		//A라는 이름의 thread생성 - target01.run()을 수행하는 thread
		Thread threadA = new Thread(target01,"A");
		//B라는 이름의 thread생성 - target02.run()을 수행하는 thread
		Thread threadB = new Thread(target02,"B");
		threadA.start(); //실행해
		threadB.start();//실행해 
		for(int i=0; i<10; i++) {
			System.out.println("나는 "+Thread.currentThread().getName()); //현재 구동중인 thread 이름 뭔지 알려준다
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {

			}	
		}//for
	}//main
}//class

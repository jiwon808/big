package com.lec.ex2_thread;

public class TargetExTestMain {

	public static void main(String[] args) {
		//thread생성-target01.run()을 수행
		Thread target01 = new TargetEx01(); //Target01은 Thread로부터 상속받았기 때문에 
		//Target01을 만들때 매개변수를 안만들어서 ()안에 뭐 치면 안됨 // ***********?********
		//TargetEx01 target01 = new TargetEx01();
		target01.setName("A"); // thread이름 setting   
		//thread생성-target02.run()을 수행
		Thread target02 = new TargetEx02();
		target02.setName("B");
		
		target01.start(); //실행순서는 jvm이 알아서
		target02.start(); //늦게 시작한자는 준비상태로 빠진것
		for(int i=0; i<10; i++) {
			System.out.println("나는 main함수");
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				
			}
		}
		
	}

}

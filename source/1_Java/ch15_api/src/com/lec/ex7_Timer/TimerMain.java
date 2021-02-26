package com.lec.ex7_Timer;

import java.util.Timer;

public class TimerMain {

	public static void main(String[] args) throws InterruptedException {
		System.out.println("시작");
		Timer timer = new Timer(true); // true: 프로그램 종료되면 timer 종료
		// 작업객체 Task
		TimerTaskEx01 task1 = new TimerTaskEx01();
		TimerTaskEx02 task2 = new TimerTaskEx02();
		timer.schedule(task1, 2000); // 2000 ms =2 s 2초 후에 한번 실행
		timer.schedule(task2, 500, 1000); // 0.5초후부터 1초마다 실행
		Thread.sleep(10000); // 10초 대기
		System.out.println("끝");

	}

}
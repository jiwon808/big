package com.lec.ex7_Timer;

import java.util.TimerTask;

//1분 지났어? 실행     			 '작업정의(task)'을 우선 정의
public class TimerTaskEx01 extends TimerTask {
	// 오버라이드 함수 run에 작업정의
	@Override
	public void run() {
		System.out.println("*********작업1 : 2초후에 한번 timer 걸 예정");
	}
}
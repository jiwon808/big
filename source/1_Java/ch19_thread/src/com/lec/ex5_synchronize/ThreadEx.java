package com.lec.ex5_synchronize;
//못껴들게
//thread N개가 작업객체1개를 공유
/*threadA - 작업객체1
  threadB - 작업객체1*/

public class ThreadEx implements Runnable {
	private int num=0;//thread들이 공유하는 변수 //아무말하지 않으면 자동적으로0
	
	@Override
	//synchronized run() 수행 중에는 아무도 못 껴들어   //!!중요 !!
	public synchronized void run() {
		
		for(int i=0; i<10; i++) {
			out();
			
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) { //num객체의private변수.A,B가 공유 

			}
		}//for
	}//main
	
	private synchronized void out() { //out할때만 안껴들여. out다하고 대기걸때만 껴들 수 있어   // 여기에서만 호출할 method여서 private
		String threadName = Thread.currentThread().getName();
		if(threadName.equals("A")) {
			System.out.println("~~~A수행중~~~");
			num++;
		} //만약에A가 이러면,B는 이렇게해라  //*********
		System.out.println(threadName + "의num="+num); //B는 이것만함  //여기까지 못껴들게 !!중요!!//그러면 새로운 매소드 생성해야 
	
	}
}//A가 항상 먼저 나와. 아무도 껴들 수 없어 

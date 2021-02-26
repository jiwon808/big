package com.lec.ex3_threadN_object1;
//thread N개가 작업객체1개를 공유
/*threadA - 작업객체1
  threadB - 작업객체1*/

public class ThreadEx implements Runnable {
	private int num=0;//thread들이 공유하는 변수 //아무말하지 않으면 자동적으로0
	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			String threadName = Thread.currentThread().getName();
			if(threadName.equals("A")) {
				System.out.println("~~~A수행중~~~");
				num++;
			} //만약에A가 이러면,B는 이렇게해라  //*********?******
			System.out.println(threadName + "의num="+num); //B는 이것만함
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) { //num객체의private변수.A,B가 공유 

			}
		}
	}

}

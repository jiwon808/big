package com.lec.ex1_student;

import com.lec.cons.PiClass;

public class WarmUp3 {
	private String no;
	private int inTime;
	private int outTime;
	private int fee;
	private final int HOURLYRATE = 2000; // 상수final는 못바꿔

	public WarmUp3(String no, int inTime) {
		this.no = no;
		this.inTime = inTime;
		System.out.println(no + "님 어서오세요");
		System.out.println("입차시간: " + inTime + "시");
		System.out.println("**********************");

	}

	public void out(int outTime) { // out는 메소드이름
		this.outTime = outTime;
		fee = (outTime - inTime) * PiClass.HOURYRATE;
		System.out.println(no + "님 안녕히 가세요");
		System.out.println("입차시간: " + inTime + "시");
		System.out.println("출차시간" + outTime + "시");
		System.out.println("주차요금" + fee + "원");
		System.out.println("**********************");
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getInTime() {
		return inTime;
	}

	public void setIntime(int inTime) {
		this.inTime = inTime;
	}

	public int getOutTime() {
		return outTime;
	}

	public void setOutTime(int outTime) {
		this.outTime = outTime;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

}

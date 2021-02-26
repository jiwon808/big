package com.lec.ex08Employee;

public abstract class Employee { //문의
	private String name;
	public Employee(String name) {
		this.name = name;
	}
	public abstract int computePay(); //상속받은 애가 override 
	public final int computeIncentive() {
		int pay = computePay();
		if(pay>2000000) {
			return (int)(pay*0.1);
		}
		return 0;
	}
	public String getName() {
		return name;
	}
}

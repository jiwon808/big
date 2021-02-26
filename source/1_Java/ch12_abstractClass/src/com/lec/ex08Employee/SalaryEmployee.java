package com.lec.ex08Employee;
//name, annualSalary, computePay() ; 월급계산. 월급은 연봉/14로 한다
public class SalaryEmployee extends Employee {
	private int annualSalary;
	public SalaryEmployee(String name, int annualSalary) {
		super(name);
		this.annualSalary = annualSalary;
	}
	@Override
	public int computePay() {
		return annualSalary/14;
	}
}
//main함수에서 getter&setter안불러
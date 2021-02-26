package com.lec.ex08Employee;
//이 예시는  return /  int값만 가져온거라서   TestMain에 출력
public abstract class TestMain {
	public static void main(String[] args) {
		Employee[]employees= {
				new SalaryEmployee("홍길동",2400000),
				new SalaryEmployee("박직원", 70000000),
				new SalaryEmployee("윤사원", 12000000),
				new HourlyEmployee("이알바", 100,8500),
				new HourlyEmployee("신알바",120,9000)
		};
//		Employee saralyEmployee = new SalaryEmployee("홍길동",2800); 	
//		Employee hourlyEmployee = new HourlyEmployee("신길동",100,8500);
		for(Employee emp:employees) {
			System.out.println("~ ~ ~ 월급명세서 ~ ~ ~");
			System.out.println("성함: "+emp.getName());  //getName
			System.out.println("월급: "+emp.computePay());
			int incentive = emp.computeIncentive();
			if(incentive!=0) {
				System.out.println("상여금:"+incentive);
			}
		System.out.println("수고하셨습니다");
		}
	}
}
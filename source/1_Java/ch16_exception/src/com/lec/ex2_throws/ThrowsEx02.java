package com.lec.ex2_throws;

public class ThrowsEx02 { // Main에서 이 class를 호출했다
	public ThrowsEx02() throws Exception {
		actionC(); // class안에서 actionC호출
	}

	private void actionC() throws Exception { // class안에서만 사용
		System.out.println("actionC 전반부");
		actionB();
		System.out.println("actionC 후반부");
	}

	private void actionB() throws ArrayIndexOutOfBoundsException {
		System.out.println("actionB 전반부");
		actionA();
		System.out.println("actionB 후반부");
	}

	private void actionA() throws ArrayIndexOutOfBoundsException { // 2.나를 호출한곳 '윗 단계 actionA()'로 던져
		System.out.println("action A 전반부");
		int[] arr = { 0, 1, 2, 3 };
		System.out.println(arr[4]); // 1.Exception 4번방이 존재하지 않기 떄문에
									// Exception이 발생했다 윗단계로 던짐. 그래서 밑에 sysout 출력안됨
		System.out.println("actionA 후반부");
	}
}
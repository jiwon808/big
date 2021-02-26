package com.lec.ex02phone;

public class TestMain {

	public static void main(String[] args) {
//		IAcor ob = new IAcor();  // 불가능. 왜냐하면 interface는 new 못만들어 
		AModel aPhone = new AModel();
		BModel bPhone = new BModel();
		CModel cPhone = new CModel();
		IAcor[] phones = { aPhone, bPhone, cPhone }; // 다 IAcor 타입으로 통일 할 수 있다
		for (IAcor phone : phones) {
			// 객체의 클래스타입
			System.out.println(phone.getClass().getName());
			phone.dmbReceive();
			phone.lte();
			phone.tvRemoteControl();
		}
	}

}

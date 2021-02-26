package com.lec.ex02phone;
//a제품 : DMB송수신불가, 5G, TV리모콘 미탑재
public class AModel implements IAcor {
	private String modelName; 
	public AModel() {
		modelName= "A모델";
	}
	@Override
	public void dmbReceive() {
		System.out.println(modelName+"은 DMB 송수신 불가");

	}

	@Override
	public void lte() {
		System.out.println(modelName +"은5G");

	}

	@Override
	public void tvRemoteControl() {
		System.out.println(modelName+"은TV리모콘 미탑재");

	}

}

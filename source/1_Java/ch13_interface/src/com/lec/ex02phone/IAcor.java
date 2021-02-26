package com.lec.ex02phone;

// A전자에서 A model, B model, C model
public interface IAcor { // 작업명세서
	public void dmbReceive(); // dmb여부 구현은 클래스

	public void lte();

	public void tvRemoteControl();
}

package com.lec.ex06lunch;

public class Child2 extends LunchMenu {

	public Child2(int rice, int bulgogi, int soup, int banana, int almond, int milk) {
		super(rice, bulgogi, soup, banana, almond, milk); // 매개변수없는 생성자 호출안되도록

	}

	@Override
	public int calculate() {
		return getRice() + getBulgogi() + getSoup() + getMilk();
	}

}

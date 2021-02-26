package com.lec.ex06lunch;

//Child1 c = new Child1(300,1000,100,300,800,350); 
public class Child1 extends LunchMenu {

	public Child1(int rice, int bulgogi, int soup, int banana, int almond, int milk) {
		super(rice, bulgogi, soup, banana, almond, milk);
	}

	@Override
	public int calculate() {
		return getRice() + getBulgogi() + getSoup() + getBanana() + getAlmond();
	}

}

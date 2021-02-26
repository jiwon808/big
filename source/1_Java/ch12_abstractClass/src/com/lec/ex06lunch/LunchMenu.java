package com.lec.ex06lunch;
//Child1 c = new Child1(300,1000,100,300,800,350); 

//Child2 c = new Child1(300,1000,100,300,800,350); 
//생성자 만들어놓고 super호출

//[data]
public abstract class LunchMenu {
	private int rice; // 쌀값(1인)
	private int bulgogi; // 불고기값(1인)
	private int soup; // 미역국값(1인)
	private int banana;// 바나나값(1인)
	private int almond; // 아몬드값(1인)
	private int milk;// 우유값(1인)

	// [constructor생성자]
//	public LunchMenu()  객체없는 생성자  API에는 필요 . 여기에서는 없어도 상관없음 // 그리고 new LunchMenu 못만듬. 왜냐하면 abstract 함수가있음. override 무조건해야되어서 
	public LunchMenu(int rice, int bulgogi, int soup, int banana, int almond, int milk) {
		this.rice = rice;
		this.bulgogi = bulgogi;
		this.soup = soup;
		this.banana = banana;
		this.almond = almond;
		this.milk = milk;
	}

	// 식단계산하는 메소드는 추상메소드로
	public abstract int calculate();

	// getter들
	public int getRice() {
		return rice;
	}

	public int getBulgogi() {
		return bulgogi;
	}

	public int getSoup() {
		return soup;
	}

	public int getBanana() {
		return banana;
	}

	public int getAlmond() {
		return almond;
	}

	public int getMilk() {
		return milk;
	}
}
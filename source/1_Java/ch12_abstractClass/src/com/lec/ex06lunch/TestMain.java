package com.lec.ex06lunch;

import com.lec.cons.PriceTable;

public class TestMain {
	public static void main(String[] args) {
		Child1 child1 = new Child1(PriceTable.RICE,
				PriceTable.BULGOGI,PriceTable.SOUP,
				PriceTable.BANANA,PriceTable.MILK,
				PriceTable.ALMOND); 
		Child2 child2 = new Child2(PriceTable.RICE,
				PriceTable.BULGOGI,PriceTable.SOUP,
				PriceTable.BANANA,PriceTable.MILK,
				PriceTable.ALMOND); // 300 이런식으로 말고 따로 가격표, 변수로 만들어. 그러면 숫자다 바꿀필요없고 하나만 바꾸면됨 //그래서 PriceTable만들어야
		System.out.println("child1형 식대: " + child1.calculate());
		System.out.println("child2형 식대: " + child1.calculate());
	}
}

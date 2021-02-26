package com.lec.ex4_Object;

public class Goods {
	private String goodsCode;
	private String goodsName;
	private int price;
	private int stockNum;

	public Goods(String goodCode, String goodName, int price, int stockNum) {
		this.goodsCode = goodCode;
		this.goodsName = goodName;
		this.price = price;
		this.stockNum = stockNum;
	}

	@Override
	public String toString() {
		return goodsName + "(" + goodsCode + ") 의 가격:" + price + "원" + stockNum + "개";
	}

}

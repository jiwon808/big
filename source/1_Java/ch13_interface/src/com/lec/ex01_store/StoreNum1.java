package com.lec.ex01_store;
//extends --> implements    name변수 추가, getter추가
public class StoreNum1 implements HeadQuarterStore {
	private String name; // 매개체있는 생성자로 바뀜
	public StoreNum1(String name) {
		this.name = name;
	}
	@Override
	public void kimchi() {
		System.out.println("김치찌개 4,500원");
	}
	@Override
	public void bude() {
		System.out.println("부대찌개 5,000원");
	}
	@Override
	public void bibib() {
		System.out.println("비빔밥 6,000원");
	}
	@Override
	public void sunde() {
		System.out.println("순대국 안 팔아");
	}
	@Override
	public void bab() {
		System.out.println("공기밥 1,500원");
	}
	public String getName() {
		return name;
	}

}
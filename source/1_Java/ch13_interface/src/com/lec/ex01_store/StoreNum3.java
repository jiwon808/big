package com.lec.ex01_store;
//3호점: 김치찌개-6,000 부대찌개-7,000 비빔밥-7,000 순대국-6,000  공기밥-1,000원
public class StoreNum3 implements HeadQuarterStore {
	private String name;
	public StoreNum3(String name) {
		this.name = name;
	}
	@Override
	public void kimchi() {
		System.out.println("김치찌개 6,000원");
	}
	@Override
	public void bude() {
		System.out.println("부대찌개 7,000원");
	}
	@Override
	public void bibib() {
		System.out.println("비빔밥 7,000원");	
	}
	@Override
	public void sunde() {
		System.out.println("순대국 6,000원");
	}
	@Override
	public void bab() {
		System.out.println("공기밥 1,000원");
	}
	public String getName() {
		return name;
	}
}
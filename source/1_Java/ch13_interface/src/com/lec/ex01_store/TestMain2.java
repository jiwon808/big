package com.lec.ex01_store;
//추상클래스 override강제성 
public class TestMain2 {
	public static void main(String[] args) {
		HeadQuarterStore[] store= {
//				new HeadQuarterStore("==본사=="),
			new StoreNum1("==주택가1호점=="),
			new StoreNum2("==대학가2호점=="),
			new StoreNum3("==증권가3호점==")};
		for(HeadQuarterStore s : store) {
			System.out.println(s.getName());
			s.kimchi();
			s.bude();
			s.bibib();
			s.sunde();
			s.bab();
		}
//		for(int idx=0; idx<store.length; idx++) {
//			System.out.println(store[idx].getName());
//			store[idx].kimchi();
//			store[idx].bude();
//			store[idx].bibib();
//			store[idx].sunde();
//			store[idx].bab();
//		}
	}
}

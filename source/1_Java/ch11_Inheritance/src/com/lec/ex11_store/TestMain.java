package com.lec.ex11_store;

public class TestMain {
	public static void main(String[] args) {
		HeadQuarterStore st = new HeadQuarterStore("==본사==");
		System.out.println(st.getName());
		st.kimchi();
		st.bude();
		st.bibib();
		st.sunde();
		st.bab();
		StoreNum1 st1 = new StoreNum1("==주택가1호점==");
		System.out.println(st1.getName());
		st1.kimchi();
		st1.bude();
		st1.bibib();
		st1.sunde();
		st1.bab();
		StoreNum2 st2 = new StoreNum2("==대학가2호점");
		System.out.println(st2.getName());
		st2.kimchi();
		st2.bude();
		st2.bibib();
		st2.sunde();
		st2.bab();
		StoreNum3 st3 = new StoreNum3("==증권가3호점==");
		System.out.println(st3.getName());
		st3.kimchi();
		st3.bude();
		st3.bibib();
		st3.sunde();
		st3.bab();
		HeadQuarterStore[] store = { st, st1, st2, st3 };
	}
}

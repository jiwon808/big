package com.lec.ex01_store;
//추상(abstract)클래스; 추상메소드가 1개 이상 있는 클래스 
//추상클래스가지고 new만들일 없어 
public interface HeadQuarterStore {

	public void kimchi(); //추상 함수; 함수 선언만함   원래 메소드 선언,구헌 다 함.  
	public void bude();
	public void bibib();
	public void sunde(); 
	public void bab() ;
	public String getName();
}

//interface: 작업명세서 or 객체분세

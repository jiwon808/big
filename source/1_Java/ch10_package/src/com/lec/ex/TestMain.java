package com.lec.ex;

import com.acom.ex.Emp;

public class TestMain {
	public static void main(String[] args) {
		Emp emp = new Emp(101); // acom것
		com.bcom.ex.Emp emp1 = new com.bcom.ex.Emp(); // bcom것 여기는 풀네임, import com.bcom.ex.Emp;할필요없음
	}
}

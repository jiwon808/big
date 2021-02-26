package com.lec.ex;

// 형변환(Type conversion) = 묵시적인 형변환, 명시적인 형변환 
public class VarEx07 {
	public static void main(String[] args) {
		int i1 = 10; // 4byte
		long l1 = 2200000000L;
		l1 = i1; // long 8byte에 4byte짜리 10을 할당하기 위해
					// 4byte짜리 10이 8byte짜리 long형으로 묵시적인 형변환을 함
		double d = i1; // 묵시적인 형변환 할당받은 주소보다 메모리공간이 작을때 /4byte가 8type에 들어갈때
		d = 10.7;
		i1 = (int) d; // 명시적인 형변환
		System.out.print("i1=" + i1);
	}
}
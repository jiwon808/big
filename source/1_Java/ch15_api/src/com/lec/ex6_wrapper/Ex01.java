package com.lec.ex6_wrapper;

public class Ex01 {

	public static void main(String[] args) {
		int i = 10;
		int j = 10;
		if (i == j) {
			System.out.println("i와j는 같다");
		}
		Integer obj1 = new Integer(10); // wrapper class type으로 자동적으로 변환
		Integer obj2 = new Integer(10); // '객체'이기에 주소가 들어있다 ---> 10과함께 메소드들이 들어있다
		if ("Hello".equals(i)) {
			System.out.println("같다");
		} else {
			System.out.println("같지 않다");
		}
		if (obj1.equals(obj2)) {
			System.out.println("obj1과obj2의 데이터는 같다");
		}
//		int total = obj1.intValue() + obj2.intValue();    //obj1안에 있는 int값을 가져옴
		int total = obj1 + obj2;
	}

}
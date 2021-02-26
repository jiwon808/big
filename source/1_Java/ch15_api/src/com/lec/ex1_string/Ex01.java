package com.lec.ex1_string;

public class Ex01 {
	public static void main(String[] args) {
		String str1 = "java";
		String str2 = "java";
		String str3 = new String("java"); // 무조건 객체생성
//		'변수안에 들어 있는 값' 같니?
		if (str1 == str2) {
			System.out.println("str1과str2는 같은 주소");
		} else {
			System.out.println("str1과str2는 다른 주소");
		}

		str1 = "java2"; // str1은 이제는 java의 주소를 가리키지 않고, java2의 주소를 가리키고 있다 (메모리 안에 주소들 쫙있다. String java도
						// 이를 표시하는 주소가 있음.몇byte)
		if (str1 == str2) {
			System.out.println("str1과str2은 같은 주소");
		} else {
			System.out.println("str1과str2은 다른 주소");
		}
		System.out.println(str1); // '=='는 주소물어봄. 'equals'는 그 안에 들어간 string data가 같는지 물어봄
	}
}

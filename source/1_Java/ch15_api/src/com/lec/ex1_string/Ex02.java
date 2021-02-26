package com.lec.ex1_string;

// 다양한 String의 method들 
public class Ex02 {
	public static void main(String[] args) {

		String str1 = "abcXabc";
		String str2 = new String("ABCXabc");
		String str3 = " ja va ";
		System.out.println("1." + str1.concat(str2)); // abcXabcABCXabc
		System.out.println("2." + str1.substring(3)); // java,javascrtipt,python 첫숫자는 0 ,그래서4번째 숫자인 X부터끝까지
		System.out.println("3." + str1.substring(3, 5));// 3번째부터 5번째 앞까지 Xa
		System.out.println("4." + str1.length()); // 문자길이(7)
		System.out.println("5." + str1.toUpperCase()); // 대문자로
		System.out.println("6." + str2.toLowerCase());// 소문자로
		System.out.println("7." + str1.charAt(3)); // 3번index 문자하나 character at
		System.out.println("8." + str1.indexOf("b")); // 첫b의 index
		System.out.println("9." + str1.indexOf("b", 3)); // 3 index부터 나오는 첫b의 index ==X뒤에 나오는 b 는 5번째 index
		System.out.println("10." + str1.lastIndexOf("b")); // 마지막b index
		System.out.println("11." + str1.indexOf("z"));// 없으면 -1
		System.out.println("12." + str1.equals(str2)); // true | false 대소문자구분 있음
		System.out.println("13." + str1.equalsIgnoreCase(str2));// 대소문자 구분 없이
		System.out.println("14." + str3.trim()); // 좌우space제거
		System.out.println("15." + str1.replace('a', '뭉')); // a대신에 뭉
		System.out.println("16." + str1.replace("ab", "바꿔"));
		System.out.println("최종strl:" + str1);
	}
}

package com.lec.ex4_Object;

public class PersonMain {
	public static void main(String[] args) {
		String str1="java";
		String str2= new String("java");
		if(str1.equals(str2)) {        //equals는 String으로부터 override
			System.out.println("str1과str2는 같은 문자열이다");
		}else {
			System.out.println("str1과str2는 다른 문자열이다");
		}
		Person p1 = new Person(9811111111111L);
		Person p2 = new Person(9811111111111L);
		if(p1.equals(p2)) {
			System.out.println("같은 객체다");
		}else {
			System.out.println("다른 객체다");
		}//if
	}
}

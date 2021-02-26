package com.lec.ex3_set;
//hash는key를 set는data를
//string이 같으면 안됨 . key는 유일해야 (여기서 전화번호 다 달라)
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class CustomerMain {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String answer, name, phone, address;
		HashMap<String,Customer> hashmap = new HashMap<String, Customer>();
		hashmap.put(010-9999-9999 , customer);
		hashmap.put(010-8888-8888 , "김마동 서울시 종로구");
		
		if (answer.equalsIgnoreCase("y")) { // 회원가입 진행
			System.out.println("가입하실 회원님 이름은?");
			name = scanner.next();
			System.out.print("가입하실 회원님 전화번호는?");
			phone = scanner.next();
			System.out.print("가입하실 회원님 주소는?");
		address= scanner.nextLine();
		customers.put(phone,new Customer(name,phone,address));
		}
	}
		scanner.close();
		if(customers.isEmpty()) {
		System.out.println("가입한 회원이 없습니다");
	}
	}else {
		System.out.println("가입한 회원 리스트 목록");
		Iterator<String> iterator = customers.keySet().iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println( customers.get(key)); //!중요
		}//if

	}//main

}//class

package com.lec.ex2_map;

public class Customer {
	private String name;
	private String phone;
	private String address;

	// new Customer("홍길동","010-9999-9999", "서울시 용산구")
	public Customer(String name, String phone, String address) {
		this.name = name;
		this.phone = phone;
		this.address = address;
	}

	@Override
	public String toString() {
		return name + "\t" + phone + "\t" + address;
	}
}

//data, constructor, override / customer arraylist  do while문         \n전까지 
//차곡차곡 쌓아도되. 중복있어도 상관없음. 그래서 arraylist
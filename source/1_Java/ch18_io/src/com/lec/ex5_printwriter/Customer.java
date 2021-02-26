package com.lec.ex5_printwriter;

public class Customer {
	private String name;
	private String phone;
	private String birthday;
	private String address;
	public Customer(String name, String phone, String birthday, String address) {
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.address = address;
	}
	@Override
	public String toString() {
		return name+ "\t" + phone+ "\t" + birthday+"생" + "\t" + address+ "\r\n";
	}
}

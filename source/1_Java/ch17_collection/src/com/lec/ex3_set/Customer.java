package com.lec.ex3_set;

public class Customer {
	private String name;
	private Customer phone;
	private Customer address;
	public Customer(String name, String phone, String address) {
		this.name = name;
		this.phone = phone;
		this.address = address;
	}
	@Override
	public String toString() {
		return return name+ "\t"+phone+"\t"+address;
}

	//string.equals()
	//equals를 그냥써
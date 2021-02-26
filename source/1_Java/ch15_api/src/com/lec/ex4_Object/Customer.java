package com.lec.ex4_Object;

public class Customer {

	private String tel;
	private String name;
	private int point;
	private int amount;

	public Customer(String tel, String name) {
		this.tel = tel;
		this.name = name;
		this.point = 3000;
		// System.out.println("회원가입 감사합니다. 3,000점 포인트 넣어드렸습니다.");
	}

	@Override
	public String toString() {
		String post = tel.substring(tel.lastIndexOf("-") + 1);
		return name + "(" + post + ")" + "포인트: " + point + "재고: " + amount;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj != null && obj instanceof Customer) {
			return tel.equals(((Customer) obj).tel);
		}
		return false;
	}
}

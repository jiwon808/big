package com.tj.Account;

public class BoxOrRectMain {
	public static void main(String[] args) {
		BoxOrRect box = new BoxOrRect(5, 6, 10);
		BoxOrRect rect = new BoxOrRect(10, 5);

		box.callNsetVolume(); // calculateVolume
		System.out.println("박스 부피: " + box.getVolume());
		rect.callNsetVolume();
		System.out.println("rect넓이: " + rect.getVolume());
	}// main
}

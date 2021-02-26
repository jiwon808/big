package com.lec.ex4_Object;

public class Rectangle {
	private int width;
	private int height;
	private String color;

//	public Rectangle()=            //이거 안적으면 null 값
	public Rectangle(int width, int height, String color) {
		this.width = width;
		this.height = height;
		this.color = color;
	}

	@Override
	public boolean equals(Object obj) { // ?
		if (this == obj) {
			return true;
		}
		if (obj != null && obj instanceof Rectangle) {
			boolean widthChk = this.width == ((Rectangle) obj).width; // the == operator compares the two objects to see
																		// if they point to the same memory location;
																		// while the . equals() method actually compares
																		// the two objects to see if they have the same
																		// object value.
			boolean heightChk = this.height == ((Rectangle) obj).height; // obj는 바로 obj.height가 안됨. 따라서 obj를 Rectangle변수
																			// 타입을 가지게함 --> 여기서 Rectangle 는 int랑 비슷한 역할.
																			// 변수 타입
			boolean colorChk = this.color.equals(((Rectangle) obj).color); // color가 String형이여서 equals로해야
																			// //((Rectangle)obj) 의 color
			return widthChk && heightChk && colorChk;
		}
		return false;
	}

	@Override // object 클래스를 override. 왜냐하면 object class에 있는 format이 가독성이 떨어져서
	public String toString() {
		return "가로: " + width + "\t" + "새로: " + "\t" + height + "\t" + "컬러: " + color;
	}
}
package com.lec.ex4_Object;

public class Person {
	private long juminNo;// ex.980812-1234568
	// 생성자

	public Person(long juminNo) {
		this.juminNo = juminNo;
	}

	@Override // equals ctrl+space
	public boolean equals(Object obj) {
		// Person p3;
		// p1.equals(p3) -> false / p1.equals(str1) ->false
		// p1.equals(p2) -->this는 p1, obj는p2
		// this.juminNo와 obj.juminNo같으면 true를 return
		if (obj != null && obj instanceof Person) { // 객체가 Person형이어야 한다
			// juminNo == obj.juminNo 여부 return
			return juminNo == ((Person) obj).juminNo;
		} else {
			return false;
		}
	}// equals
}// class

package com.lec.ex3_set;

//이름, 학년  new Student("홍길동",5);
public class Student {
	private String name; // set에 student type의 객체를 넣어
	private int grade;
	private boolean nameChk;

	public Student(String name, int grade) {
		this.name = name;
		this.grade = grade;
	}

	@Override
	public String toString() {
		return name + ":" + grade; // "홍길동:5"
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj != null && obj instanceof Student) {// name,grade비교
			boolean nameChk = name.equals(((Student) obj).name);
			boolean gradeChk = grade == ((Student) obj).grade;
			return nameChk && gradeChk;
			// return toString().equals(obj.toString());
		} // if
		return false;
	}// equals

	@Override
	public int hashCode() {
		return toString().hashCode(); // "장보고:1" //toString결과 같으면 같은 주소return
	}
}
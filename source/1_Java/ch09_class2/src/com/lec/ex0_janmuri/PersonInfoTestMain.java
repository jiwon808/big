package com.lec.ex0_janmuri;

class PersonInfo {
	private String name;
	private int age;
	private char gender; // 성별 '남', '여'

	public PersonInfo() {
	} // 생성자가 없을 경우만 디폴트 생성자는 JVM이 생성함. void는 생성자 아님

	public PersonInfo(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	} // 생성자 오버로딩

	public void print() {
		System.out.println("이름=" + name + "\t나이=" + age + "\t성별=" + gender); // "\t" == add tab tab은8글자씩 끊어
	}

	// 밑 다른 방법
	public String infostring() {
		String result = "이름=" + name + "\t나이=" + age + "\t성별=" + gender;
		return result; // 이거 안고 호출해줘
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public void setAge(int age) {
		this.age = age;
	}
}

public class PersonInfoTestMain {
	public static void main(String[] args) {
		int[] iArr = { 10, 20, 30 }; // 배열이 memory에 잡힘
		PersonInfo[] person = { new PersonInfo("홍길동", 20, '남'), new PersonInfo("홍길숙", 22, '여'), new PersonInfo() }; // 배열
		person[2].setName("홍길숙");
		person[2].setAge(21);
		person[2].setGender('여');
		for (PersonInfo p : person) {
			p.print();
			System.out.println(p.infostring());
		}
//		for(int i=0; i<person.length; i++) {
//			System.out.println(person[i].infostring());
//			//or  
//			person[i].print();
//		}
	}
}

//PersonInfo p = new PersonInfo("홍길동",22,'남'); // 앞에는 '변수' 메모리에 공간만 생김. 뒤에'객체'까지 치면 메모리에 내용들어감 
//p.print(); //다시 나를 호출한 곳으로 돌아와
//System.out.println(p.infoString()); //정보들을 출력하는 것이 아니면 위에 println에 들어가는 있는 것들을  return

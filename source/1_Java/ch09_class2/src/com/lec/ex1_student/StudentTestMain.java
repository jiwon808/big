package com.lec.ex1_student;

public class StudentTestMain {
	public static void main(String[] args) {
//		int[] iArr = {90,90,90,"kor"+"eng"+"math","kor"+"eng"+"math"/3}
		Student[] student = { new Student("정우성", 90, 90, 90), new Student("김하늘", 90, 90, 91),
				new Student("황정민", 80, 80, 80), new Student("강동원", 80, 80, 80), new Student("유아인", 70, 70, 70) };
		String[] title = { "이름", "국어", "영어", "수학", "총점", "평균" };
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("\t\t\t\t 성적표");
		System.out.println("\t--------------------------------------------------");
		for (String t : title) {
			System.out.print("\t" + t);
		}
		System.out.println();
		System.out.println("\t--------------------------------------------------");
		for (Student s : student) {
			s.print();
		}
		System.out.println();
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
	}

}

//
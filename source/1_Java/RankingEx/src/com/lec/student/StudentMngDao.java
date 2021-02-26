package com.lec.student;

import java.util.ArrayList;
import java.util.Scanner;

public class StudentMngDao {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		StudentDao dao = StudentDao.getInstance();
		String fn;
		ArrayList<StudentDto> student;
		do {
			System.out.println("1:입력 |2:학과별 출력 |3:전체출력  |4:제적당한 학생 출력 |그외:종료");
			fn = scanner.next();
			switch (fn) {
			case "1":
				System.out.print("입력할 학생 이름?");
				String sName = scanner.next();
				System.out.print("입력할 학과?");
				String mName = scanner.next();
				System.out.print("입력할 점수?");
				int score = scanner.nextInt();
				if(score<0 || score>100) { //***************중요*******이거필요**************
					System.out.println("유효하지 않은 점수를 입력하셔서 입력 불가합니다");
					continue;
				}
				StudentDto newStuent = new StudentDto(sName, mName,score);
				int result = dao.insertStudent(newStuent); //입력끝
				System.out.println(result == StudentDao.SUCCESS ? "입력성공":"입력실패");
				break;

			case "2":
				System.out.print("조회할 학과는(빅데이터학|경영정보학 |컴퓨터공학 |소프트웨어학 |인공지능학 |)?");
				mName = scanner.next();
				student = dao.selectmName(mName);
				if(student.size()!=0) {
					System.out.println("등수\t이름\t학과\t점수");
					for(StudentDto s:student) {
						System.out.println(s);    //********?******
					}
				}else {
					System.out.println("해당 학과명의 학생은 없습니다");
				}
					
				break;
			
			case "3":
				student = dao.selectStudent();
				if(student.size()!=0) {
					System.out.println("등수\t이름\t학과\t점수");
					for(StudentDto s:student) {
						System.out.println(s);    //********?******
					}
				}else {
					System.out.println("해당 학과명의 학생은 없습니다");
				}
				break;
				
			case "4":
				student = dao.selectExpel();
				if(student.size()!=0) {
					System.out.println("등수\t이름\t학과\t점수");
					for(StudentDto s:student) {
						System.out.println(s);    //********?******
					}
				}else {
					System.out.println("해당 학과명의 학생은 없습니다");
				}
				break;
				
			}
			
		}while(fn.equals("1")||fn.equals("2")||fn.equals("3")||fn.equals("4"));
			System.out.println("BYE");

	}

}

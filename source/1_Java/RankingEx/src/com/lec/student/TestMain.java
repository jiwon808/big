package com.lec.student;

import java.util.ArrayList;

public class TestMain {

	public static void main(String[] args) {
		StudentDto dto = new StudentDto("정우성","빅데이터학",90); //******
				//String sNo, String sName, String mName, int score, int sExpel
		StudentDao dao = StudentDao.getInstance();
		int result = dao.insertStudent(dto);
		System.out.println(result == StudentDao.SUCCESS? "입력성공":"입력실패");
		
		System.out.println("----------------2번test--------------");
		ArrayList<StudentDto> dtos = dao.selectmName("빅데이터학");
		if(dtos.size()==0) {
			System.out.println("해당학과 학생이 없습니다");
		}else {
			for(StudentDto d:dtos)
					System.out.println(d);
		}
		
		System.out.println("----------------3번test--------------");
		dtos = dao.selectStudent();
		if(dtos.isEmpty()) {
			System.out.println("등록된 사람이 없습니다.");
		}else {
			for(StudentDto d:dtos)
				System.out.println(d);
		}
		
		System.out.println("----------------4번test--------------");	
		dtos = dao.selectExpel();
		if(dtos.isEmpty()) {
			System.out.println("등록된 사람이 없습니다.");
		}else {
			for(StudentDto d:dtos)
				System.out.println(d);
		}
			
	}

}

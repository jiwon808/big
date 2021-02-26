package com.lec.person_dao;

import java.util.ArrayList;

public class TestMain {

	public static void main(String[] args) {
		PersonDto dto = new PersonDto("홍길동","배우",99,99,99); //dao에 시키기 (1-7단계 만드는대신)
		PersonDao dao = PersonDao.getInstance();
		int result = dao.insertPerson(dto);
		System.out.println(result == PersonDao.SUCCESS? "입력성공":"입력실패");
		System.out.println("-----------------2번 test---------------");
		ArrayList<PersonDto> dtos = dao.selectJname("배우");
		if(dtos.size()==0) {
			System.out.println("배우가 없습니다.");
		}else {
			
			for(PersonDto d:dtos)
				System.out.println(d);
		}
		System.out.println("-----------------3번 test---------------");
		dtos = dao.selectAll();
		if(dtos.isEmpty()) {
			System.out.println("등록된 사람이 없습니다.");
		} else {
			for(PersonDto d:dtos)
				System.out.println(d);
		}
	}

}

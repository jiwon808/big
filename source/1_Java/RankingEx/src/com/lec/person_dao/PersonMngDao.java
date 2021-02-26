package com.lec.person_dao;
//driver필요없음  다dao에게
//scanner 이름,직업,넘버 
//fn 1,2,3
//테이블 하나 가지고 쓰기 때문에  DAO하나만 만들었다

// 예전에는program에서 1-7단계. 너무길다. 160줄   --> dao로하면 program과 dao 두개로 나눠져 가독성이 높다.

import java.util.ArrayList;

//실제프로젝트 DAO 10개,20개 

import java.util.Scanner;

import com.lec.person.person;

public class PersonMngDao {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	PersonDao dao = PersonDao.getInstance();      //어제new못하게singleton으로 만들었다
	String fn;
	ArrayList<PersonDto> person;
	do {
		System.out.println("1:입력 | 2:직업별출력 | 3.전체출력 | 그외: 종료>");
		fn = scanner.next();
		switch (fn) {
		case "1": // 이름, 직업명, 국영수 입력받아 dao.insertPerson()호출
			System.out.print("입력할 이름?");
			String name =scanner.next();
			System.out.print("입력할 직업?");
			String jname = scanner.next();
			System.out.print("입력할 국어점수는?");
			int kor = scanner.nextInt();
			System.out.print("입력할 영어점수는?");
			int eng = scanner.nextInt();
			System.out.print("입력할 수학점수는?");
			int math = scanner.nextInt();
			PersonDto newPerson = new PersonDto(name,jname,kor,eng,math);     //PersonDao.java에서 1번 insertPeson (PersonDto dto)
			int result = dao.insertPerson(newPerson); //입력끝
			System.out.println(result == PersonDao.SUCCESS ? "입력성공":"입력실패"); //1보다 SUCCESS가 가독성이 높아
			break;

		case "2":  //직업명 입력받아 dao.selectJname() 호출하여 결과출력
			System.out.print("조회할 직업명은(배우|가수)? ");
			jname = scanner.next(); //위에서jname변수 선언을해서 여기서 또 선언할 필요없음
			person = dao.selectJname(jname); //jname에 있는 애들 뽑아봐. -->arraylist에 return  //person만 출력하면되어서 짜는게 훨씬 짧아져
			if(person.size()!=0) {
				System.out.println("등수\t이름\t직업\t국어\t영어\t수학\t총점");
				for(PersonDto p:person) {
					System.out.println(p);
				}
			}else {
				System.out.println("해당 직원명의 인원이 없습니다.");
			}
			break;
			
		case "3":  //dao.selectAll() 호출하여 결과출력
			person = dao.selectAll(); //jname에 있는 애들 뽑아봐. -->arraylist에 return  //person만 출력하면되어서 짜는게 훨씬 짧아져
			if(person.size()!=0) {
				System.out.println("등수\t이름\t직업\t국어\t영어\t수학\t총점");
				for(PersonDto p:person) {
					System.out.println(p);
				}
			}else {
				System.out.println("해당 직원명의 인원이 없습니다.");
			}
			break;
		}
		
	}while(fn.equals("1")||fn.equals("2")||fn.equals("3"));
	System.out.println("BYE");
	}
}

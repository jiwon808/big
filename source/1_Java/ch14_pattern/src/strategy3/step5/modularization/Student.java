package strategy3.step5.modularization;

import strategy3.step5.component.*;

//교육생 :  수업을 듣고 공부합니다(JobStudy). 교육급여를 받습니다(GetStudentPay). 	ID,이름,반을 출력함
public class Student extends Same_Part {
	private String ban;

	public Student(String id, String name, String ban) { // !!복습
		super(id, name); // !!복습
		this.ban = ban; // !!복습
		setJob(new JobStudy());
		setGet(new GetStudentPay());
	}

	@Override
	public void print() {
		super.print(); // ?
		System.out.println("\t[반]" + ban); // !!중요 복습
	}

	@Override
	public String toString() {
		return super.toString() + ("\t[반]" + ban); // !!중요 복습
	}

}// main
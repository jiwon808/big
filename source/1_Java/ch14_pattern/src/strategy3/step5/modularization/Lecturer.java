package strategy3.step5.modularization;

//강의를 합니다(JobLec).             월급을 받습니다(GetSalary).       	ID,이름,과목을 출력함
import strategy3.step5.component.*;

public class Lecturer extends Same_Part {
	private String subject;

	public Lecturer(String id, String name, String subject) {// !!중요 복습 TestMain과 형식 같기 위해
		super(id, name);// !!중요 복습
		this.subject = subject;
		setJob(new JobLec());
		setGet(new GetSalary());
	}

	@Override
	public void print() {
		super.print();
		System.out.println("\t[과목]" + subject);
	}

	@Override
	public String toString() { // !!중요 복습
		return super.toString() + "\t[과목]" + subject;
	}

}